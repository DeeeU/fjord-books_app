# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@hoge.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the Report index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
    assert_text "Report Alice"
    assert_text "alice@hoge.com"
    assert_text Date.today.strftime('%Y/%m/%d')
  end

  test 'creating the Report' do
    visit reports_url
    click_link '新規作成'

    fill_in 'タイトル', with: "This is Alice's report."
    fill_in '内容', with: "Report Alice"

    click_button '登録する'

    assert_text '日報が作成されました。'
    assert_text "Report Alice"

    click_link '戻る'
    assert_current_path(reports_path)

  end

  test 'editing the Report' do
    visit reports_url
    click_link '編集'

    fill_in 'タイトル', with: "This is new Alice's  report."
    fill_in '内容', with: "New Report Alice"
    click_button '更新する'

    assert_text '日報が更新されました。'
    assert_text "This is new Alice's report."

    click_link '戻る'
    assert_current_path(reports_path)
  end

  test 'destroying the Report' do
    visit reports_url
    page.accept_confirm do
      click_link '削除'
    end

    assert_text '日報が削除されました。'
    assert_no_text "This is new Alice's report."

    assert_current_path(reports_path)
  end
end
