class BizPurchaser < ActiveRecord::Base     
  #      t.string :nbdm    #内部代码
  #      t.string :zzjgdm  #组织机构代码
  #      t.string :dwmc    #单位名称 与字典关联
  #      t.string :dwlx    #单位类型 与字典关联
  #      t.string :dwxz    #单位性质 与字典关联
  #      t.string :dwjb    #单位级别 与字典关联
  #      t.string :ssxt    #所属系统
  #      t.date   :zcrq    #注册日期
  #      t.string :dwdz    #单位地址
  #      t.string :dwyb    #单位邮编
  #      t.string :zgdw    #主管单位 与区域资料关联
  #      t.string :fzr     #采购负责人
  #      t.string :dwdh    #单位电话
  #      t.string :dwcz    #单位传真
  #      t.string :email   #电子邮箱
  #      t.string :lxr     #联系人
  #      t.string :lxdh    #联系人电话
  #      t.string :lxsj    #联系人手机
  #      t.string :sjly    #数据来源
  #      t.string :cjz     #创建者
  #      t.date :cjrq      #创建日期
  #      t.string :zhxgz   #最后修改者
  #      t.date :zhxgrq    #最后修改日期
  #      t.integer :dwzt   #是否禁用（0禁用，1正常）
  #      t.string :beizhu  #备注
  #      t.integer :status #单位状态


  validates_presence_of :zzjgdm,:dwmc,:dwlx,:dwxz,:dwdz,:dwyb,:zgdw,:parent_id,
    :ssxt,:fzr,:dwdh,:dwcz,:email,:lxr,:lxdh,:lxsj,:fzr,:message =>"不能为空"

  validates_format_of :email,:with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i,:on => :update,:message => "格式不正确",:allow_nil => true
  validates_format_of :lxsj,:with => /\d{6,11}/,:on => :update,:message => "格式不正确",:allow_nil => true
  validates_uniqueness_of :zzjgdm,:dwmc,:message => "不能重复"

  belongs_to :bas_area,:foreign_key => "area_id"
  #其他区域专家
  has_many :exp_expert_purchasers,:class_name => "ExpExpertPurchaser",:foreign_key => "biz_purchaser_id"
  has_many :other_experts,:class_name => "ExpExpert",:through => :exp_expert_purchasers

  # 主区域专家， 申请当前单位为主区域的专家
  has_many :main_experts,:class_name => "ExpExpert",:foreign_key => "caigouban_id"
  has_many :valid_main_experts,:class_name => "ExpExpert",:foreign_key => "caigouban_id",:conditions => "shbz=2"

  # 采购单位对应的采购项目
  has_many :projects,:class_name => "BizProject"
  # 采购单位对应的包
  has_many :packages,:class_name => "BizPackage",:through => :projects 

  # 所有用户
  has_many :users,:foreign_key => "owner_id"
  # 单位用户
  has_one :unit_user,:foreign_key => "owner_id",:conditions => "is_unit = 1",:class_name => "User"

  # 采购办下属的采购单位
  has_many :caigoudanweis,:class_name => "BizPurchaser",:foreign_key => "parent_id",:conditions => "dwlx in ('采购单位','集中采购结构','代理机构')"
  # 采购办下属的采购单位的项目
  has_many :caigouban_projects,:through => :caigoudanweis,:source => :projects

  belongs_to :caigouban ,:class_name => "BizPurchaser",:foreign_key => "parent_id"

  named_scope :caigoudanweis,:conditions => "dwlx in ('集中采购单位','采购单位','代理机构')"


  def caigouban_packages
    BizPackage.all(:conditions => ["biz_project_id in (?)",self.caigouban_projects.collect(&:id)])
  end

  # 表示单位禁用还是正常
  DWZT = {0 => "禁用",1 => "正常"}
  # 单位的审核状态
  STATUS = {0 => "申请中",1 => "审核通过",2 => "审核未通过"}

  # short cuts 
  named_scope :cgbs, lambda { {:conditions => { :dwlx => '采购办'}}}
  named_scope :cgdws, lambda {{:conditions => {:dwlx => '采购单位',:parent_id =>current_user.id}}}
  UNIT_TYPE = {1 => "采购办",2 => "采购单位",3 => "集中采购结构",4 => "代理机构"} 
  acts_as_tree


  # jquery tree view 需要的数据
  class << self

    def roots
      all(:conditions => "parent_id = -1")
    end
    #
    # 返回树型结构
    def tree_view_data(check_box = false,only_caigouban = false)
      result = ""
      result << "<ul id='biz_purchaser_treeview' class='filetree treeview'>"
      roots.each do |root|
        next if only_caigouban && !root.is_caigouban?
        result << root.folder_or_file_for_tree_view(check_box)
        result << subtree_html(root,check_box,only_caigouban)
        result << "</li>\n"
      end
      result << "</ul>\n"
    end

    def subtree_html(node,check_box,only_caigouban)
      result = ""
      result << "<ul>"
      node.children.each do |child|
        next if only_caigouban && !child.is_caigouban?
        result << child.folder_or_file_for_tree_view(check_box)
        result << subtree_html(child,check_box,only_caigouban)
        result << "</li>\n"
      end
      result << "</ul>\n"
      result 
    end



  end

  def folder_or_file_for_tree_view(check_box)
    class_a = (self.children.length > 0 ? "folder" : "file")
    if check_box
      return  "<li class='" + (class_a == "folder" ? "closed" : "") +"'><span class='" +
        class_a + "' href='#{self.url}'  node_id='#{self.id}'> " + 
        " <input type='checkbox' m_id='#{self.id}' p_id='#{self.parent_id.nil? ? -1 : self.parent_id }' name='select_menu[]' value='#{self.id}'/>#{self.dwmc} </span>"


    else
      return  "<li><span class='" +
        class_a + "' href='#' node_id='#{self.id}'>#{self.dwmc} </span>"
    end
  end



  # 是否是采购办
  def is_caigouban?
    self.dwlx == 1
  end

  # 是否锁定
  def is_locked?
    self.dwzt == 0 
  end

  # 注册后通过审核
  def pass_signup_audit
    self.status = 1
    unit_user = self.unit_user
    unit_user.roles << BasRole.find_by_name("采购单位用户")
    unit_user.status = 1   
    unit_user.save
    self.save
  end

  # 注册后不通过审核
  def deny_signup_audit
    self.status = 2
    unit_user = self.unit_user
    unit_user.status = 2
    unit_user.save
    self.save
  end

  # 在禁用和正常之间切换
  def toggle_dwzt
    self.dwzt = (self.dwzt + 1) % 2
    self.save
  end



  # 采购人注册的初始化工作
  def after_purchaser_signup
    self.dwlx = "采购单位"
    self.dwzt = 1 # 正常
    self.status = 0 # 未审核
  end

  def after_cgb_signup
    self.dwlx = "采购办"
    self.dwzt = 1 # 正常
    self.status = 0 # 未审核
  end

  def after_cgdw_signup
    self.dwlx = "采购单位"
    self.dwzt = 1 # 正常
    self.status = 0 # 未审核
  end

  class << self
    def generate_code
    end
  end

end
