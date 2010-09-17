class Deal < ActiveRecord::Base
  has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  AUDIT_STATUS = {0 => "未审核", 1=> "申请中",2 => "审核通过",3 => "审核不过"}
  DEAL_STATUS = {0 => "未开始", 1 => "进行中",2 => "已成功结束",3 => "已关闭"}
  DEAL_COUNT_STATUS = {0 => "未达人数最低要求",1 => "已达人数最低要求",3 => "已达人数最高上限"}


  # 第一列为标识，第二列状态， 第三列显示给商户的状态，第四列显示给管理员的状态
  STATUS_MAP = [
    ["weishenqing",{:audit_status => 0},"未申请开团","未申请开团"],
    ["yishenqing_daishenhe",{:audit_status => 1},"已申请开团","申请开团"],
    ["shenhe_butongguo",{:audit_status => 3},"审核不通过","审核未通过"],
    ["shenhetongguo_weikaishi",{:audit_status => 2,:deal_status => 0},"审核通过，等待开团","待开团项目"],
    ["jinxingzhong",{:audit_status => 2,:deal_status => 1},"进行中","进行中项目"],
    ["renshubugou_yiquxiao",{:audit_status => 2,:deal_status => 3,:deal_count_status => 0},"人数不够，已取消","人数不足，未开团"],
    ["yichengtuan",{:audit_status => 2,:deal_status => 3},"人数足够，已成团","人数足够，已成团"]
  ]

  after_create :set_default_status

  # 做权限验证用
  def can_be_access_by(user)
    return true if user.has_role?('admin')
    return true if self.user.id == user.id   
  end


  # 未申请开团
  def weishenqing?
    self.audit_status == 0
  end

  # 已申请，等待审核中
  def yishenqing_daishenhe?
    self.audit_status == 1
  end

  # 审核不通过
  def shenhe_butongguo?
    self.audit_status == 3
  end

  # 审核通过，未开始
  def shenhetongguo_weikaishi?
    self.audit_status == 2 and self.deal_status == 0
  end

  # 进行中
  def jinxingzhong?
    self.audit_status == 2 and self.deal_status == 1
  end

  # 人数不够 
  def renshubugou_yiquxiao?
    self.audit_status == 2 and self.deal_status == 2
  end

  # 人数足够
  def yichengtuan?
   self.audit_status == 2 and self.deal_status == 3  
  end


  

  belongs_to :seller
  has_many :orders
  has_one :user,:through => :seller

  # 未开团
  named_scope :unopens,:conditions => {:deal_status => 0}
  # 运行中
  named_scope :runnings,:conditions => {:deal_status => 1}
  named_scope :ended,:conditions => {:deal_status => 2}
  # 未申请开团
  named_scope :unapplies,:conditions => {:audit_status=> 0}


  validates_presence_of :seller_id,:message => "不能为空"
  validates_presence_of :title,:message => "不能为空"
  validates_presence_of :start_date,:message => "不能为空"
  validates_presence_of :end_date,:message => "不能为空"
  validates_presence_of :value,:message => "不能为空"
  validates_presence_of :max_buy,:message => "不能为空"
  validates_presence_of :buy_limit,:message => "不能为空"
  validates_numericality_of:value,:greater_than => 0.0,:message => "必须为数字"


  # 线下交易, 线下交易和线上交易的订单处理流程不一样。
  # 线下交易发送团购券
  def is_off_line?
    true
  end

  #线上交易 
  def is_online?
    not self.is_off_line?
  end

  #TODO validate

  class << self
    def switch_status
      Rails.logger.debug "this method called"
      # 找到所有的开团时间到但是未开团的项目
      to_switch_deals = self.find(:all,:conditions =>["audit_status = 2 and deal_status = 0 and start_date < ? and end_date > ?", Time.now,Time.now ] )
      to_switch_deals.each do |d|
        d.start_deal
        Rails.logger.debug "[#{d.title}] 开团了。"
      end
      # 找到已经开团， 结束时间到的项目
      to_switch_deals = self.find(:all,:conditions =>["audit_status = 2 and deal_status = 1  and end_date < ?",Time.now ]).collect(&:end_deal)
      to_switch_deals.each do |d|
        d.end_deal 
        Rails.logger.debug "[#{d.title}] 时间截止，结束。 "
      end
    end


    # generate tuangouquan
    def generate_tuan_quan
      find(:all,:conditions => "").each do |deal|
        deal.generate_tuan_quan
      end
    end
  end

  # 生成团购券的具体代码
  def generate_tuan_quan
    self.valid_orders.each do |order|
      
    end
  end

  def set_default_status
    self.audit_status = 0
    self.deal_status = 0
    self.save(false)
  end

  # 提请审核
  def want_open
    self.change_audit_status(0,1)
  end

  # 商户取消申请
  def do_not_want_open
    self.change_audit_status(1,0)
  end


  # 可以开团
  def can_open
    self.change_audit_status(1,2)
  end

  # 不可以开团
  def can_not_open
    self.change_audit_status(1,3)
  end

  # 开始开团
  def start_deal
    self.change_deal_status(0,1)
  end

  # 结束团购项目
  def end_deal
    sum = 0
    self.orders.valid_orders.inject(sum) {|sum,order| sum += order.count}
    if sum >= self.buy_limit 
      self.change_deal_status(1,2)
    else
      self.change_deal_status(1,3)
    end

  end



  # 当订单付款确认后，改变团购项目的数量状态
  # 由未达到最低成团数量到最地成团数量， 最后到最高数量
  def order_payment_confirm_change_deal_count_status
    count = self.valid_orders_count
    # 最低成团数量
    if count >= self.buy_limit
      self.deal_count_status = 1
    end

    # 大于等于最大可购买数量
    if count >= self.max_buy
      self.deal_count_status = 2
    end
    self.save(false)
  end

  # 经过确认的order的所购买的商品数量
  # 目的是判断用户可购买的最大数量
  def valid_order_count 
    self.orders.valid_orders.inject(0) {|num,order| num += order.count}
  end


  # 状态跃迁
  def change_deal_status(from,to)
    raise Exception,"输入参数不正确" if self.deal_status != from
    self.deal_status = to
    self.save(false)
  end

  # 审核状态跃迁
  def change_audit_status(from,to)
    raise Exception,"输入参数不正确" if self.audit_status != from
    self.audit_status = to
    self.save(false)
  end

  # 状态跃迁
  def change_deal_count_status(from,to)
    raise Exception,"输入参数不正确" if self.deal_count_status!= from
    self.deal_count_status= to
    self.save(false)
  end







  #  # 跟据一档二档判断价格
  #  def current_price
  #    case self.buy_status
  #    when 0
  #      self.value
  #    when 1
  #      self.price
  #    when 2
  #      self.sec_price
  #    end
  #  end
  #
  #
  #  # 根据订单货物数改变团购状态
  #  def buy_status_switch
  #    if self.valid_order_count >= self.sec_buy_limit
  #      self.buy_status = 2
  #    elsif self.valid_order_count >= self.buy_limit and self.valid_order_count < self.sec_buy_limit
  #      self.buy_status = 1
  #    else
  #    end
  #    self.save
  #  end
  #


end












# == Schema Information
#
# Table name: deals
#
#  id                :integer(4)      not null, primary key
#  seller_id         :integer(4)
#  product_id        :integer(4)
#  title             :string(255)
#  lite_title        :string(255)
#  start_date        :datetime
#  end_date          :datetime
#  duration          :integer(4)
#  value             :decimal(10, 2)
#  buy_limit         :integer(4)
#  max_buy           :integer(4)
#  important         :text
#  desc              :text
#  transfer_fee      :decimal(10, 2)
#  deal_status       :integer(4)
#  audit_status      :integer(4)
#  created_at        :datetime
#  updated_at        :datetime
#  pic_file_name     :string(255)
#  pic_content_type  :string(255)
#  pic_file_size     :integer(4)
#  pic_updated_at    :datetime
#  per_user_limit    :integer(4)
#  deal_count_status :integer(4)
#

