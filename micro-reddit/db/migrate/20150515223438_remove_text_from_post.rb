class RemoveTextFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :text, :string
  end
end
