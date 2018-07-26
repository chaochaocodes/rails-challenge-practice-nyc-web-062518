class Company < ApplicationRecord
  has_many :offices
  has_many :buildings, through: :offices
  has_many :employees
  accepts_nested_attributes_for :employees, :offices


  validates :name, presence: true

  def total_rent
    total = 0
    self.offices.each do |office|
      total += office.building.rent_per_floor
    end
  total
  end
end
