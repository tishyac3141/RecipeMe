from bs4 import BeautifulSoup
import requests

def run(list):
    for i in list:
        URL = list[i]
        page = requests.get(URL)

        soup = BeautifulSoup(page.content, 'html.parser')

