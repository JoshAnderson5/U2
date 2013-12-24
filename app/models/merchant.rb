class Merchant < ActiveRecord::Base
  # attr_accessible :title, :body
  devise :database_authenticatable, :timeoutable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :provider, :merchantid, :email, :user


  has_one :dashboards


def self.create_with_omniauth(auth)
  create! do |merchant|
    merchant.provider = auth["provider"]
    merchant.merchantid = auth["merchantid"]
    merchant.name = auth["info"]["name"]
  end
end
end
