class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :privilege, :integer
  end
end
