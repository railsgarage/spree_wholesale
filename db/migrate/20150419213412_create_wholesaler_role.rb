class CreateWholesalerRole < ActiveRecord::Migration
  def up
    Spree::Role.create!(:name => "wholesaler") unless Spree::Role.where(:name => "wholesaler").any?
  end

  def down
    Spree::Role.where(:name => "wholesaler").destroy_all
  end
end
