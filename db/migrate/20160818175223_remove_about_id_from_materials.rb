class RemoveAboutIdFromMaterials < ActiveRecord::Migration
  def change
    remove_column :materials, :about_id, :integer
  end
end
