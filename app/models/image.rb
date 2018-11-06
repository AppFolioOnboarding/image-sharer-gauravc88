class Image < ApplicationRecord
  validates :url, presence: true
  validates :url, format: { with: /\A(http|https)/, message: 'must start with http or https' }
  validates :url, format: { with: /\.(gif|jpe?g|png|bmp)\z/, message: 'must have a valid extension' }
end
