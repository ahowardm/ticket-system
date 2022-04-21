class AddTicketStatus < ActiveRecord::Migration[7.0]
  def up
    create_table :ticket_statuses do |t|
      t.text :name

      t.timestamps
    end
  end

  def down
    drop_table :ticket_statuses
  end
end
