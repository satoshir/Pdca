class CreatePdcas < ActiveRecord::Migration[6.1]
  def change
    create_table :pdcas do |t|
      t.string :name

      t.timestamps
    end
  end
end
