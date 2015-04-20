Spree::BaseHelper.module_eval do

  def display_price(product_or_variant)
    product_or_variant.price_in(current_currency, current_spree_user).display_price.to_html
  end

end
