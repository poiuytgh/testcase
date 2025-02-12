*** Settings ***
Library           SeleniumLibrary
 
*** Variables ***
${URL}            http://automationexercise.com
${BROWSER}        chrome
${EMAIL}          testuser1412@example.com
${PASSWORD}       password12300
${NAME}           TestUser12300
 
*** Test Cases ***
Logout User
    [Documentation]    Test Case 4: Logout User
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Home
    Click Link    Signup / Login
    Wait Until Page Contains    Login to your account
    Input Text    name=email    ${EMAIL}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[text()='Login']
    Wait Until Page Contains    Logged in as ${NAME}
    Click Link    Logout
    Wait Until Page Contains    Login to your account
    Close Browse