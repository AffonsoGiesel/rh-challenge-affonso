class AddWorkspaceToFuncionario < ActiveRecord::Migration[5.1]
  def change
    add_reference :funcionarios, :workspace, foreign_key: true
  end
end
