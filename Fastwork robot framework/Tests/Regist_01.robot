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

*** Test Cases ***
Regist-01-001
    [Documentation]    Cant create account without account name
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Click Accept cookie policy
    Click close popup
    Click login menu on header
    Click create account
    Input firstname on register Page
    Input lastname on register Page
    Input email on register Page
    Input password on register Page
    Input repassword on register Page
    Click accept term and condition   
    Click accept pdpa
    Click register button
    Check field cant be empty

Regist-01-002
    [Documentation]    Cant create account without first name
    Input account name on register Page
    Clear Text in ${firstname}
    Click register button
    Check field cant be empty

Regist-01-003
    [Documentation]    Cant create account without surname
    Input firstname on register Page
    Clear Text in ${lastname}
    Click register button
    Check field cant be empty

Regist-01-004
    [Documentation]    Cant create account without email
    Input lastname on register Page
    Clear Text in ${emailRegist}
    Click register button
    Check field cant be empty

Regist-01-005
    [Documentation]    Cant create account with duplicate email 
    Input duplicate email on register Page
    Click register button
    Check email cant duplicate
    
Regist-01-006
    [Documentation]    Cant create account with invalid email form
    Input invalid email on register Page
    Click accept term and condition
    Click accept pdpa
    Click register button
    Check email is invalid form

Regist-01-007
    [Documentation]    Cant create account without password
    Input email on register Page
    Clear Text in ${password}
    Click register button
    Check field cant be empty

Regist-01-008
    [Documentation]    Cant create account without valid password require
    Input invalid password on register Page
    Click register button
    Check invalid password require

Regist-01-009
    [Documentation]    Cant create account without repassword
    Input password on register Page
    Clear Text in ${rePassword}
    Click accept term and condition
    Click accept pdpa
    Click register button
    Check field cant be empty

Regist-01-010
    [Documentation]    Cant create account if password dont match 
    Input wrong repassword on register Page
    Click register button
    Check password is not match

Regist-01-011
    [Documentation]    Cant create account without select term and condition
    Input repassword on register Page
    Click accept pdpa
    Check register button is disable

Regist-01-012
    [Documentation]    Cant create account without select pdpa
    Click accept term and condition
    Click accept pdpa to uncheck 
    Check register button is disable
    
Regist-01-013
    [Documentation]    Can create account succesfully
    Click accept pdpa
    Click register button
    Check account can register succesfully
