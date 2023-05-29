class AddEstadoNascimentoToFuncionario < ActiveRecord::Migration[5.1]
  def change
    add_column :funcionarios, :estado_nascimento, :string
  end
end
