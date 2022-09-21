class AddStatusToPdcas < ActiveRecord::Migration[6.1]
  def change
    add_column :pdcas, :status, :string
  end
end
