class Admin < ActiveRecord::Base
  # attr_accessible :title, :body
  devise :database_authenticatable, :timeoutable

  
  # This method adds all of the required associations etc.
end
