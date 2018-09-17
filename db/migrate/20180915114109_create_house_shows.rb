class CreateHouseShows < ActiveRecord::Migration
  def change
    create_table :house_shows do |t|
      t.string :name
      t.float :rating
      t.date :release_date
      t.string :photo
      t.string :description

      t.timestamps null: false
    end
  end
end
