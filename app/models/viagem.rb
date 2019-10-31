class Viagem < ApplicationRecord
  belongs_to :usuario
  belongs_to :veiculo
  belongs_to :motorista
end
