*** Settings ***
Library           SeleniumLibrary
 
*** Variables ***
${URL}            http://automationexercise.com
${BROWSER}        chrome
${NAME}           TestUser12300
${EMAIL}            testuser1412@example.com

 
*** Test Cases ***
Register User with Existing Email
    [Documentation]    Test Case 5: Register User with existing email
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Home
    Click Link    Signup / Login
    Wait Until Page Contains    New User Signup!
    Input Text    name=name    ${NAME}
    Input Text    name=email    ${EMAIL}
    Click Button    xpath=//button[text()='Signup']
    Wait Until Page Contains    Email Address already exist!
    Close Browser