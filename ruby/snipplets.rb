my_instance = mock(object)o
my_instance.stub!(:msg).and_return(value)

MyClass.stub!(:msg).and_return(value)

A.stub!(:msg).and_return(:default_value)
A.should_receive(:msg).with(:arg).and_return(:special_value)

A.msg
A.msg(:any_other_arg)
A.msg(:arg)
A.msg(:any_other_other_arg)

A.msg


class AdminController < ApplicationController
  require_role "admin",:only => [:index]
  def index
    @menutag = "adminmenu_index"
    conditions = default_search_conditions
    # 如果有status参数，   并且ApplySeller::STATUS.keys 包含此状态
    conditions.merge!(:conditions => {:status => params[:status]}) if  ApplySeller::STATUS.keys.collect(&:to_s).include?(params[:status]) 
    @apply_sellers = ApplySeller.paginate(conditions)
  end

end
