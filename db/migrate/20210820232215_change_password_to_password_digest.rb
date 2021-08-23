class ChangePasswordToPasswordDigest < ActiveRecord::Migration
  def change
    rename_column :users, :password, :password
  end
end
