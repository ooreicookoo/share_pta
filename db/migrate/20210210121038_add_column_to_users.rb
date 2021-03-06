class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :leader, :boolean, default: false
    add_column :users, :name, :string
    add_column :users, :charge, :string
    add_column :users, :school_year, :integer
    add_column :users, :school_class, :integer
  end
end
