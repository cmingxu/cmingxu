class Order < ActiveRecord::Base
  # 根据周日下午交流
  ORDER_STATUS = {0 => "未付款",1=> "已付款",2 => "已发货",3 => "取消交易流程" ,4 => "冻结中",5 => "交易完成",6 => "非正常结束订单，由聚买卖关闭"}
  # 支付状态
  PAYMENT_STATUS = {0 => "未支付", 1 => "已支付"}
  # 物流状态
  DELIVER_STATUS = {0 => "未发货",1 => "已发货", 2=> "已确认收货"}
  # 取消交易状态
  ORDER_CANCEL_STATUS = {0 => "无取消交易申请",1 => "申请取消交易中",2 => "取消交易被拒绝", 3=> "商户同意取消交易", 4 => "商户确认可取消交易并退款"}
  FINAL_PAYMENT_STATUS = {0 => "无需操作",1 => "未给买家退款",2 => "已为买家退款",3 => "未给卖家付款",4 => "已为卖家付款"}

  # 做权限验证用
  def can_be_access_by(user)
    return true if user.has_role?('admin')
    return true if (self.user.id == user.id or self.seller_user.id == user.id)
  end

  # 同意取消交易, 可以退款 ,需要确认
  def agree_and_return_money 
    self.change_order_cancel_status(3,4)
    self.change_order_status(3,6)
    self.change_final_payment_status(0,1)
  end


  # 同意取消交易 
  def agree_cancel  
    self.change_order_cancel_status(1,3)
  end

  # 不同意取消交易
  def disagree_cancel
    self.change_order_cancel_status(1,2)
    self.change_order_status(3,4)
  end


  # 确认收货 
  def confirm_receive 
    self.change_order_status(2,5)
    self.change_deliver_status(1,2)
    self.change_final_payment_status(0,3)
  end


  # 已发货 
  def confirm_deliver 
    self.change_order_status(1,2)
    self.change_deliver_status(0,1)
  end


  # 取消交易
  def cancel
    if self.order_status == 1 # 支付后取消交易
      self.change_order_status(1,3)
    elsif self.order_status == 2 # 发货后取消交易
      self.change_order_status(2,3)
    end
    self.change_order_cancel_status(0,1)
  end

  # 继续交易 
  def continue
    if self.deliver_status == 1
      self.change_order_status(3,2)
    elsif self.deliver_status == 0
      self.change_order_status(3,1)
    end
    self.change_order_cancel_status(1,0)
  end



  #未付款
  def weifukuan?
    self.order_status == 0
  end

  attr_protected :order_status,:payment_status,:deliver_status,:price,:total_price,:money_return_status 

  belongs_to :user
  belongs_to :deal
  belongs_to :seller
  has_one :seller_user,:through => :seller,:class_name => "User",:source => "user"
  has_many :logs,:class_name => "OrderChangeLog"
  has_one :ticket

  # 有效的订单， 经过确认的
  named_scope :valid_orders,:conditions => "order_status in (1,3)"

  after_create :set_defaults
  def set_defaults
    self.count = 1 unless self.count
    self.price = self.deal.value
    self.total_price = self.deal.value * self.count
    self.order_status = 0
    self.payment_status = 0
    self.deliver_status = 0
    self.order_cancel_status = 0
    self.save
  end



  # 确认付款(支付宝)
  def confirm_payment(amount)
    self.payment_time = Time.now # 记录支付时间
    if amount >= self.total_price
      self.change_order_status(0,1)
      self.change_payment_status(0,1)
    else
      self.change_order_status(0,4) #冻结中， 这块原因是支付有问题。金额问题 
    end
  end

  # ===== the fllowing code deal with conditions when seller did not confirm
  # delivery after user has payment for a fixed time that system define
  class << self
    # 用户付款一段时间， 商家没有发货
    def reap_orders_user_confirm_payment
      p "in reap_orders_user_confirm_payment"
      days = Setting.seller_should_confirm_deliver_after
      # 支付时间在n天之前， 支付状态为已支付， 订单状态为已付款， 未发货
      # TODO 这个地方还应该有一个就是支付的东西
      Order.find(:all,:conditions => ["payment_time < ? and payment_status = 1 and order_status =  1",
                 days.days.ago]).each do |order|
        # change order status to 6# 非正常结束订单
        order.change_order_status(1,6)
        order.save

                 end
    end

    # 商家发货， 用户没有确认收货
    def reap_order_user_did_not_confirm_receive
      p "in reap_order_user_did_not_confirm_receive"
      days = Setting.user_should_confirm_receive_after
      Order.find(:all,
                 :conditions => ["deliver_status = 1 and order_status = 2 and delivery_time < ?",
                   days.days.ago]).each do |order|
        # change order status to 5正常结束订单
        order.change_order_status(1,5)
        order.change_deliver_status(1,2)
                   end

    end
  end



  # 订单状态跃迁
  def change_order_status(from,to)
    raise Exception,"输入参数不正确" if self.order_status != from
    self.order_status = to
    self.save_order_status_log(from,to,"order_status")
    self.save(false)
  end

  #  
  def change_order_cancel_status(from,to)
    raise Exception,"输入参数不正确" if self.order_cancel_status != from
    self.order_cancel_status = to
    self.save_order_status_log(from,to,"order_cancel_status")
    self.save(false)
  end


  # 支付状态跃迁
  def change_payment_status(from,to)
    raise Exception,"输入参数不正确" if self.payment_status != from
    self.payment_status = to
    self.save_order_status_log(from,to,"payment_status")
    self.save(false)
  end

  # 发货状态跃迁
  def change_deliver_status(from,to)
    raise Exception,"输入参数不正确" if self.deliver_status != from
    self.deliver_status = to
    self.save_order_status_log(from,to,"deliver_status")
    self.save(false)
  end


  # 最终支付状态 
  def change_final_payment_status(from,to)
    raise Exception,"输入参数不正确" if self.final_payment_status != from
    self.final_payment_status = to
    self.save_order_status_log(from,to,"final_payment_status")
    self.save(false)
  end


  def save_order_status_log(from,to,type)
    OrderChangeLog.create do |log|
      log.who_id = User.current_user.id
      log.who = User.current_user.login
      log.order_id = self.id
      log.from_status = from
      log.to_status = to
      log.which_status = type
    end
  end
end







# == Schema Information
#
# Table name: orders
#
#  id                   :integer(4)      not null, primary key
#  deal_id              :integer(4)
#  seller_id            :integer(4)
#  seller_name          :string(255)
#  count                :integer(4)
#  price                :decimal(10, 2)
#  total_price          :decimal(10, 2)
#  reciver_address      :string(255)
#  receiver_name        :string(255)
#  postal_code          :string(255)
#  mobile               :string(255)
#  tel                  :string(255)
#  remark               :text
#  order_status         :integer(4)
#  payment_status       :integer(4)
#  deliver_status       :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#  user_id              :integer(4)
#  deliver_company      :string(255)
#  deliver_code         :string(255)
#  order_cancel_status  :integer(4)
#  payment_time         :datetime
#  deliver_time         :datetime
#  final_payment_status :integer(4)
#

