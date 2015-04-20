Spree::Variant.class_eval do

  def price_in(currency, current_spree_user = nil)
    if self.wholesale_price.present? && (current_spree_user && current_spree_user.wholesaler?)
      price = Spree::Price.new(variant: self, amount: self.wholesale_price, currency: currency)
      return price
    else
      return self.prices.select{ |price| price.currency == currency }.first || Spree::Price.new(variant_id: self.id, currency: currency)
    end
  end

end
