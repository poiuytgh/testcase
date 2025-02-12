*** Settings ***
Library           SeleniumLibrary
 
*** Variables ***
${URL}            http://automationexercise.com
${BROWSER}        chrome
${NAME}           TestUser1412
${EMAIL}          testuser1412@example.com
${SUBJECT}        Test Subject
${MESSAGE}        This is a test message.
${FILE_PATH}      ${CURDIR}/testfile.txt  # ให้สร้างไฟล์ testfile.txt ในโฟลเดอร์เดียวกับไฟล์นี้
 
*** Test Cases ***
Contact Us Form
    [Documentation]    Test Case 6: Contact Us Form
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Home
    Click Link    Contact Us
    Wait Until Page Contains    GET IN TOUCH
    Input Text    name=name    ${NAME}
    Input Text    name=email    ${EMAIL}
    Input Text    name=subject    ${SUBJECT}
    Input Text    name=message    ${MESSAGE}
    Choose File    name=upload_file    ${FILE_PATH}
    Click Button    xpath=//input[@type='submit']
    Handle Alert    ACCEPT
    Wait Until Page Contains    Success! Your details have been submitted successfully.
    Click Link    Home
    Wait Until Page Contains    Home
    Close Browser