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
    assert_text Date.today.replace('-', '/')
  end

  test 'creating the Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '登録する'

    assert_text '日報が作成されました。'
    click_on '戻る'
  end

  test 'editing the Report' do
    visit reports_url
    click_link('編集')

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '更新する'

    assert_text '日報が更新されました。'
    click_on '戻る'
  end

  test 'destroying the Report' do
    visit reports_url
    page.accept_confirm do
      click_link('削除')
    end

    assert_text '日報が削除されました。'
  end
end
