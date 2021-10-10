class CreateExpConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :exp_configs do |t|
      t.integer :level
      t.integer :exp
      t.belongs_to :rank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
