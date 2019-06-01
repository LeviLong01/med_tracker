class AddTimestampsToMedication < ActiveRecord::Migration[5.2]
  def change
    add_column :medications, :created_at, :timestamp
    add_column :medications, :updated_at, :timestamp
  end
end
