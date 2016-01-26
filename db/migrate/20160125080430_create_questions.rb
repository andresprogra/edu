class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :ad, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
