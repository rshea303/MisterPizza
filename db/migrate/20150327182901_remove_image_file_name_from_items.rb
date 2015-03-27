class RemoveImageFileNameFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :image_file_name, :string
  end
end
