from tkinter import *
import tkinter as tk
class Checkbar(Frame):
   def __init__(self, parent=None, picks=[], side=LEFT, anchor=W):
      Frame.__init__(self, parent)
      self.vars = []
      for pick in picks:
         var = IntVar()
         chk = Checkbutton(self, text=pick, variable=var)
         chk.pack(side=side, anchor=anchor, expand=YES)
         self.vars.append(var)
   def state(self):
      return map((lambda var: var.get()), self.vars)
if __name__ == '__main__':
   root = tk.Tk()
   root.title("RecipeMe")
   plist=['stuff',"idk"]
   protein = Checkbar(root, plist)
   dairy = Checkbar(root, ['milk',"yogurt"])
   sugar = Checkbar(root, ['sugar','choco'])
   grain = Checkbar(root, ['stuff'])
   veg = Checkbar(root, ['stuff'])
   fruit = Checkbar(root, ['stuff'])
   sauce = Checkbar(root, ['stuff'])
   protein.pack(side=TOP, fill=X)
   dairy.pack(side=TOP, fill=X)
   sugar.pack(side=TOP, fill=X)
   grain.pack(side=TOP, fill=X)
   veg.pack(side=TOP, fill=X)
   fruit.pack(side=TOP, fill=X)
   sauce.pack(side=TOP, fill=X)
   protein.config(relief=GROOVE, bd=2)
   dairy.config(relief=GROOVE, bd=2)
   sugar.config(relief=GROOVE, bd=2)
   grain.config(relief=GROOVE, bd=2)
   veg.config(relief=GROOVE, bd=2)
   fruit.config(relief=GROOVE, bd=2)
   sauce.config(relief=GROOVE, bd=2)

   def allstates(): 
      print(list(protein.state()), list(dairy.state()))
      searchlist = []
      for c in range(len(list(protein.state()))):
         if list(protein.state())[c]==1:
            searchlist.append((protein.vars)[c])
      print(searchlist)
   Button(root, text='Quit', command=root.quit).pack(side=RIGHT)
   Button(root, text='Save', command=allstates).pack(side=RIGHT)
   root.mainloop()