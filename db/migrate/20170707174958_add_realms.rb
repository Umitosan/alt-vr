class AddRealms < ActiveRecord::Migration[5.1]
  def change
    create_table :realms do |t|
      t.column :name, :text
      t.column :description, :text
      t.column :price, :decimal
      t.column :image_url, :string

      t.timestamps
    end
  end
end
