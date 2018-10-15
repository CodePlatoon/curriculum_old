class CreateImdb < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
    end

    create_table :actors do |t|
    end

    create_table :roles do |t|
      t.belongs_to :movie
      t.belongs_to :actor
    end
  end
end
