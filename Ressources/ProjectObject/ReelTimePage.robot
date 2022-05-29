*** Settings ***
Documentation                   this is a basic test
Library                         Selenium2Library
*** Keywords ***
Verifier element statique
     Wait Until Page Contains      VIDEO EMOTION
     Wait Until Page Contains      recognition
     Page Should Contain Image     xpath:/html/body/header/div/a/img
     Element Should Contain        xpath://*[@id="result_bloc"]/div/p    Aucun résultat actuellement ! Vous devez démarrer l'analyse...
     Page Should Contain Image     xpath://*[@id="result_bloc"]/div/img
Test liste url
    Click Element    xpath://*[@id="url"]
    Input Text    xpath://*[@id="url"]    https://www.youtube.com/watch?v=Ab5GOnkS1mk
Lancer analyse
     Clear Element Text    xpath://*[@id="url"]
     Input Text    xpath://*[@id="url"]    https://www.youtube.com/watch?v=WFMTzZ6RfZE
     Click Button    xpath:/html/body/section[1]/div[1]/div[2]/input
     Sleep    1s

Verifier resultat statistique globale
     Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
     Wait Until Page Contains    Analyse en cours..   timeout=300s
     Wait Until Page Contains    Analyse terminée !   timeout=300s
     Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
     Page Should Contain Image    xpath://*[@id="PanelOfEmotion"]/img[1]    timeout=1000s
     Page Should Contain Image    xpath://*[@id="PanelOfEmotion"]/img[2]    timeout=1000s
     Page Should Contain Image    xpath://*[@id="mostRepresented"]/img      timeout=1000s
     Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
     Element Should Contain       xpath://*[@id="bestAudience"]/div    User 1
     Element Should Contain       xpath://*[@id="nbr_of_users"]        1
     Wait Until Element Is Visible     id:global_synthesis_timeline
     Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
     Sleep    2s

Verifier Resultat Locuteurs
     Click Element    xpath://*[@id="react-tabs-2"]
     Click Element    xpath://*[@id="user_timeline_1"]/li[1]/span/span
     Execute JavaScript    window.scrollTo(0, 150)
     ${attr}=    Selenium2Library.Get Element Attribute    xpath:/html/body/section[1]/div[1]/div[1]/input    placeholder
     Sleep  3s
     Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
     Click Element    xpath://*[@id="user_timeline_1"]/li[3]/span/span
     Execute JavaScript    window.scrollTo(0, 150)
     Sleep  3s
     Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

Verifier Resultat Emotions
     Click Element    xpath://*[@id="react-tabs-4"]
     Page Should Contain Image    //*[@id="emotion_tab_link2"]/img
     Page Should Contain Image    //*[@id="emotion_tab_link1"]/img


Verifier Click Emotion

     Click Element    xpath://*[@id="emotion_tab_link2"]/img
     Click Element    xpath://li[@id='emotion_tab_link1']//img
     Click Element    xpath://div[@id='emotion_timeline_1']//div[1]//li[1]//span[1]//span[1]
      #${attr1}=    Selenium2Library.Get Element Attribute    class:ytp-progress-bar       aria-valuemax
      ${ATT}=   Execute JavaScript    document.getElementsByClassName(ytp-progress-bar);
      #${AR}=    Selenium2Library.Get Element Attribute    xpath:/html/body/div[1]/div/div[24]/div[1]/div[2]     class
     #Sleep     3s
#      #${aria1}= Get Element Attribute    xpath://*[@id="movie_player"]/div[25]/div[1]/div[2]    class

     Execute JavaScript    window.scrollTo(0, 150)
     Sleep    3s
Verifier Fin traitement
     Wait Until Page Contains    Analyse terminée !
