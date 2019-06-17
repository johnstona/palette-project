class AddColourHexToColours < ActiveRecord::Migration[5.2]
  def change
    add_column :colours, :colour_hex, :string
  end
end
