class Usuario < ApplicationRecord
  validates :cpf, presence: true, length: {is: 11}, uniqueness: true, numericality: true
  validates :nome, presence: true
  validates :senha, presence: true, length: {is: 6}
  validates :email, presence: true
  validates :telefone, presence: true, numericality: true
  validates :capacidadeDeGerencia, presence: true
end
