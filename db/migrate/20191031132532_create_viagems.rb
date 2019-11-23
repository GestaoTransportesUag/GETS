class CreateViagems < ActiveRecord::Migration[5.1]
  def change
    create_table :viagems do |t|
      t.references :usuario, foreign_key: true
      t.references :veiculo, foreign_key: true
      t.references :motorista, foreign_key: true
      t.bigint :distanciaPercorrida
      t.string :nomeRequisor
      t.text :finalidade
      t.string :funcaoRequisitor
      t.bigint :cpfRequisitor
      t.text :descricaoImprevistos
      t.integer :numAcompanhantes
      t.datetime :dataPartida
      t.datetime :dataChegada
      t.string :destino
      t.boolean :realizada

      t.timestamps
    end
  end
end
