class AddReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.column :body, :text
      t.column :author, :string

      t.timestamps
    end
  end
end
