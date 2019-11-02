class Motorista < ApplicationRecord
  validates :cpf, presence: true, length: {is: 11}, uniqueness: true, numericality: true
  validates :nome, presence: true
  validates :telefone, presence:true, numericality: true
  validates :diasDeFolga, presence:true, numericality: true

  def self.search(search)
    if search
      motorista = Motorista.find_by(nome: search)
      if motorista
        self.where(nome: motorista.nome)
      else
        Motorista.all
      end
    else
      Motorista.all
    end
  end
end
