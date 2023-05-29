class RemoveCargoFromFuncionario < ActiveRecord::Migration[5.1]
  def change
    remove_column :funcionarios, :cargo, :string
  end
end
