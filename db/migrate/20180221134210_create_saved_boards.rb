class CreateSavedBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :saved_boards do |t|
      t.text :content
      t.string :url

      t.timestamps
    end
  end
end
