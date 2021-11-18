*** Settings ***
Library    SeleniumLibrary
Resource    ..\\Pages\\Homepage.robot
Resource    ..\\Pages\\LoginPage.robot
Resource    ..\\Pages\\RegisterPage.robot
Resource    ..\\Utils\\TestUtils.robot
Suite Setup    Process start
Test Teardown    Capture Screenshot if failed
Suite Teardown    Process end

*** Variables ***
${url}    https://fastwork.co/
${googlePasswordInput}
    

*** Test Cases ***
Regist-02-001
    [Documentation]    cant regist account with google-login without google email
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Click Accept cookie policy
    Click close popup
    Click login menu on header
    Click Signin with Google account
    Input google email    ${EMPTY}
    Click next button on google Page
    
Regist-02-002
    [Documentation]    cant regist account with google-login without google password
    Input google email    boss_manu@hotmail.com
    Click next button on google Page
    Input google password    ${EMPTY}

Regist-02-003
    [Documentation]    cant regist account with google-login without select term and condition
    Input google password    ${googlePasswordInput}
    Click accept pdpa
    Check register button is disable
    
Regist-02-004
    [Documentation]    cant regist account with google-login without select PDPA
    Click accept term and condition
    Click accept pdpa to uncheck
    Check register button is disable

Regist-02-005
    [Documentation]    cant regist account after click not allow 
    Click not allow button on popup

Regist-02-006
    [Documentation]    can regist account with google-login succesfully
    Click login menu on header
    Click Signin with Google account
    Click accept term and condition
    Click accept pdpa
    Click register button