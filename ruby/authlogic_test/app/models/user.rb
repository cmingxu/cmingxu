class User < ActiveRecord::Base
  acts_as_authlogic do |config|
  end
end
