*** Settings ***
Library    SeleniumLibrary
Resource    ..\\Utils\\SeleniumUtils.robot

*** Variables ***
${cookie}                 //strong[.='จัดการคุกกี้']  
${acceptCookieBtn}        //span[.='ยินยอมทั้งหมด']
${popup}                  //div[@class='_pst-rlt']    
${closeBtn}               //i[@class='fal fa-times']   
${loginBtn}               //div[.='เข้าสู่ระบบ']    
 
*** Keywords ***
Click Accept cookie policy
    Wait until element is Visible    ${cookie}
    Click element ${AcceptCookieBtn} 

Click close popup
    Wait until element is Visible    ${popup}
    Click element ${closeBtn} 

Click login menu on header
    Click element ${loginBtn} 