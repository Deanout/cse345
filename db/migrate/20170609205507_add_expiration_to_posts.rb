class AddExpirationToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :exp_date, :date
    add_column :posts, :exp_time, :time
  end
end
