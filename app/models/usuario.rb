class Usuario < ApplicationRecord
  validates :cpf, presence: true, length: {is: 11}, uniqueness: true, numericality: true
  validates :nome, presence: true
  validates :senha, presence: true, length: {is: 6}
  validates :email, presence: true
  validates :telefone, presence: true, numericality: true

  def self.search(search)
    if search
      usuario = Usuario.find_by(nome: search)
      if usuario
        self.where(nome: usuario.nome)
      else
        Usuario.all
      end
    else
      Usuario.all
    end
  end
end