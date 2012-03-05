class User < ActiveRecord::Base
  
  include User::Authentication
  
  attr_accessible :role, :as => :admin
  
end
