class Image < ApplicationRecord
  acts_as_taggable_on :tags
  validates :tag_list, presence: true
  validates :url, presence: true
  validates :url, format: { with: /\A(http|https)/, message: 'must start with http or https' }
  validates :url, format: { with: /\.(gif|jpe?g|png|bmp)\z/, message: 'must have a valid extension' }
end
