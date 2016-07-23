class Present < ApplicationRecord
  validates_presence_of :name, :img_url, :person
  belongs_to :person
end
