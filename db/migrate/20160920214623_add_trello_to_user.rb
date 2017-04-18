class AddTrelloToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :idTrello, :string
  end
end
