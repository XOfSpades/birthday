class Guest < ApplicationRecord
  validates_presence_of :inviter_id, :user_id
end
