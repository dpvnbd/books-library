class CreateReadersBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :readers_books do |t|
      t.references :reader, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :checked_out_at
      t.datetime :due_to_return_at
      t.datetime :returned_at
    end
  end
end