# radio page
class KKBoxRadioPage
  RADIO_XPATH = {
    you_may_like_title: '//*[contains(text(),"你可能會喜歡的電台")]',
    promote_stations1: '(//*[@ng-repeat="promoteStation in radio.promoteStations"])[1]',
    radio_btn: '//*[@class="btn-radio"]',
    current_song: '//*[@ng-bind="current.song.song_name"]',
    dislike_btn: '//*[@title="不喜歡"]',
    lyrics_scroller: '//*[@id="lyrics-scroller"]'
  }

  def me?
    wait_for_element_to_display(:xpath, RADIO_XPATH[:you_may_like_title], 10)
    raise('This is not radio page') unless is_element_displayed(:xpath, RADIO_XPATH[:you_may_like_title])
  end

  def play_first_radio
    hover_over_element('xpath', RADIO_XPATH[:promote_stations1])
    click(:xpath, RADIO_XPATH[:radio_btn])
    wait_for_element_to_enable(:xpath, RADIO_XPATH[:dislike_btn], 10)
  end

  def click_dislike
    begin
      wait_for_element_to_display(:xpath, RADIO_XPATH[:current_song], 10)
    rescue
      sleep 5
      $driver.switch_to.alert.accept
      wait_for_element_to_display(:xpath, RADIO_XPATH[:current_song], 10)
    end
    @before_dislike_song = get_element_text(:xpath, RADIO_XPATH[:current_song])
    click(:xpath, RADIO_XPATH[:dislike_btn])

  end

  def verify_switch_to_next_song
    wait_for_element_to_display(:xpath, RADIO_XPATH[:current_song], 10)
    after_dislike_song = get_element_text(:xpath, RADIO_XPATH[:current_song])
    puts "before click song: #{@before_dislike_song}"
    puts "after click song: #{after_dislike_song}"
    raise('The song is not changed after click dislike') if @before_dislike_song == after_dislike_song
  end
end