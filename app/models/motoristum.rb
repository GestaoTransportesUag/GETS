class Motoristum < ApplicationRecord
  validates :cpf, presence: true, length: {is: 11}, uniqueness: true, numericality: true
  validates :nome, presence: true
  validates :telefone, presence: true, numericality: true
  validates :numeroDeHoras, presence: true, numericality: true
  validates :bancoDeHoras, presence: true, numericality: true
end
