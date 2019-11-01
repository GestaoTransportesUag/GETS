class Manutencao < ApplicationRecord
  belongs_to :usuario
  belongs_to :veiculo
  has_many :veiculos
end
