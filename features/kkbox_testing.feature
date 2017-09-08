Feature: kkbox 測試

  @login
  Scenario: 登入： 在登入頁面輸入正確帳號、密碼，可以成功登入
    Given 我到kkbox web player登入頁
    When 我輸入帳號密碼並點擊登入

  @sidebar
  Scenario: 左方顯示「我的音樂庫」、「線上精選」、「電台」、「一起聽」4 個頁籤。
    Given 我到kkbox web player首頁
    Then 我可以在kkbox web player首頁看到我的音樂庫,線上精選,電台,一起聽

  @search
  Scenario: 搜尋： 搜尋「清平調」，可找到王菲與鄧麗君合唱的「清平調」。
    Given 我到kkbox web player首頁
    When 我在首頁搜尋清平調
    Then 我可找到王菲&鄧麗君的清平調

  @radio
  Scenario: 電台播放的 Dislike 按鈕： 播放任一電台，點擊 Dislike 按鈕，自動切到下一首歌曲開始播放。
    Given 我到kkbox web player首頁
    When 我到電台頁面播放一個電台
    And 我點擊Dislike 按鈕
    Then 電台自動切到下一首歌曲開始播放

