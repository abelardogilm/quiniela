class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :text
      t.integer :val1
      t.integer :val2
      t.integer :val3

      t.timestamps
    end
  end
end
