class CreateManutencaos < ActiveRecord::Migration[5.1]
  def change
    create_table :manutencaos do |t|
      t.references :usuario, foreign_key: true
      t.references :veiculo, foreign_key: true
      t.text :descricao
      t.float :custo
      t.bigint :realizadoEm
      t.bigint :realizadoQuando

      t.timestamps
    end
  end
end
