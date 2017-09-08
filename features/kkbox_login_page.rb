# kkbox login page
class KKBoxLoginPage

  LOGIN_XPATH = {
    account_txt: '//input[@id="uid"]',
    password_txt: '//input[@id="pwd"]',
    login_btn: '//input[@id="login-btn"]'
  }.freeze

  def me?
    wait_for_element_to_display(:xpath, LOGIN_XPATH[:login_btn], 10)
    raise('This is not login page') unless is_element_displayed(:xpath, LOGIN_XPATH[:login_btn])
  end

  def enter_account_info
    enter_text(:xpath, 'kkboxtest1@grr.la', LOGIN_XPATH[:account_txt])
    enter_text(:xpath, '1qaz2wsx', LOGIN_XPATH[:password_txt])
  end

  def click_login
    click(:xpath, LOGIN_XPATH[:login_btn])
  end

end
