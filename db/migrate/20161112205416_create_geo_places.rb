class CreateGeoPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :geo_places do |t|
      t.string :uid  # suggest English lowercase name of city/place
    end
    add_index :geo_places, :uid, unique: true
  end
end
