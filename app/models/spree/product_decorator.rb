Spree::Product.class_eval do

  delegate_belongs_to :master, :wholesale_price

end
