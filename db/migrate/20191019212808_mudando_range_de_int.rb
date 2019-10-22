class MudandoRangeDeInt < ActiveRecord::Migration[5.1]
  def change
    change_column :usuarios, :cpf, :integer,limit: 8
  end
end
