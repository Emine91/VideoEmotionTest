**** Settings ******
Library                         Selenium2Library
Documentation                   this is a basic test
Resource    ../Ressources/CommonFunctionality.robot
Resource    ../Ressources/ProjectObject/ReelTimePage.robot
Resource    ../Ressources/ProjectObject/AsynchPage.robot
Resource    ../Ressources/ProjectObject/ReversePage.robot
Test Setup      CommonFunctionality.Debut Test
Test Teardown   CommonFunctionality.Fin Test
**** Variables ****

**** Test Cases ****
User can open home page
     [Documentation]               as a user i can open the web page and see the tag line
     [Tags]     Fonctionnel
    #Set Selenium Speed    0.4s
    ReelTimePage.Verifier element statique

    ReelTimePage.Test liste url

    ReelTimePage.Lancer analyse

    ReelTimePage.Verifier resultat statistique globale

    #ReelTimePage.Verifier Resultat Locuteurs

    #ReelTimePage.Verifier Resultat Emotions

    #ReelTimePage.Verifier Click Emotion

    ReelTimePage.Verifier Fin traitement


     AsynchPage.Verifier element statique
     AsynchPage.Lancer analyse
     AsynchPage.Ajouter url
     AsynchPage.Annuler job
     AsynchPage.Verifier le bouton de collapse extension
     AsynchPage.Verifier le bouton de fermeture de panel
     AsynchPage.Telecharger le rapport
     AsynchPage.Tester Url errone


     ReversePage.Verifier element statique

**** KeyWords ****



