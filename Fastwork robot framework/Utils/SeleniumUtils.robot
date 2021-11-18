*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Click element ${locator} 
    SeleniumLibrary.Wait Until Element Is Visible	${locator}    10
	SeleniumLibrary.click element	${locator}    

Input Data -> ${data} in -> ${TextBox}
	SeleniumLibrary.Wait Until Element Is Enabled    ${TextBox}
	SeleniumLibrary.click element	${TextBox}
	SeleniumLibrary.Input Text   ${TextBox}    ${data}

get text from ${locator}
    Wait until element is Visible    ${locator}
	${text}    get text    ${locator}
	[Return]    ${text}

Clear Text in ${locator}
    [Documentation]    Clear all text in locator
    Wait Until Element Is Visible       ${locator}
    Press Keys         ${locator}       CTRL+a+BACKSPACE 