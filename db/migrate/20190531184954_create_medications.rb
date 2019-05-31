class CreateMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :medications do |t|
      t.string :medicationname
      t.string :unitvalue
      t.string :unitmeasurement
      t.text :description
    end
  end
end
