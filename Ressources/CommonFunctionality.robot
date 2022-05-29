*** Settings ***
Library  Selenium2Library
Library  OperatingSystem
*** Variables ***
${url}  demo.alteca.fr:4047/
${login}   demo
${pw}   R@7m"cfQT@k5
${browser}  chrome
${path}     C:\\downloads_selenium
*** Keywords ***

Debut Test
    Create Directory    ${path}
    ${prefs} =    Create Dictionary    download.default_directory=${path}
    Open Browser  https://${login}:${pw}@${url}  ${browser}    options=add_experimental_option("prefs",${prefs})
    #Open Browser  http://srvdoadopdemo.alteca.fr:4047/  ${browser}  options=add_experimental_option("prefs",${prefs})
    Maximize Browser Window

Fin Test
    Sleep    8s
    Close Browser