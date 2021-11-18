*** Settings ***
Library    SeleniumLibrary
Resource    ..\\Pages\\SearchPage.robot
Resource    ..\\Pages\\HomePage.robot
Resource    ..\\Utils\\TestUtils.robot
Suite Setup    Process start
Test Teardown    Capture Screenshot if failed
Suite Teardown    Process end

*** Variables ***
${url}    https://fastwork.co/search
${searchFound}    flutter
${searchNotFound}       abcdef 

*** Test Cases ***
Search-01-001
    [Documentation]    Can search succesfully
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Click Accept cookie policy
    Click close popup
    Input ${searchFound} in search box
    Click search icon 
    Wait loading disappear
    # check search ${searchFound} should appear on card title

Search-01-002
    [Documentation]    Can search with no result 
    Input ${searchNotFound} in search box
    Click search icon    
    Wait loading disappear
    Check search output not match

Search-01-003
    [Documentation]    Can sort with period of work and clear
    Input ${searchFound} in search box
    Click search icon         
    Wait loading disappear
    Click time period and select ${24hours} 
    click confirm button
    Click time period and select ${24hours} 
    click clear button
    click confirm button
    
Search-01-004
    [Documentation]    Can sort with score and clear
    click all btn and select 5 star
    click confirm button
    Check card show correct score
    click all btn and select 5 star
    click clear button
    click confirm button
    
Search-01-005
    [Documentation]    Can sort with price and clear
    click price range and input 5,000 to 5,000
    click confirm button price range popup
    check price show correct on card
    click price range and input 5,000 to 5,000
    click clear button price range popup
    click confirm button price range popup

Search-01-006
    [Documentation]    Can sort with payment method and clear
    toogle slipt payment to activate 
    Check split payment label show on card