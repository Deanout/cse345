class Post < ApplicationRecord
  belongs_to :user
  has_many :taggables
  has_many :tags, through: :taggables

end
