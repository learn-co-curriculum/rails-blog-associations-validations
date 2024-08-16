class AddPostIdToTag < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :post_id, :integer
  end
end
