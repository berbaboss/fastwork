*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TIMEOUT}    30
${SPEED}      0.1

*** Keywords ***
Process start
	Set Selenium Timeout	${TIMEOUT}
	Set Selenium Speed		${SPEED}

Capture Screenshot if failed
    Run Keyword If Test Failed    Capture Page Screenshot    ./Fastwork.${TEST NAME}/${TEST NAME}.png

Process end
    SeleniumLibrary.Close Browser