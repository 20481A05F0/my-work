'''#Question: Check Part of a String
Write a program that reads two words A, B, and an index I. Check if B starts at index I in A.

The input consists of a string representing A, a string representing B, and an integer representing I. The output should be a single line containing a boolean. True should be printed if the word B starts at index I of the word A, otherwise False should be printed.

For example, if the given words are A = Repeat, B = pea, and the index is I = 2, the output should be True as the string pea starts from the index 2 of the string Repeat.'''

a=input()
b=input()
index =int(input())
d=len(b)

'''
Question: Solid Right Angled Triangle
Given an integer number (N) as input, write a program to print the right-angled triangular pattern of N lines using an asterisk(*) character.

Input: The first line of input will contain a positive integer.

Output: The output should be N lines with an asterisk() character printing in a right-angled triangular pattern. Note: There is a space after each asterisk() character.

Example: If the given number is 4, the output should be:

*
* *
* * *
* * * *
'''
n=int(input())
c=1
while c<=n:
    print("* "*c)
    c+=1

''' 
   rectangle of M rows and N colmuns using numbers 
    '''

m=int(input())
n=int(input())
for i in range(1,m+1):
    print((str(i)+" ")*n)

'''
FIRST PERFECT SQUARE TO PRINT IN GIVEN RANGE

def perfect_square(n):
    u = n**0.5
    if u.is_integer():
        return True
    return False
m = int(input())
n = int(input())
for i in range(m,n+1):
    if perfect_square(i):
        print(i)
        break
else:
    print("No Perfect Square")
'''

'''
#READ A SENTENCE AND PRINT THE FREQUENCY OF EACH WORD IN GIVEN SENTENCE  SORTED IN ALPHABETICAL ORDER    
s = input()
l = s.split(" ")
l.sort()
d = {}
for i in l:
    if d.get(i) is not None:
        d[i] += 1
    else:
        d[i] = 1
for i in d:
    print(str(i)+": "+str(d[i]))
'''


'''
#READ A SENTENCE AND PRINT THE FREQUENCY OF EACH WORD IN GIVEN SENTENCE

s = input()
l = s.split(" ")
d = {}
for i in l:
    if d.get(i) is not None:
        d[i] += 1
    else:
        d[i] = 1
for i in d:
    print(str(i)+": "+str(d[i]))
'''



'''
GIVEN SPACE SEPERATED WORDS, PRINT THE WORDS THAT DO NOT START WITH LOWERCASE LETTER a
s=input().split()
s1=len(s)
nl=[]
for i in range(s1):
    a=s[i]
    if ord(a[0])!=ord("a"):
        nl.append(a)
print(nl)
        
'''

'''
MERGE THE LISTS

a=input().split()
b=input().split()
t=1
for i in b:
    a.insert(t,i)
    t+=2
print(a)
'''

'''
EVEN AND ODD NUMBERS

def even_odd(nl):
    even=[]
    odd=[]
    for i in nl:
        if i%2==0:
            even.append(i)
        else:
            odd.append(i)
    print(sorted(even))
    print(sorted(odd))
numbers=input()
s=numbers.split()
nl=[]
for i in s:
    nl.append(int(i))
even_odd(nl)

'''


'''
NTH TERM IN FIBONACCI SERIES

def fibanocii(n):
    if n<=1:
        return n
    return fibanocii(n-1)+fibanocii(n-2)
n=int(input())
result=fibanocii(n)
print(result)
'''

'''
REVERSE THE STRING

def get_reversed_string(string):
    # Complete this recursive function
    return string[::-1]
string = input()
resultant_string = get_reversed_string(string)
print(resultant_string)
'''

'''
kth smallest number iin the list

a=input()
k=int(input())
b=a.split(",")
l=[]
for i in b:
    l.append(int(i))
x=sorted(l,reverse=True)
print(x[-k])

'''


'''
prime numbers from 1 to n-2


def is_prime(n):
    if(n == 1 or n == 0):
        return False
        
    for i in range(2, n):
        if(n % i == 0):
            return False
            
    return True
 
n = int(input())
prime_numbers_list = []

for i in range(1, n + 1):
    if(is_prime(i)):
        prime_numbers_list.append(str(i))

prime_numbers_separated_by_spaces = " ".join(prime_numbers_list)
print(prime_numbers_separated_by_spaces)

'''
'''
prime numbers from m to n-2

def check_is_prime(a, b):
    n = b
    l = []
    
    
    for i in range(n+1):
        l.append(True)
    
    for i in range(2,int(n**0.5)+1):
        if l[i]:
            for j in range(i*i,n+1,i):
                l[j] = False
    l[0] = False
    l[1] = False
    for i in range(a,b+1):
        if l[i]:
            print(i,end=" ")
    # complete this function
    
a = int(input())
b = int(input())

check_is_prime(a,b)
'''


'''
prime numbers from m to n

m = int(input())
n = int(input())
found_prime = False  # Flag to check if a prime number is found

for num in range(m, n + 1):
    if num > 1:  # Prime numbers are greater than 1
        factors = 0
        for i in range(2, int(num**0.5) + 1):  # Check divisors up to sqrt(num)
            if num % i == 0:
                factors += 1
                break  # No need to check further if a factor is found
        if factors == 0:  # If no factors found, it's prime
            print(num, end=" ")
            found_prime = True

# If no prime numbers were found
if not found_prime:
    print("No Prime Numbers Found")

'''


'''
prime nums from 1 to n
n=int(input())
for number in range(2,n+1):
    factors=0
    for i in range(2,int(number**0.5)+1):
        if number%i==0:
            factors+=1
            break
    if factors==0:
        print(number)
'''


'''
M  pattern with *


n=int(input())
for i in range(1,n+1):
    stars=i
    spaces=4*(n-i)
    row=("* ")*stars+(" ")*spaces+("* ")*stars
    print(row)
'''