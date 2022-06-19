# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :user_type
      t.string :token
      t.integer :authy_id

      t.timestamps
    end
    add_index :users, %i[user_type email], unique: true
    add_index :users, :token, unique: true
  end
end
