from bs4 import BeautifulSoup
from selenium import webdriver
from firebase_admin import credentials
from firebase_admin import firebase

def run(list):
    driver = webdriver.Chrome()
    for i in list:
        URL = list[i]
        driver.get(URL)
        # need to get preferences from firebase to search within the text
        if(driver.getPageSource().contains("hello")):
            list.remove[i]

    return list


