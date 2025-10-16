class Resource < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :link, presence: true, uniqueness: true
end
