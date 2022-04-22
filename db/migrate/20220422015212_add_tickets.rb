class AddTickets < ActiveRecord::Migration[7.0]
  def up
    create_table :tickets do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.belongs_to :project, foreign_key: true
      t.belongs_to :ticket_status, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :tickets
  end
end
