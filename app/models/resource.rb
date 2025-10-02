class Resource < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :link, presence: true
end
