class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :type
      t.string :frame_size
      t.string :description
      t.integer :rate_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
