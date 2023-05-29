class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.references :funcionario, foreign_key: true
      t.string :endereço_email

      t.timestamps
    end
  end
end
