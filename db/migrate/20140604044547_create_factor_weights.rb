class CreateFactorWeights < ActiveRecord::Migration
  def change
    create_table :factor_weights do |t|
      t.float :chloroform_weight, null: false
      t.float :bromoform_weight, null: false
      t.float :bromodichloromethane_weight, null: false
      t.float :dibromichloromethane_wieight, null: false
    end
    
    add_index :factor_weights, [
      :chloroform_weight,
      :bromoform_weight,
      :bromodichloromethane_weight,
      :dibromichloromethane_wieight
      ], unique: true, name: 'index_factor_weights_unique'
  end
end
