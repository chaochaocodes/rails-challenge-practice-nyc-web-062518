class Office < ApplicationRecord
  belongs_to :building
  belongs_to :company


  validates :floor, presence: true
  validates :floor, numericality: { only_integer: true }
  validates :building_id, presence: true
  validates :company_id, presence: true
end
