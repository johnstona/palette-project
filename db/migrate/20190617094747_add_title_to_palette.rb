class AddTitleToPalette < ActiveRecord::Migration[5.2]
  def change
    add_column :palettes, :title, :string
  end
end
