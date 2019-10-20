class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.bigint :cpf
      t.string :nome
      t.string :senha
      t.string :email
      t.bigint :telefone
      t.boolean :capacidadeDeGerencia
      t.timestamps
    end
  end
end
