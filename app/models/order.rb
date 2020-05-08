class Order < ApplicationRecord
  belongs_to :costumer

  validates :product_name, presence: true
#  validates :product_name, uniqueness: true
  validates :product_count, presence: true
  validates_presence_of :costumer


  validates :product_count, numericality: { only_integer: true }

#  def to_s
#    costumer.full_name + "has ordered " + product_count.to_s + product_name
#  end

end
