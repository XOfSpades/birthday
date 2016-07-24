class Present < ApplicationRecord
  validates_presence_of :name, :img_url, :user
  belongs_to :user
end
