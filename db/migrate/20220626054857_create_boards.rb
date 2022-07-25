class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :board_content
      t.references :user, null: false, foreign_key: true
      t.references :sight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
