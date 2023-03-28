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
    assert_equal Date.today, report.created_on
  end
end
