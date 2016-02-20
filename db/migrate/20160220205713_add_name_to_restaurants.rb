class AddNameToRestaurants < ActiveRecord::Migration
  def up
    add_column :restaurants, :name, :string, null: false, default: ''
  end

  def down
    remove_column :restaurants, :name, :string

  end
end
