# kkbox index page
class KKboxIndexPage

  INDEX_XPATH = {
    index_runway: '//*[@id="runway"]',
    search_input_txt: '//input[@class="search_hint ng-pristine ng-untouched ng-valid"]',
    search_btn: '//button[@id="search_btn_cnt"]'
  }.freeze

  SIDEBAR_XPATH = {
    mylibrary_tab: '//span[@translate="我的音樂庫"]',
    explore_tab: '//span[@translate="線上精選"]',
    radio_tab: '//span[@translate="電台"]',
    listen_together_tab: '//span[@translate="一起聽"]'
  }.freeze

  SIDEBAR_EXPECT_RESULT = {
    mylibrary_tab: '我的音樂庫',
    explore_tab: '線上精選',
    radio_tab: '電台',
    listen_together_tab: '一起聽'
  }

  def me?
    wait_for_element_to_display(:xpath, INDEX_XPATH[:index_runway], 10)
    raise('This is not index page') unless is_element_displayed(:xpath, INDEX_XPATH[:index_runway])
  end

  def verify_sidebar
    SIDEBAR_EXPECT_RESULT.each do |key, value|
      raise('The sidebar text is not correct') unless value == get_element_text(:xpath, SIDEBAR_XPATH[key])
    end
  end

  def search(keyword)
    enter_text(:xpath, keyword, INDEX_XPATH[:search_input_txt])
    click(:xpath, INDEX_XPATH[:search_btn])
    sleep 5
  end

  def go_to_radio_page
    click(:xpath, SIDEBAR_XPATH[:radio_tab])
  end

end
