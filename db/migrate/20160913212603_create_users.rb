class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
