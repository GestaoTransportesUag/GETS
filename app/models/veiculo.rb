class Veiculo < ApplicationRecord
  validates :placa, presence: true, length: {is: 7}, uniqueness: true
  validates :modelo, presence: true
  validates :ano, presence: true, numericality: true
  validates :cor, presence: true
  validates :quilometragem, presence: true, numericality: true

  def self.search(search)
    if search
      veiculo = Veiculo.find_by(placa: search)
      if veiculo
        self.where(placa: veiculo.placa)
      else
        Veiculo.all
      end
    else
      Veiculo.all
    end
  end

  def self.manun()
    x = 100
    self.where("quilometragem>= '10000'")
  end

  public
  def setAlocado(novoAlocado)
    self.alocado = novoAlocado
  end
end
