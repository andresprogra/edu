class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.text :description
      t.date :date
      t.integer :vistas, default: 0
      t.timestamps null: false
    end
  end
end
