class Medication < ApplicationRecord
  belongs_to :user
  validates :medicationname, presence: true
  validates :unitvalue, presence: true
  validates :unitmeasurement, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end