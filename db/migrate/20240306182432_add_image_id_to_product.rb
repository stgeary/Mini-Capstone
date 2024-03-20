class AddImageIdToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :imageid, :integer
  end
end
