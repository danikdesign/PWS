class CreatePurifierBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :purifier_brands do |t|
      t.string :name

      t.timestamps
    end
  end
end