#Write a program that given a DNA string, prints out the 20 characters upstream of
#the start codon ATG

#import re
import re

#user input
i=str(input(r"Please enter a DNA sequence: "))

#write a function that accepts the DNA sequence as input
def function(i):
   #use regular expression to match desired substring
   x=re.search(r"[ATCG]{20}ATG", i)
   #and print out result if present
   if x:
       print("20 bases upstream of the start codon ATG is: ", x.group().rstrip("ATG"))
#call function
function(i)    

