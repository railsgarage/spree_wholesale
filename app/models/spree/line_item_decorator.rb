Spree::LineItem.class_eval do

  def copy_price
    if variant

      if currency
        self.currency = currency
        self.price = variant.price_in(currency, self.order.user).amount + variant.price_modifier_amount_in(currency, {})
      else
        price_to_use = self.order.user.wholesaler? ? variant.wholesale_price : variant.price
        self.price = price_to_use + variant.price_modifier_amount({})
      end

      if self.order.user && self.order.user.wholesaler?
        self.price = variant.wholesale_price
      else
        self.price = variant.price
      end

      self.cost_price = variant.cost_price if cost_price.nil?
      self.currency = variant.currency if currency.nil?
    end
  end

end
