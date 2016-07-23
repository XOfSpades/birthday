class Guest < ApplicationRecord
  validates_presence_of :inviter_id, :person_id
end
