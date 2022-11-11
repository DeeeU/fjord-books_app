# frozen_string_literal: true

class Report < ApplicationRecord
  has_many :comments, as: :postable, dependent: :destroy
end
