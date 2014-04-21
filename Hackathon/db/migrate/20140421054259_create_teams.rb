class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :members
      t.string :description
      t.string :summary
      t.string :screenshot

      t.timestamps
    end
  end
end
