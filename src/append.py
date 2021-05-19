import pandas as pd

import tkinter

from tkinter import OptionMenu
from tkinter import StringVar

master = tkinter.Tk()

master.geometry('400x200')

temp_list = ['Item1', 'Item2', 'Item3']
listchoice = StringVar(master=master)
listchoice.set(temp_list[0])
w = OptionMenu(master, listchoice, *temp_list)
w.pack()

# Add media

# Add tube

# Add plate

master.mainloop()