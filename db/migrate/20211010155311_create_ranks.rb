class CreateRanks < ActiveRecord::Migration[6.1]
  def change
    create_table :ranks do |t|
      t.string :name

      t.timestamps
    end

    add_belongs_to :species, :rank, null: false, foreign_key: true
  end
end
