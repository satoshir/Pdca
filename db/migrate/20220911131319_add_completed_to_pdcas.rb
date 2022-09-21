class AddCompletedToPdcas < ActiveRecord::Migration[6.1]
  def change
    add_column :pdcas, :completed, :integer
  end
end
