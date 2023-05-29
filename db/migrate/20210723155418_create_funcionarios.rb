class CreateFuncionarios < ActiveRecord::Migration[5.1]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :matricula
      t.string :data_nascimento
      t.string :sexo
      t.string :lotacao
      t.string :cargo

      t.timestamps
    end
  end
end
