class CreatePdcas < ActiveRecord::Migration[6.1]
  def change
    create_table :pdcas do |t|
      t.string :name
      t.integer :user_id
      t.text :plan
      t.text :do
      t.text :check
      t.text :adjust



      t.timestamps
    end
  end
end
