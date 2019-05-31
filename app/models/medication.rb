class Medication < ApplicationRecord
  validates :medicationname, presence: true
  validates :unitvalue, presence: true
  validates :unitmeasurement, presence: true
  validates :description, presence: true
end