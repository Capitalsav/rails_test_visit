class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :date
      t.integer :number
      t.string :description

      t.timestamps
    end
  end
end
