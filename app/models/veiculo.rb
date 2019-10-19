class Veiculo < ApplicationRecord
  validates :placa, presence: true, length: {is: 7}, uniqueness: true
  validates :modelo, presence: true
  validates :ano, presence: true, numericality: true
  validates :cor, presence: true
  validates :quilometragem, presence: true, numericality: true
end
