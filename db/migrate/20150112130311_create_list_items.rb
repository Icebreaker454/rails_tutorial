class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.references :product, index: true
      t.belongs_to :cart, index: true

      t.timestamps
    end
  end
end
