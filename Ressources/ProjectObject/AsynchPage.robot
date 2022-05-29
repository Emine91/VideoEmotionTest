*** Settings ***
Documentation                   this is a basic test
Library                         Selenium2Library
Library                         OperatingSystem
Library                         String
*** Variables ***
${path}=    C:\\downloads_selenium
*** Keywords ***
Verifier element statique

     Click Link    link:Analyse multi
     Page Should Contain Image     xpath:/html/body/header/div/a/img
     Element Should Contain        xpath://*[@id="urls"]    https://www.youtube.com/watch?v=WFMTzZ6RfZE;https://www.youtube.com/watch?v=Ab5GOnkS1mk;
     Element Should Contain        xpath://*[@id="result_bloc_general"]/div/p    Aucun résultat actuellement ! Vous devez démarrer l'analyse...
     Page Should Contain Image     xpath://*[@id="result_bloc_general"]/div/img

Lancer analyse
     Click Button    xpath://*[@id="getReportBtn"]
     Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
     Wait Until Page Contains    Analyse en cours..   timeout=300s
     Wait Until Page Contains    En attente de traitement   timeout=300s
     Sleep    4s
     Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
Ajouter url
    Sleep    1s
    Execute JavaScript    window.scrollTo(0, 10)
    Clear Element Text    xpath://*[@id="urls"]
    Input Text    xpath://*[@id="urls"]    https://www.youtube.com/watch?v=Qj-298ZG7JE
    Click Button    xpath://*[@id="addReportBtn"]
    Sleep    4s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
Annuler job
    Click Element    xpath:/html/body/section[2]/div[2]/div[2]/div[1]/span[2]
    Wait Until Element Contains   xpath:/html/body/section[2]/div[2]/div[2]/div[2]/div[1]/div/p    Annulation du job...     timeout=600s
    Wait Until Element Contains   xpath:/html/body/section[2]/div[2]/div[2]/div[2]/div[1]/div/p    Job annulé   timeout=600s
    Click Element    xpath:/html/body/section[2]/div[2]/div[3]/div[1]/span[2]

Verifier le bouton de collapse extension
    Click Element    xpath:/html/body/section[2]/div[2]/div[2]/div[1]/span[1]
    Sleep    1s
    Click Element    xpath:/html/body/section[2]/div[2]/div[2]/div[1]/span[1]
    Sleep    1s
Verifier le bouton de fermeture de panel
    Click Element    xpath:/html/body/section[2]/div[2]/div[2]/div[1]/span[2]
    Wait Until Element Is Not Visible    xpath://*[@id="result-container-42ede68b-1dfa-4ba2-b181-4d6003908e83"]
Telecharger le rapport

    Wait Until Element Contains    xpath:/html/body/section[2]/div[2]/div[1]/div[2]/div[1]/div/p    Analyse terminée !
#Verifier le fichier est telechargé
    Execute JavaScript    window.scrollTo(0, 550)
    ${count1}=   Count Items In Directory    ${path}
    Click Element    xpath:/html/body/section[2]/div[2]/div[1]/div[2]/div[2]/div/ul/li[4]
    Sleep    4s
    ${count2}=   Count Items In Directory    ${path}
    Directory Should Not Be Empty    ${path}
    @{files}=   List Files In Directory     ${path}    *vid_o_d_lire_de_20_seconde*.txt
    IF    ${count2} > ${count1}
        Log To Console    file downloaded
    ELSE
        Log To Console    fail to donwload
        Fail
    END

    ${l_file}=    Get Modified Time    ${path}   0
#Chercher le dernier fichier telechargé
    FOR    ${file}    IN    @{files}

        ${t}=      Get Modified Time    ${path}\\${file}     0
         Log    ${t}
         IF    '${t}' == '${l_file}'
         Log To Console    trouvee
#Afficher le contenu de fichier dans le console
     ${contents}=   Get File    ${path}\\${file}
     @{lines}=      Split to lines      ${contents}
     FOR    ${line}    IN    @{lines}
         Log    ${line}     WARN
     END
         Get File    ${path}\\${file}
         Log To Console    ${path}\\${file}
         File Should Not Be Empty    ${path}\\${file}
         END
    END
Tester Url errone
    Execute JavaScript    window.scrollTo(0, 10)
    Clear Element Text    xpath://*[@id="urls"]
    Input Text    xpath://*[@id="urls"]    https://www.youtube.com/watch?v=Ab5GOnkS1
    Click Button    xpath://*[@id="addReportBtn"]
    Wait Until Element Contains    xpath:/html/body/section[2]/div[2]/div[3]/div[2]/div/div/p   Une erreur s'est produite !
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)



