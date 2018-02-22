class CreateSharedActives < ActiveRecord::Migration[5.1]
  def change
    create_table :shared_actives do |t|
      t.references :shared_board, foreign_key: true, index: true

      t.integer :top
      t.integer :left
      t.integer :status

      t.timestamps
    end

    add_index :shared_actives, %i[shared_board_id top left], unique: true
  end
end
