class CreateBloodTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :blood_types do |t|
      t.string :name

      t.timestamps
    end
  end
end