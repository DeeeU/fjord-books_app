class Comment < ApplicationRecord
  belongs_to :postable
  belongs_to :user
end
