class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
