class Medication < ApplicationRecord
  validates :medicationname, presence: true, length: { minimum: 3, maximum: 250 }
  validates :unitvalue, presence: true, length: { minimum: 1, maximum: 250 }
  validates :unitofmeasurement, presence: true, length: { minimum: 1, maximum: 20 }
  validates :prescriptionnotes, presence: false, length: { minimum: 1, maximum: 250 }
end