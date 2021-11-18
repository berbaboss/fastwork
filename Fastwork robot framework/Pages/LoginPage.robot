*** Settings ***
Library    SeleniumLibrary
Resource    ..\\Utils\\SeleniumUtils.robot

*** Variables ***
${logo}                //img[@src="/assets/images/logo.svg"]    
${facebookLogin}       //i[contains(@class,'facebook')]
${googleLogin}         //a[contains(@href,'google')]
${emailLogin}          //input[@id='authorize-request-Credential']
${passwordLogin}       //input[@id='signin-request-Password']
${signinBtn}           //button[.='เข้าสู่ระบบ']
${forgetPassword}      //a[@href="/oauth/forget-password"]
${nextBtn}             //button[@class='tb-button -fluid _mgt-12px']
${createAccount}       //a[@href="/oauth/signup"]

*** Keywords ***
Click Signin with Google account
    Click element ${googleLogin} 

Sign in with email
    [Arguments]    ${emailLoginInput}
    Input Data -> ${emailLoginInput} in -> ${emailLogin}

Input password after input email
    [Arguments]    ${passwordLoginInput}
    Input Data -> ${passwordLoginInput} in -> ${passwordLogin}

Click next button
    Click element ${nextBtn} 

Click Sign in button
    Click element ${signinBtn} 

Click forget password
    Click element ${forgetPassword}

Click create account
    Click element ${createAccount} 

#===========================check=====================
check wrong email
    Page should contain element     //div[text()='Incorrect username']

check password is wrong
    Page should contain element     //div[text()='Incorrect Password']

check send password to email appear
    Page should contain element     //button[.='ส่งรหัสยืนยัน']
