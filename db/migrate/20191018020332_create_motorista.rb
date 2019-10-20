class CreateMotorista < ActiveRecord::Migration[5.1]
  def change
    create_table :motorista do |t|
      t.bigint :cpf, :limit => 8
      t.string :nome
      t.bigint :telefone
      t.integer :numeroDeHoras
      t.boolean :bancoDeHoras
      t.timestamps
    end
  end
end
