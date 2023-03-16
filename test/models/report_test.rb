# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable_user_validation?' do
    user = users(:alice)
    report = reports(:report_alice)
    assert report.editable?(user)
  end

  test '#created_on_matches_created_at' do
    report = reports(:report_alice)
    assert_equal report.created_at.to_date, Date.today
  end
end
