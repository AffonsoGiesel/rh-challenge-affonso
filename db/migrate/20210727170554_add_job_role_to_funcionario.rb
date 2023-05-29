class AddJobRoleToFuncionario < ActiveRecord::Migration[5.1]
  def change
    add_reference :funcionarios, :job_role, foreign_key: true
  end
end
