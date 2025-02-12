*** Settings ***
Library    SeleniumLibrary  # โหลด SeleniumLibrary เพื่อใช้สำหรับการทดสอบ UI

*** Variables ***
${URL}             http://automationexercise.com  # URL ของเว็บไซต์ที่ต้องการทดสอบ
${BROWSER}         Chrome  # กำหนดให้ใช้ Chrome เป็นเบราว์เซอร์ในการทดสอบ

*** Test Cases ***
Verify Product Quantity In Cart
    # เปิดเว็บเบราว์เซอร์และเข้าเว็บไซต์
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window  # ขยายหน้าต่างเบราว์เซอร์ให้เต็มจอ
    Wait Until Element Is Visible    xpath=//div[@class='logo pull-left']  # รอให้โลโก้ปรากฏขึ้น
    Page Should Contain Element      xpath=//div[@class='logo pull-left']  # ตรวจสอบว่ามีโลโก้แสดงอยู่

    # คลิกดูสินค้าตัวแรก
    Click Element    xpath=(//a[contains(text(),'View Product')])[1]
    Wait Until Element Is Visible    xpath=//div[@class='product-information']  # รอให้หน้าข้อมูลสินค้าปรากฏขึ้น
    Page Should Contain Element      xpath=//div[@class='product-information']  # ตรวจสอบว่ามีข้อมูลสินค้าแสดงอยู่

    # กรอกจำนวนสินค้า
    Clear Element Text    xpath=//input[@id='quantity']  # ล้างค่าจำนวนสินค้าก่อน
    Input Text            xpath=//input[@id='quantity']    4  # กรอกจำนวนสินค้าเป็น 4
    Click Element         xpath=//button[@type='button' and contains(., 'Add to cart')] | //a[contains(@class, 'add-to-cart')]  # คลิกปุ่ม "Add to cart"

    # เปิดตะกร้าสินค้า
    Wait Until Element Is Visible    xpath=//u[contains(text(),'View Cart')]  # รอให้ปุ่ม "View Cart" ปรากฏขึ้น
    Click Element          xpath=//u[contains(text(),'View Cart')]  # คลิกเพื่อเข้าไปดูตะกร้า

    # ตรวจสอบจำนวนสินค้าในตะกร้า
    Wait Until Element Is Visible    xpath=//section[@id='cart_items']  # รอให้หน้าตะกร้าสินค้าปรากฏขึ้น
    Page Should Contain Element      xpath=//section[@id='cart_items']  # ตรวจสอบว่าตะกร้าสินค้ามีอยู่จริง

    ${quantity}=    Get Text    xpath=//td[@class='cart_quantity']/button  # ดึงค่าจำนวนสินค้าจากตะกร้า
    Should Be Equal As Strings    ${quantity}    4  # ตรวจสอบว่าจำนวนสินค้าเท่ากับ 4 หรือไม่

    # ปิดเบราว์เซอร์
    Close Browser