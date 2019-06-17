class AddHexCodeToColours < ActiveRecord::Migration[5.2]
  def change
    add_column :colours, :hex_code, :string
  end
end
