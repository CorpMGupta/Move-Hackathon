class CreateECatalogues < ActiveRecord::Migration
  def change
    create_table :e_catalogues do |t|
      t.string :name
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
