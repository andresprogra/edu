class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.string :semestre
      t.string :grupo
      t.string :carrera

      t.timestamps null: false
    end
  end
end
