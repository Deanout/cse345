class Event < ApplicationRecord
  has_many :users
  self.per_page = 5
# This will work for sqlite. For Psql production, change LIKE to ILIKE
  def self.search(search)
    @events = where("title LIKE ?", "%#{search}%")
    @events = where("body LIKE ?", "%#{search}%")
  end
end
