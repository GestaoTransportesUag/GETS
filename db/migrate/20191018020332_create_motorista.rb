class CreateMotorista < ActiveRecord::Migration[5.1]
  def change
    create_table :motorista do |t|
      t.int :cpf
      t.string :nome
      t.int :telefone
      t.int :numeroDeHoras
      t.array :bancoDeHoras

      t.timestamps
    end
  end
end
