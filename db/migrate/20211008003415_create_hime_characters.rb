class CreateHimeCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :hime_characters do |t|
      t.string :name
      t.integer :level, default: 1
      t.integer :exp, default: 0
      t.integer :strength
      t.belongs_to :species, null: false, foreign_key: true

      t.timestamps
    end
  end
end
