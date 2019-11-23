class CreateVeiculos < ActiveRecord::Migration[5.1]
  def change
    create_table :veiculos do |t|
      t.string :placa
      t.string :modelo
      t.integer :ano
      t.string :cor
      t.bigint :quilometragem
      t.boolean :manutencaoEmDia
      t.boolean :alocado
      t.boolean :ativo
      t.timestamps
    end
  end
end
