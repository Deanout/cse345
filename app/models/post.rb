class Post < ApplicationRecord
  belongs_to :user
  has_many :taggables
  has_many :tags, through: :taggables

  def self.search(search)
    @posts = where("title LIKE ?", "%#{search}%")
    @posts2 = where("body LIKE ?", "%#{search}%")
    @posts3 = []

    Post.all.each do |post|
      if post.tags.where("name LIKE ?", "%#{search}%") != []
        @posts3.push(post)
      else
      end
    end
      @posts = @posts + @posts2
      @posts = @posts + @posts3
      @posts = @posts.uniq
  end
end
