*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://automationexercise.com
${BROWSER}        chrome
${NAME}           TestUser
${EMAIL}          testuser@example.com
${PASSWORD}       Password123
${TITLE}          Mr
${FIRST_NAME}     Test
${LAST_NAME}      User
${COMPANY}        TestCompany
${ADDRESS1}       123 Test Street
${ADDRESS2}       Apt 456
${COUNTRY}        United States
${STATE}          California
${CITY}           Los Angeles
${ZIPCODE}        90001
${MOBILE}         1234567890

*** Test Cases ***
Register User
    [Documentation]    Test Case 1: Register User
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Home
    Click Link    Signup / Login
    Wait Until Page Contains    New User Signup!    timeout=15s
    Input Text    name=name    ${NAME}
    Input Text    name=email    ${EMAIL}
    Click Button    xpath=//button[text()='Signup']
    Capture Page Screenshot
    Wait Until Page Contains    ENTER ACCOUNT INFORMATION    timeout=15s
    Click Element    id=id_gender1
    Input Text    id=password    ${PASSWORD}
    Select From List By Value    id=days    1
    Select From List By Value    id=months    1
    Select From List By Value    id=years    2000
    Click Element    id=newsletter
    Click Element    id=optin
    Input Text    id=first_name    ${FIRST_NAME}
    Input Text    id=last_name    ${LAST_NAME}
    Input Text    id=company    ${COMPANY}
    Input Text    id=address1    ${ADDRESS1}
    Input Text    id=address2    ${ADDRESS2}
    Select From List By Label    id=country    ${COUNTRY}
    Input Text    id=state    ${STATE}
    Input Text    id=city    ${CITY}
    Input Text    id=zipcode    ${ZIPCODE}
    Input Text    id=mobile_number    ${MOBILE}
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Page Contains    ACCOUNT CREATED!    timeout=15s
    Click Link    Continue
    Wait Until Page Contains    Logged in as ${NAME}    timeout=15s
    Click Link    Delete Account
    Wait Until Page Contains    ACCOUNT DELETED!    timeout=15s
    Click Link    Continue
    Close Browser
    