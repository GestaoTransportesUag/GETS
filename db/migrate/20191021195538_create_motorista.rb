class CreateMotorista < ActiveRecord::Migration[5.1]
  def change
    create_table :motorista do |t|
      t.bigint :cpf
      t.string :nome
      t.integer :numeroDeHoras
      t.boolean :bancoDeHoras
      t.bigint :telefone

      t.timestamps
    end
  end
end
