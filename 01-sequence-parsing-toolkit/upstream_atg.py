#Write a program that given a DNA string, prints out the 20 characters upstream of
#the start codon ATG

import re

#user input
i=str(input(r"Please enter a DNA sequence: "))

def function(i):
   x=re.search(r"[ATCG]{20}ATG", i)
   if x:
       print("20 bases upstream of the start codon ATG is: ", x.group().rstrip("ATG"))

function(i)
