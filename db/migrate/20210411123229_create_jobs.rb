class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.text :description
      t.decimal :latitude
      t.decimal :longitude
      t.integer :zip
      t.text :title
      t.text :user

      t.timestamps
    end
  end
end
