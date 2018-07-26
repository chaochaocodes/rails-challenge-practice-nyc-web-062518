class Employee < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
  validates :name, length: { minimum: 5 }
  validates :title, presence: true
  validates :company, presence: true
  validates :company_id, presence: true
end
