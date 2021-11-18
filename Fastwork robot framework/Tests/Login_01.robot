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
${emailWrong}    
${email}   
${passwordWrong}   
${password}

*** Test Cases ***
Login-01-001
    [Documentation]    Cant login with wrong email
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Click Accept cookie policy
    Click close popup
    Click login menu on header
    Sign in with email    ${emailWrong} 
    Click next button
    Check wrong email

Login-01-002
    [Documentation]    Cant login with correct email and wrong password
    Sign in with email    ${email}
    Input password after input email    ${passwordWrong}   
    Click Sign in button
    check password is wrong

Login-01-003
    [Documentation]    Can click forget password
    Click forget password
    check send password to email appear
    go back

Login-01-004
    [Documentation]    Can login with email successful
    Input password after input email    ${password}   
    Click Sign in button