class CreatePdcas < ActiveRecord::Migration[6.1]
  def change
    create_table :pdcas do |t|
      t.string :name
      t.text  :plan
      t.text  :do
      t.text  :check
      t.text  :adjust
      t.references :user, foreign_key: true
      t.date :time
      t.datetime :done_at




      t.timestamps
    end
  end
end
