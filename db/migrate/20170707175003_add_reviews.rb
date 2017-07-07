class AddReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.column :body, :text
      t.column :realm_id, :integer
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
