class DropProjectsTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :projects
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
