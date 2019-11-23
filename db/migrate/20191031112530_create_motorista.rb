class CreateMotorista < ActiveRecord::Migration[5.1]
  def change
    create_table :motorista do |t|
      t.bigint :cpf
      t.string :nome
      t.date :diasDeFolga
      t.boolean :bancoDeHoras
      t.bigint :telefone
      t.boolean :ativo

      t.timestamps
    end
  end
end
