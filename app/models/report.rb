# frozen_string_literal: true

class Report < ApplicationRecord
  has_many :comments, as: :postable
  belongs_to :user
end
