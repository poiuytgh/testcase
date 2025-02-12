*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             http://automationexercise.com
${BROWSER}         Chrome

*** Test Cases ***
Verify Product Quantity In Cart
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//div[@class='logo pull-left']
    Page Should Contain Element      xpath=//div[@class='logo pull-left']

    Click Element    xpath=(//a[contains(text(),'View Product')])[1]
    Wait Until Element Is Visible    xpath=//div[@class='product-information']
    Page Should Contain Element      xpath=//div[@class='product-information']

    Clear Element Text    xpath=//input[@id='quantity']
    Input Text            xpath=//input[@id='quantity']    4
    Click Element         xpath=//button[@type='button' and contains(., 'Add to cart')] | //a[contains(@class, 'add-to-cart')]

    Wait Until Element Is Visible    xpath=//u[contains(text(),'View Cart')]
    Click Element          xpath=//u[contains(text(),'View Cart')]

    Wait Until Element Is Visible    xpath=//section[@id='cart_items']
    Page Should Contain Element      xpath=//section[@id='cart_items']

    ${quantity}=    Get Text    xpath=//td[@class='cart_quantity']/button
    Should Be Equal As Strings    ${quantity}    4

    Close Browser