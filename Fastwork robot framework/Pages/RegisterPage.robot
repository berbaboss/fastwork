*** Settings ***
Library    SeleniumLibrary
Resource    ..\\Utils\\SeleniumUtils.robot

*** Variables ***
#email
${accountName}      //input[@id='signup-request-username']        
${firstname}        //input[@id='signup-request-first_name']
${lastname}         //input[@id="signup-request-last_name"]
${emailRegist}      //input[@id="signup-request-email"]
${password}         //input[@id="signup-request-password"]   
${rePassword}       //input[@id="signup-request-confirm_password"]
${phoneNumber}      //input[@id="signup-request-phone_number"]
${termCondition}    //a[@href="https://fastwork.co/terms"]//parent::label//preceding-sibling::input
${pdpa}             //a[@href="https://fastwork.co/privacy"]//parent::label//preceding-sibling::input
${RegistBtn}        //button[contains(@class,'signup-btn')]
#google
${googleEmail}       //input[@type='email']
${googlePassword}    //input[@type='password']
${nextBtn}           //span[.='ถัดไป']
${notAllowbtn}          //a[.='ไม่ยินยอม']
#input
${accountNameInput}             testaccount       
${firstnameInput}               fastwork
${lastnameInput}                test
${emailRegistInputDup}          bossmanu3581@gmail.com
${emailRegistInputInvalid}      testmail
${emailRegistInputValid}        boss_manu@hotmail.com
${passwordInputValid}           test1234
${passwordInputInvalid}         test
${rePasswordInput}              test1234   
${rePasswordInputInvalid}       test12345 

*** Keywords ***
#============================email=================================================
Input account name on register Page
    Input Data -> ${accountNameInput} in -> ${accountName}

Input firstname on register Page
    Input Data -> ${firstnameInput} in -> ${firstname}

Input lastname on register Page
    Input Data -> ${lastnameInput} in -> ${lastname}

Input email on register Page
    Input Data -> ${emailRegistInputValid} in -> ${emailRegist}

Input duplicate email on register Page
    Input Data -> ${emailRegistInputDup} in -> ${emailRegist}

Input invalid email on register Page
    Input Data -> ${emailRegistInputInvalid} in -> ${emailRegist}

Input password on register Page
    Input Data -> ${passwordInputValid} in -> ${password}

Input invalid password on register Page
    Input Data -> ${passwordInputInvalid} in -> ${password}

Input repassword on register Page
    Input Data -> ${rePasswordInput} in -> ${rePassword}

Input wrong repassword on register Page
    Input Data -> ${rePasswordInputInvalid} in -> ${rePassword}

Click accept term and condition
    Click element ${termCondition} 

Click accept pdpa
    Click element ${pdpa} 

Click accept pdpa to uncheck
    Click element ${pdpa} 

Click register button
    Click element ${RegistBtn} 

#===================================google===============================================
Input google email    
    [Arguments]    ${google_email_input}
    Input Data -> ${google_email_input} in -> ${googleEmail}

Input google password
    [Arguments]    ${google_password_input}
    Input Data -> ${google_password_input} in -> ${googlePassword}

Click next button on google Page
    Click element ${nextBtn} 

Click not allow button on popup
    Click element ${notAllowbtn} 
    
#==================================check=====================================
Check account can register succesfully
    Page should contain element     //p[@class='_lh-125pct _mgbt-16px']

Check invalid password require
    Page should contain element     //div[text()='Password must contain only alphabets and numbers at least 8-characters']

Check email cant duplicate
    Page should contain element     //div[text()='email already exist']

Check email is invalid form
    Page Should Not Contain Element     //p[@class='_lh-125pct _mgbt-16px']

Check password is not match
    Page should contain element     //div[text()='confirmation password is not match']

Check register button is disable
    Element Should Be Disabled    ${RegistBtn} 

Check field cant be empty
    Page Should Not Contain Element     //p[@class='_lh-125pct _mgbt-16px']