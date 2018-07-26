class Building < ApplicationRecord
  validates :name, presence: true
  validates :country, presence: true
  validates :address, presence: true
  validates :rent_per_floor, presence: true
  validates :number_of_floors, presence: true

  has_many :offices
  has_many :companies, through: :offices
  has_many :employees, through: :companies

  def office_floors
    occupied_floors = []
    self.offices.each do |office|
      occupied_floors << office.floor
    end
    occupied_floors
  end

  def available_floors
    all_floors = [*1..self.number_of_floors]
    all_floors.each do |floor|
      if office_floors.include?(floor)
        all_floors.delete(floor)
      end
    end
    # byebug
    all_floors
  end

end
