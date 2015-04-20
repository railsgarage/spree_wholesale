class AddWholesalePriceToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :wholesale_price, :decimal
  end
end
