class CreateVeiculos < ActiveRecord::Migration[5.1]
  def change
    create_table :veiculos do |t|
      t.string :placa
      t.string :modelo
      t.int :ano
      t.string :cor
      t.real :quilometragem
      t.boolean :manutencaoEmDia
      t.boolean :alocado

      t.timestamps
    end
  end
end
