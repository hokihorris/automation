# search page
class KKBoxSearchResultPage

  SEARCH_XPATH = {
    search_title: '//*[contains(text(),"您搜尋的關鍵字為")]',
    search_result_singer: '//*[contains(text(),"%s")]',
    search_result_song: '//*[contains(text(),"%s")]'
  }
  def me?
    wait_for_element_to_display(:xpath, SEARCH_XPATH[:search_title], 10)
    raise('This is not search result page') unless is_element_displayed(:xpath, SEARCH_XPATH[:search_title])
  end

  def verify_result(singer, song)
    singer_match = is_element_displayed(:xpath, SEARCH_XPATH[:search_result_singer] % singer)
    song_match = is_element_displayed(:xpath, SEARCH_XPATH[:search_result_song] % song)
    raise('The search result is not correct') unless singer_match && song_match
  end

end