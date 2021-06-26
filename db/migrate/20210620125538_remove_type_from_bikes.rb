class RemoveTypeFromBikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :bikes, :type, :string
  end
end
