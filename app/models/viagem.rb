class Viagem < ApplicationRecord
  belongs_to :usuario
  belongs_to :veiculo
  belongs_to :motorista
  validates :distanciaPercorrida, numericality: true
  validates :nomeRequisor, presence: true, numericality: false
  validates :finalidade, presence: true, numericality: false
  validates :funcaoRequisitor, presence: true, numericality: false
  validates :cpfRequisitor, presence: true, length: {is: 11}, numericality: true
  validates :numAcompanhantes, presence: true, numericality: true
  validates :dataPartida, presence: true, numericality: true
  validates :dataChegada, presence: true, numericality: true
  validates :horaSaida, presence: true, numericality: true
  validates :horaChegada, presence: true, numericality: true
  validates :destino, presence: true, numericality: false

  def self.search(search)
    if search
      viagem = Viagem.find_by(destino: search)
      if viagem
        self.where(destino: viagem.destino)
      else
        Viagem.all
      end
    else
      Viagem.all
    end
  end
end
