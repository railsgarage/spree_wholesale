Spree::ProductsHelper.module_eval do

  def variant_full_price(variant, options = nil)
    product = variant.product
    if variant.wholesale_price.present? && (current_spree_user && current_spree_user.wholesaler?)
      Spree::Money.new(variant.wholesale_price, { currency: current_currency }).to_html
    else
      unless product.variants.active(current_currency).all? { |v| v.price == product.price }
        Spree::Money.new(variant.price, { currency: current_currency }).to_html
      end
    end
  end

end
