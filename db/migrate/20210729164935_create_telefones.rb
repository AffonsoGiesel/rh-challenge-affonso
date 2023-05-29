class CreateTelefones < ActiveRecord::Migration[5.1]
  def change
    create_table :telefones do |t|
      t.references :funcionario, foreign_key: true
      t.string :numero_telefone

      t.timestamps
    end
  end
end
