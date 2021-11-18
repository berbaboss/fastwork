*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ..\\Utils\\SeleniumUtils.robot

*** Variables ***
${searchBox}       //input[@name='q']
${searchOutput}    //div[@class='u-halign-split']/div/strong
${searchIcon}      //i[@class='far fa-search']
${timeWork}        //span[.='ระยะเวลาการทำงาน']
${24hours}         //span[.='ใน 24 ชม.']
${3day}            //span[.='ใน 3 วัน']
${7day}            //span[.='ใน 7 วัน']
${priceRange}      //span[.='ช่วงราคา']
${startPrice}      //input[@data-selenium='dynamic-filter.RANGE.from.ช่วงราคา']
${endPrice}        //input[@data-selenium='dynamic-filter.RANGE.to.ช่วงราคา']
${allBtn}          //span[.='ทั้งหมด']
${5star}           //span[.='5']
${confirmBtn}      //button[@data-selenium='dynamic-filter-sidebar.button.apply-filter']
${confirmPrice}    (//button[@data-selenium='dynamic-filter.button.apply-filter'])[2]
${clearSortBtn}    //button[@data-selenium='dynamic-filter-sidebar.button.clear-filter']
${clearPrice}      (//button[@data-selenium='dynamic-filter.button.clear-filter'])[2]
${splitPay}        //input[@data-selenium='dynamic-filter.TOGGLE.จ้างงานแบบแบ่งชำระ']
${card}            //a[@class='tb-card-product -animate card-product _cs-pt']
${cardTitle}       (//div[@class='slot-title']/div[@class='title'])[Position]
${rating}          (//div[@class='slot-rating _dp-f _alit-fe _wsp-nw']//div)[Position]
${price}           (//div[@class='slot-price']//div[@class='_cl-primary-500 _fs-200'])[Position]
${src}             (//div[@class='_dp-f _fw-w _mnh-16px']/img[@src='https://storage.googleapis.com/fastwork-asset/product_options/badge_milestone_thai_x3.png'])[Position]
*** Keywords ***
Input ${item} in search box
    Input Data -> ${item} in -> ${searchBox}

Click search icon 
    Click element ${searchIcon} 

Check search output match search ${input}
    ${text}    get text    //div[@class='u-halign-split']/div/strong
    should be equal    ${text}    ${input}    

Check search output not match
    Page should contain element    //h4[.='ไม่พบการค้นหา ลองให้เราช่วยเลือกสิ!']

Click time period and select ${sort} 
    Click element ${timeWork} 
    Click element ${sort} 

click price range and input ${price1} to ${price2}
    Click element ${priceRange} 
    Input Data -> ${price1} in -> ${startPrice}
    Input Data -> ${price2} in -> ${endPrice}

click all btn and select 5 star
    Click element ${allBtn} 
    Click element ${5star} 

click confirm button
    Click element ${confirmBtn} 

click confirm button price range popup
    Click element ${confirmPrice} 

click clear button
    Click element ${clearSortBtn} 

click clear button price range popup
    Click element ${clearPrice} 

toogle slipt payment to activate 
    Click element ${splitPay} 

Wait loading disappear
    Wait Until Element Is Not Visible    //i[@class='u-animation-spin-1 icon-spinner fad fa-spinner-third _pdt-2px _cl-primary-500']
    sleep    1
    
check search ${input} should appear on card title
    wait until element is visible    ${card}    
    ${card_count}    get element count    ${card}
    FOR    ${x}     IN RANGE    ${card_count}
        ${x} =      Evaluate    ${x}+1
        ${x}        Convert To String    ${x}
        ${new_title_path}    Replace String    ${cardTitle}      Position    ${x}
        ${get_title_card}    get text    ${new_title_path}
        ${get_title_card}    Convert To Lower Case    ${get_title_card}  
        should contain    ${get_title_card}    ${input}
    END

Check card show correct score
    wait until element is visible    ${card}    
    ${card_count}    get element count    ${card}
    FOR    ${x}     IN RANGE    ${card_count}
        ${x} =      Evaluate    ${x}+1
        ${x}        Convert To String    ${x}
        ${new_score_path}    Replace String    ${rating}      Position    ${x}
        ${get_score_card}    get text    ${new_score_path}
        ${get_score_number_card}    split String    ${get_score_card}    (    
        ${get_number}    Get Variable value     ${get_score_number_card[0]}
        should be equal    ${get_number}    5
    END

check price show correct on card
    ${card_count}    get element count    ${card}
    FOR    ${x}     IN RANGE    ${card_count}
        ${x} =      Evaluate    ${x}+1
        ${x}        Convert To String    ${x}
        ${new_price_path}    Replace String    ${price}      Position    ${x}
        ${get_price_card}    get text    ${new_price_path}
        ${get_price_card}    remove String    ${get_price_card}    ฿
        should be equal    ${get_price_card}    5,000
    END

Check split payment label show on card
    ${card_count}    get element count    ${card}
    FOR    ${x}     IN RANGE    ${card_count}
        ${x} =      Evaluate    ${x}+1
        ${x}        Convert To String    ${x}
        ${new_src_value}    Replace String    ${src}      Position    ${x}
        Page should contain element    ${new_src_value}     
    END
