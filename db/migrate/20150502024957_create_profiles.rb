class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.datetime :birthday
      t.string :home_city
      t.string :gender
      t.string :relationship_status
      t.integer :user_id

      t.timestamps
    end
  end
end
