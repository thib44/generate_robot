class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.string :url
      t.timestamps null: false
    end
  end
end
