*** Settings ***
Library   SeleniumLibrary
Resource   ../config.txt
Resource   pom/login_obj.robot
*** Variables ***


*** Keywords ***
Login into Hevo pipiline
    open browser   ${URL}    ${browser}
    set selenium speed    2s
    set selenium implicit wait    20s
    maximize browser window
    input text    ${email_locator}     ${hevo_username}
    click element    ${coutinue_button}
    input text    ${password_locator}    ${hevo_password}
    click element    ${login_button}
    run keyword and ignore error   click element    ${close_tour}
    page should contain    ${hevo_username}

Logout Hevo and close the session
    click element    ${account_dropdown}
    click element    ${logout_button}
    close all browsers