class CreateWaterSamples < ActiveRecord::Migration
  def change
    create_table :water_samples do |t|
      t.text :site, null: false
      t.float :chloroform, null: false
      t.float :bromoform, null: false
      t.float :bromodichloromethane, null: false
      t.float :dibromichloromethane, null: false
    end
  end
end
