class Tag < ApplicationRecord
  has_many :taggables
  has_many :posts, through: :taggables
  def self.search(search)
    @tags = Post.includes(:tags).where(:tags => { "name LIKE ?" => "%#{search}%" })
    #where("name LIKE ?", "%#{search}%")
  end
end
