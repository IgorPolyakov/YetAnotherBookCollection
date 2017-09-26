#!/usr/bin/env python3
# JURU READEMR
# , [26.09.17 21:03]
from xvfbwrapper import Xvfb
from selenium import webdriver
from time import sleep
import random

def get(arg):
    pass

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
def put(ui_addr, ui_email, ui_passwd):
    vdisplay = Xvfb()
    vdisplay.start()
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument('--no-sandbox')
    browser = webdriver.Chrome(chrome_options=chrome_options)
    browser.get('http://{}:3000/signup'.format(ui_addr))
    browser.set_window_size(1920, 1080)

    browser.find_element_by_xpath('//*[@id="user_name"]').send_keys("ui_name")
    browser.find_element_by_xpath('//*[@id="user_email"]').send_keys(ui_email)
    browser.find_element_by_xpath('//*[@id="user_password"]').send_keys(ui_passwd)
    browser.find_element_by_xpath('/html/body/div/div/div[2]/form/input[3]').click()

    sleep(1)

    # browser.get('http://{}:3000/books/new'.format(ui_addr))
    browser.find_element_by_xpath('/html/body/nav /div/ul[2]/li[2]').click()

    browser.get_screenshot_as_file('/tmp/book_new.png')

    sleep(1)

    browser.find_element_by_xpath('//*[@id="book_title"]').send_keys("ui_name")
    browser.find_element_by_xpath('//*[@id="book_desc"]').send_keys("ui_name")
    browser.find_element_by_xpath('//*[@id="book_author"]').send_keys("ui_name")
    # browser.find_element_by_xpath('//*[@id="book_category_id"]').selectByVisibleText('Other')?
    # browser.find_element_by_xpath('//*[@id="book_category_id"]/option[1]').click()
    browser.find_element_by_xpath('/html/body/div/form/div[2]/select/option[3]').click()
    # browser.findelement(by.xpath('//*[@id="book_category_id"]/option[1]')).click
    # browser.findElement({ xpath: '//*[@id="book_category_id"]/div/div[1]/select' }).sendKeys(Mr.);
    # /html/body/div/form/div[2]/select/option[3]
    # By.xpath("//select[@id='groupSelect']/option[1]")
    browser.find_element_by_xpath('//*[@id="book_book_cover"]').send_keys("/home/fox/Desktop/gen473_2654653.jpg")
    browser.find_element_by_xpath('//*[@id="book_is_privat"]').click()
    browser.find_element_by_xpath('/html/body/div/form/input[3]').click()

    browser.get_screenshot_as_file('/tmp/scr.png')
# check('localhost')
put('localhost', str(random.random() * 100) + '@maoi.com', 'ui_passwd')
