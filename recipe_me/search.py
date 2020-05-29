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
    return listofurls
        

print(searching(["eggs","ham","peas"]))