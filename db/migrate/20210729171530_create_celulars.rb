class CreateCelulars < ActiveRecord::Migration[5.1]
  def change
    create_table :celulars do |t|
      t.references :funcionario, foreign_key: true
      t.string :numero_celular

      t.timestamps
    end
  end
end
