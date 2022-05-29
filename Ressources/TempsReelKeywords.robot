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

Lancer analyse
     Click Link                 link:Temps réel
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
     Execute JavaScript    window.scrollTo(0, 20)
     Sleep  3s
     Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
     Click Element    xpath://*[@id="user_timeline_1"]/li[3]/span/span
     Execute JavaScript    window.scrollTo(0, 20)
     Sleep  3s
     Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)


Verifier Resultat Emotions
     Click Element    xpath://*[@id="react-tabs-4"]
     #Element Should Contain      xpath://*[@id="emotion_tab_link2"]    Happy
     #Element Should Contain      xpath://*[@id="emotion_tab_link1"]/span    Neutral

Verifier Click Emotion
     Click Element    xpath://*[@id="emotion_tab_link2"]/img
     Execute JavaScript    window.scrollTo(0, 20)
     Sleep    3s

Verifier Fin traitement
     Wait Until Page Contains    Analyse terminée !