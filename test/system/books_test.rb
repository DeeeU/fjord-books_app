# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@hoge.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
    assert_text "Book Alice"
    assert_text "This is Alice's book."
    assert_text "alice"
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: "This is Alice's book."
    fill_in 'メモ', with: "Book Alice"
    fill_in '著者', with: "alice"

    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text "Book Alice"

    click_on '戻る'
    assert_current_path(books_path)
  end

  test 'updating a Book' do
    visit books_url
    click_link('編集')

    fill_in 'タイトル', with: "This is new Alice's book."
    fill_in 'メモ', with: "New Book Alice"
    fill_in '著者', with: "Ms.alice"
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text "This is new Alice's book."

    click_on '戻る'
    assert_current_path(books_path)
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_link('削除')
    end

    assert_text '本が削除されました。'
  end
end
