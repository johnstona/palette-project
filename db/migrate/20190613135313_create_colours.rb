class CreateColours < ActiveRecord::Migration[5.2]
  def change
    create_table :colours do |t|
      t.references :palette, foreign_key: true

      t.timestamps
    end
  end
end
