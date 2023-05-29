class AddMunicipioNascimentoToFuncionario < ActiveRecord::Migration[5.1]
  def change
    add_column :funcionarios, :municipio_nascimento, :string
  end
end
