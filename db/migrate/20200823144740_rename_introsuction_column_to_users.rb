class RenameIntrosuctionColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :introsuction, :introduction
  end
end
