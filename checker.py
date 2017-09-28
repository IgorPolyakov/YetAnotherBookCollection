#!/usr/bin/env python3
# JURU READEMR
# , [26.09.17 21:03]
from sys import argv
from xvfbwrapper import Xvfb
from selenium import webdriver
from time import sleep
from faker import Faker
import hashlib
fake = Faker()

OK, GET_ERROR, CORRUPT, FAIL, INTERNAL_ERROR = 101, 102, 103, 104, 110

def check(argv):
    vdisplay = Xvfb()
    vdisplay.start()
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument('--no-sandbox')
    browser = webdriver.Chrome(chrome_options=chrome_options)
    browser.get('http://{}:3000'.format(argv))
    browser.set_window_size(1920, 1080)
    browser.get_screenshot_as_file('/tmp/check.png')
    if browser.title == 'YetAnotherBookCollection':
        return (OK)
    else:
        return (FAIL)

def put(argv):
    ui_addr     = argv[1]
    user        = argv[2]
    ui_flag     = argv[3]
    ui_email    = user + '@somemail.com'
    ui_passwd   = hashlib.sha224(user.encode('utf-8')).hexdigest()
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

# def get(ui_addr, ui_email, ui_passwd):
def get(argv):
    ui_addr = argv[1]
    ui_email = argv[2]
    ui_passwd = argv[3]
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

# # check('localhost')
# ui_passwd = fake.password(length=10, special_chars=True, digits=True, upper_case=True, lower_case=True)
# ui_email = fake.email()
# flag = fake.credit_card_number(card_type=None)
# put('localhost', ui_email, ui_passwd, flag)
# get('localhost', ui_email, ui_passwd)
if __name__ == '__main__':
    if len(argv) > 1:
        if argv[1] == "check":
            if len(argv) > 2:
                exit(check(argv[2]))
        elif argv[1] == "put":
            if len(argv) > 4:
                exit(put(argv[2], argv[3], argv[4]))
        elif argv[1] == "get":
            if len(argv) > 4:
                exit(get(argv[2], argv[3], argv[4]))
    exit(INTERNAL_ERROR)
