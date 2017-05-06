class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.string :poster
      t.string :genre
      t.string :director
      t.timestamps null: false
    end
  end
end
