class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.references :gender, foreign_key: true
      t.references :blood_type, foreign_key: true
      t.date :birthday
      t.string :email, unique: true
      t.string :password_digest
      t.text :comment
      t.boolean :admin, default: false
      t.string :remember_digest
      t.string :activation_digest
      t.boolean :activated, default: false
      t.datetime :activated_at
      t.string :reset_digest
      t.datetime :reset_sent_at

      t.timestamps
    end
  end
end
