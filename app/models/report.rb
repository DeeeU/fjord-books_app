class Report < ApplicationRecord
  has_many :comments, as: :postable
end
