require 'selenium-cucumber'


Given(/^我到kkbox web player登入頁$/) do
  navigate_to('https://play.kkbox.com/')
  @kkbox_login_page = KKBoxLoginPage.new
  @kkbox_login_page.me?
end

When(/^我輸入帳號密碼並點擊登入$/) do
  @kkbox_login_page.enter_account_info
  @kkbox_login_page.click_login
end

Given(/^我到kkbox web player首頁$/) do
  navigate_to('https://play.kkbox.com/')
  @kkbox_index_page = KKboxIndexPage.new
  @kkbox_index_page.me?
end

Then(/^我可以在kkbox web player首頁看到我的音樂庫,線上精選,電台,一起聽$/) do
  @kkbox_index_page.verify_sidebar
end

When(/^我在首頁搜尋(\S*)$/) do |keyword|
  @kkbox_index_page.search(keyword)
end

Then(/^我可找到(\S*)的(\S*)$/) do |singer, song|
  kkbox_search_result_page = KKBoxSearchResultPage.new
  kkbox_search_result_page.me?
  kkbox_search_result_page.verify_result(singer, song)
end

When(/^我到電台頁面播放一個電台$/) do
  @kkbox_index_page.go_to_radio_page
  @kkbox_radio_page = KKBoxRadioPage.new
  @kkbox_radio_page.me?
  @kkbox_radio_page.play_first_radio
end

When(/^我點擊Dislike 按鈕$/) do
  @kkbox_radio_page.click_dislike
end

Then(/^電台自動切到下一首歌曲開始播放$/) do
  @kkbox_radio_page.verify_switch_to_next_song
end
