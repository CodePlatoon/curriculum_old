class CreateSwimRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :swim_records do |t|
      t.string :first_name
      t.string :last_name
      t.string :team_name
      t.boolean :relay
      t.string :stroke
      t.integer :distance
      t.decimal :time_in_seconds, scale: 3
      t.date :record_date
      t.date :record_broken_date
      t.string :record_level

      t.timestamps
    end
  end
end
