class Post < ApplicationRecord
  belongs_to :user
  has_many :taggables
  has_many :tags, through: :taggables

  def self.search(search)
    @posts = where("title LIKE ?", "%#{search}%")
    @posts = where("body LIKE ?", "%#{search}%")
  end
end
