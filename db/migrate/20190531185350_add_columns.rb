class AddColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :medications, :medicationname, :string
    add_column :medications, :unitvalue, :string
    add_column :medications, :unitmeasurement, :string
    add_column :medications, :description, :text
  end
end
