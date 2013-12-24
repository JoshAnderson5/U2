class Listing < ActiveRecord::Base
  attr_accessible :website, :item_condition, :item_description, :item_name, :listed_price, :listing_url, :location, :sku


  validates :description, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
