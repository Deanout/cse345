class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.date :event_date
      t.time :event_time
      t.boolean :enroll
      t.integer :user_id

      t.timestamps
    end
  end
end
