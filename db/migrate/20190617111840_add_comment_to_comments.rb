class AddCommentToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :comment, :string
  end
end
