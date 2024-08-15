class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
