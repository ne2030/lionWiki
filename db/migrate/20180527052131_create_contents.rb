class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.integer :post_id
      t.string :title
      t.integer :order
      t.text :text
      t.string :img

      t.timestamps
    end
  end
end
