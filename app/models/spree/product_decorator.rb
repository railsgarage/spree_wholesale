Spree::Product.class_eval do

  delegate :wholesale_price, to: :master

end
