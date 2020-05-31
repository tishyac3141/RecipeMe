from flask import Flask, request, jsonify
app = Flask(__name__)

from bs4 import BeautifulSoup
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from firebase_admin import credentials
from firebase_admin import firestore
import firebase_admin

cred =  credentials.Certificate('key.json')
firebase_admin.initialize_app(cred)
db = firestore.client()

doc_ref = db.collection('userpreferences').where('name', '==', 'tishya').stream()

for doc in doc_ref:
    dict = doc.to_dict()

key_list = list(dict.keys())
val_list = list(dict.values())

print(dict)

def combo(lst, n): 
       
    if n == 0: 
        return [[]] 
      
    l =[] 
    for i in range(0, len(lst)): 
          
        m = lst[i] 
        remLst = lst[i + 1:] 
          
        for p in combo(remLst, n-1): 
            l.append([m]+p) 
              
    return l 

@app.route('/api', methods=['GET'])
def searching():

    myItems = str(request.args['Query'])

    try: 
        from googlesearch import search 
    except ImportError:  
        print("No module named 'google' found") 

    lst = myItems.split(",")
    
    searchlist=[]
    for r in range(len(lst)+1):
        searchlist = searchlist + combo(lst,r)
    #print(searchlist)
    idx=1
    listofurls=[]
    while idx<len(searchlist):
        query = str(searchlist[idx]) + " recipe"
        for i in val_list:
            if(val_list[i]):
                query += key_list[i]
        print(query)
        for j in search(query, tld="co.in", num=10, stop=10, pause=2): 
            listofurls.append(str(j))
        idx+=1
    return jsonify((listofurls))

def getLink(listOfURLS):
    
    print("entered getLink()")
    driver = webdriver.Chrome(ChromeDriverManager().install())
    counter = 0
    
    for i in listOfURLS:
        print("for loop")
        URL = listOfURLS[counter]
        counter += 1
        driver.get(URL)

        for x in val_list:
            if(val_list[i] == 'true'):
                keyword = key_list[i] 
                if(driver.getPageSource().contains("hello")):
                    listOfURLS.remove[counter]

        return {'Results': listOfURLS}



