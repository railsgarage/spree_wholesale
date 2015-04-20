Spree.user_class.class_eval do

  def wholesaler?
    self.has_spree_role?('wholesaler')
  end

end
