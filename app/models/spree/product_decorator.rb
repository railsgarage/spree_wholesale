Spree::Product.class_eval do

  delegate :master, :wholesale_price

end
