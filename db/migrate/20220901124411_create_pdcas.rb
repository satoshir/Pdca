class CreatePdcas < ActiveRecord::Migration[6.1]
  def change
    create_table :pdcas do |t|
      t.string :name
      t.string :plan
      t.string :do
      t.string :check
      t.string :adjust
      t.references :user, foreign_key: true



      t.timestamps
    end
  end
end
