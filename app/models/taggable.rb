class Taggable < ApplicationRecord
  attr_accessor :post_id, :tag_id
  belongs_to :post
  belongs_to :tag

end
