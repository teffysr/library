class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.boolean :returned
      t.datetime :return_date

      t.timestamps
    end
  end
end
