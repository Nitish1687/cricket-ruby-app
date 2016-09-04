class AddAttachmentToBrands < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :attachment, :string
  end
end
