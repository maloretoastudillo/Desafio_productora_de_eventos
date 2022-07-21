class CreateCrews < ActiveRecord::Migration[6.1]
  def change
    create_table :crews do |t|
      t.string :name
      t.string :instrument
      t.references :band, null: false, foreign_key: true

      t.timestamps
    end
  end
end
