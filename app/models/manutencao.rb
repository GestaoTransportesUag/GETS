class Manutencao < ApplicationRecord
  belongs_to :usuario
  belongs_to :veiculo
  has_many :veiculos
  validates :descricao, numericality: false, presence: true
  validates :custo, numericality: true, presence: true
  validates :realizadoEm, numericality: false, presence: true

  def self.search(search)
    if search
      manutencao = Manutencao.find_by(descricao: search)
      if manutencao
        self.where(descricao: manutencao.descricao)
      else
        Manutencao.all
      end
    else
      Manutencao.all
    end
  end


end

