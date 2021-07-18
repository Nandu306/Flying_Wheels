class AddBikeCategoryToBikes < ActiveRecord::Migration[6.0]
  def change
    add_column :bikes, :bike_category, :string
  end
end
