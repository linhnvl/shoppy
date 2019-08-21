class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phoneNumber
      t.string :address
      t.string :city
      t.string :country
      t.string :postalCode
      t.string :userName

      t.timestamps
    end
  end
end
