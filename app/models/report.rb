class Report < ApplicationRecord
  has_many :user
  has_many :comments, as: :polymorphic
end
