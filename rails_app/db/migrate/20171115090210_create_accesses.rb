class CreateAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :accesses do |t|
      t.references :contact, foreign_key: true
      t.references :page, foreign_key: true
      t.datetime :datetime

      t.timestamps
    end
  end
end
