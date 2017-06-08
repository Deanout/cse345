class CreateAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.integer :user_id
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
