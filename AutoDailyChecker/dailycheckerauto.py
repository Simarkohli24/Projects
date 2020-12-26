import selenium
from selenium import webdriver
import json

# Grab user data
with open('UserInfo.txt') as json_file:
    data = json.load(json_file)

# User Password
user_netid = data['NetID']
user_pw = data['PW']

# Driver Location for Chrome Initialization
driverLocation = data['CDLoc']

# Navigating to daily check in site
driver = webdriver.Chrome(driverLocation)
driver.get('https://dailycheck.cornell.edu/choose_login?redirect=%2Fdaily-checkin')

# Finding dailycheck button and clicking
dailycheckbutton = driver.find_element_by_class_name(
    "link-button")
dailycheckbutton.click()

# Inputting NetID
netID = driver.find_element_by_id("netid")
netID.send_keys(user_netid)

# Inputting Password
pw = driver.find_element_by_id("password")
pw.send_keys(user_pw)

submit = driver.find_element_by_name("Submit")
submit.click()

# Continue
continue_button = driver.find_element_by_id("continue")
continue_button.click()

# Select all answers
first_question = driver.find_element_by_id("positivetest-no")
first_question.click()

second_question = driver.find_element_by_id("covidsymptoms-no")
second_question.click()

third_question = driver.find_element_by_id("contactdiagnosed-no")
third_question.click()

fourth_question = driver.find_element_by_id("contactsymptoms-no")
fourth_question.click()

# Final Submission
final_submit = driver.find_element_by_name("submit")
final_submit.click()

# Legit final submission
final_final_submit = driver.find_element_by_name("submit")
final_final_submit.click()

# Quit Browser
driver.quit()
