# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable_user_validation?' do
    user1 = User.create!(name: 'user1', email: 'user1@yhogehoge.com', password: 'password')
    report1 = Report.new(user_id: user1.id, title: 'report1', content: 'report1')
    assert_equal true, report1.editable?(user1)
  end

  test '#show_date_format' do
    user2 = User.create!(name: 'user2', email: 'user2@yhogehoge.com', password: 'password')
    report2 = Report.new(user_id: user2.id, title: 'report2', content: 'report2', created_at: '2000-01-01 00:00:01 UTC')
    assert_equal(report2.created_at.to_date, report2.created_on)
  end
end
