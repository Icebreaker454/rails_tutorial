class AddQuanityToListItems < ActiveRecord::Migration
  def change
    add_column :list_items, :quanity, :integer, default: 1
  end
end
