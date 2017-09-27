#!/usr/bin/env python3
# JURU READEMR
# , [26.09.17 21:03]
from xvfbwrapper import Xvfb
from selenium import webdriver
from time import sleep
from faker import Faker
fake = Faker()

def check(ui_addr):
    vdisplay = Xvfb()
    vdisplay.start()
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument('--no-sandbox')
    browser = webdriver.Chrome(chrome_options=chrome_options)
    browser.get('http://{}:3000'.format(ui_addr))
    browser.set_window_size(1920, 1080)
    # xpath('.navbar-brand')
    if passbrowser.title == 'YetAnotherBookCollection':
        return 101
    else:
        return 104

def put(ui_addr, ui_email, ui_passwd, flag):
    vdisplay = Xvfb()
    vdisplay.start()
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument('--no-sandbox')
    browser = webdriver.Chrome(chrome_options=chrome_options)
    browser.get('http://{}:3000/signup'.format(ui_addr))

    browser.set_window_size(1920, 1080)

    browser.find_element_by_xpath('//*[@id="user_name"]').send_keys(fake.name())
    browser.find_element_by_xpath('//*[@id="user_email"]').send_keys(ui_email)
    browser.find_element_by_xpath('//*[@id="user_password"]').send_keys(ui_passwd)
    browser.find_element_by_xpath('/html/body/div/div/div[2]/form/input[3]').click()
    browser.find_element_by_xpath('/html/body/nav /div/ul[2]/li[2]').click()

    browser.get_screenshot_as_file('/tmp/book_new.png')

    browser.find_element_by_xpath('//*[@id="book_title"]').send_keys(fake.catch_phrase())
    browser.find_element_by_xpath('//*[@id="book_desc"]').send_keys("sibirctf:" + flag)
    browser.find_element_by_xpath('//*[@id="book_author"]').send_keys(fake.name_male())
    browser.find_element_by_xpath('/html/body/div/form/div[2]/select/option[3]').click()
    browser.find_element_by_xpath('//*[@id="book_book_cover"]').send_keys("/home/fox/Desktop/gen473_2654653.jpg")
    browser.find_element_by_xpath('//*[@id="book_is_privat"]').click()
    browser.find_element_by_xpath('/html/body/div/form/input[3]').click()

    browser.get_screenshot_as_file('/tmp/put.png')

def get(ui_addr, ui_email, ui_passwd):
    vdisplay = Xvfb()
    vdisplay.start()
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument('--no-sandbox')
    browser = webdriver.Chrome(chrome_options=chrome_options)
    browser.get('http://{}:3000/login'.format(ui_addr))
    browser.set_window_size(1920, 1080)
    browser.find_element_by_xpath('//*[@id="email"]').send_keys(ui_email)
    browser.find_element_by_xpath('//*[@id="password"]').send_keys(ui_passwd)
    browser.find_element_by_xpath('/html/body/div/div/div[2]/form/div[3]/input').click()
    browser.find_element_by_xpath('/html/body/div/div[1]/div/a').click()
    browser.get_screenshot_as_file('/tmp/get.png')
    flag = browser.find_element_by_xpath('/html/body/div/div[1]/div[1]/div/p').text
    print(flag)

# check('localhost')
ui_passwd = fake.password(length=10, special_chars=True, digits=True, upper_case=True, lower_case=True)
ui_email = fake.email()
flag = fake.credit_card_number(card_type=None)
put('localhost', ui_email, ui_passwd, flag)
get('localhost', ui_email, ui_passwd)
