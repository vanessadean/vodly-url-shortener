class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :original_url
      t.string :short_url
      t.integer :visits, default: 0

      t.timestamps null: false
    end
  end
end
