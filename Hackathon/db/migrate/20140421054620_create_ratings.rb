class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :tid
      t.string :overall
      t.string :cat1
      t.string :cat2
      t.string :cat3
      t.string :cat4
      t.string :cat5
      t.integer :jid
      t.string :comment

      t.timestamps
    end
  end
end
