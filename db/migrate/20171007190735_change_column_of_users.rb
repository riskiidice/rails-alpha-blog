class ChangeColumnOfUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string
    remove_column :users, :password, :string
  end
end
