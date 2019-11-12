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

  def self.manun10()
    self.where("quilometragem % 10000 == 0")
  end

  def self.manun20()
    self.where("quilometragem >= '20000'")
  end

  def self.manun40()
    self.where("quilometragem >= '40000' or (modelo == 'caminhonete' and quilometragem >= '40000')")
  end

  def self.manunVelas()
    self.where("quilometragem >= '40000' and modelo == 'passeio'")
  end
  def self.manunFiltroSep()
    self.where("quilometragem >= '20000' and modelo == 'ônibus'")
  end
  def self.manunOleoCaixa()
    self.where("quilometragem >= '100000'")
  end

  public
  def setAlocado(novoAlocado)
    self.alocado = novoAlocado
  end
end
