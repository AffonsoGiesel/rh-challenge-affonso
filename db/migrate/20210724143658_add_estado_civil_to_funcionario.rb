class AddEstadoCivilToFuncionario < ActiveRecord::Migration[5.1]
  def change
    add_column :funcionarios, :estado_civil, :string
  end
end
