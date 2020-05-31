from bs4 import BeautifulSoup
from selenium import webdriver
from flask import Flask, request, jsonify
app = Flask(__name__)

@app.route('/getting', methods=['GET'])
def run(lst):
    #driver = webdriver.Chrome()
    #for i in lst:
     #   URL = lst[i]
      #  driver.get(URL)
        # need to get preferences from firebase to search within the text
       # if(driver.getPageSource().contains("hello")):
        #    lst.remove[i]



    return {'Results': lst}


