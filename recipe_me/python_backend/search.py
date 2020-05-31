from bs4 import BeautifulSoup
from selenium import webdriver
from firebase_admin import credentials
from firebase_admin import firestore
import firebase_admin


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

def searching(list):    
    try: 
        from googlesearch import search 
    except ImportError:  
        print("No module named 'google' found") 
    
    searchlist=[]
    for r in range(len(list)+1):
        searchlist = searchlist + combo(list,r)
    #print(searchlist)
    idx=1
    listofurls=[]
    while idx<len(searchlist):
        query= str(searchlist[idx])+" recipe"
        print(query)
        for j in search(query, tld="co.in", num=10, stop=10, pause=2): 
            listofurls.append(str(j))
        idx+=1
    getLink(listofurls)

def getLink(list):

    cred =  credentials.Certificate('fb.json')
    firebase_admin.initialize_app(cred)
    db = firestore.client();

    doc_ref = db.collection('userpreferences').where('name', '==', 'tishya').stream()

    for doc in doc_ref:
        dict = '{} => {}'.format(doc.id, doc.to_dict())
    
    
    driver = webdriver.Chrome()
    for i in list:
        URL = list[i]
        driver.get(URL)

        for x in dict:

            if(dict[x]):
                
                if(driver.getPageSource().contains("hello")):
                    list.remove[i]

    return list
