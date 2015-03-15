class DispensaryProduct < ActiveRecord::Base
  include LeaflyProductBridge

  serialize :pricing_array, JSON

  belongs_to :dispensary_menu

  validates :name, :presence => true

  def has_source_image?
    not source_image_path.nil?
  end

  def has_product_image?
    not product_image_path.nil?
  end

  def has_rating?
    not rating.nil?
  end
end