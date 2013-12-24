class Seller < ActiveRecord::Base
  attr_accessible :channel, :city, :item_condition, :item_name, :listing_price, :listing_url, :seller_id, :sku, :state
end
