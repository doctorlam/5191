class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
