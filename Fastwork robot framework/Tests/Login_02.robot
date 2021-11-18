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
${wrongEmailInput}
${EmailInput}
${wrongPasswordInput}
${PasswordInput}

*** Test Cases ***
Login-02-001
    [Documentation]    cant login with google-login with wrong google email
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Click Accept cookie policy
    Click close popup
    Click login menu on header
    Click Signin with Google account
    Input google email    ${wrongEmailInput}
    Click next button on google Page

Login-02-002
    [Documentation]    cant login with google-login with correct emaill and wrong password
    Input google email    ${EmailInput}
    Click next button on google Page
    Input google password    ${wrongPasswordInput}
    Click next button on google Page

Login-02-003
    [Documentation]    Can login with google login successful
    Input google password    ${PasswordInput}
    Click next button on google Page


