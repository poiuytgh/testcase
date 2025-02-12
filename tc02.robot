from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
import time

service = Service('path/to/chromedriver')
driver = webdriver.Chrome(service=service)

try:

    driver.get('http://automationexercise.com')


    WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.TAG_NAME, 'body'))
    )
    print("Homepage is visible successfully.")


    signup_login_button = driver.find_element(By.LINK_TEXT, 'Signup / Login')
    signup_login_button.click()


    WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.XPATH, "//h2[text()='Login to your account']"))
    )
    print("'Login to your account' is visible.")

    email_input = driver.find_element(By.NAME, 'email')
    password_input = driver.find_element(By.NAME, 'password')
    
    email_input.send_keys('your_email@example.com')  ง
    password_input.send_keys('your_password')


    login_button = driver.find_element(By.XPATH, "//button[text()='Login']")
    login_button.click()


    WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.XPATH, "//a[contains(text(), 'Logged in as')]"))
    )
    print("'Logged in as username' is visible.")


    delete_account_button = driver.find_element(By.LINK_TEXT, 'Delete Account')
    delete_account_button.click()


    WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.XPATH, "//h2[contains(text(), 'ACCOUNT DELETED!')]"))
    )
    print("'ACCOUNT DELETED!' is visible.")

except TimeoutException:
    print("An element did not load in time.")

finally:

    time.sleep(3)
    driver.quit()