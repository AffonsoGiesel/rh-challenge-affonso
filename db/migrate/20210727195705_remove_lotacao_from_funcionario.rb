class RemoveLotacaoFromFuncionario < ActiveRecord::Migration[5.1]
  def change
    remove_column :funcionarios, :lotacao, :string
  end
end
