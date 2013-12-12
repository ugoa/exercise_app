class AddAuthorIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :author_id, :ingeger
  end
end
