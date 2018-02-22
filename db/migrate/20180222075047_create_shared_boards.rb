class CreateSharedBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :shared_boards do |t|
      t.text :content
      t.string :url

      t.timestamps
    end
  end
end
