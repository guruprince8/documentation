>>> fruits = ['apple','banana','kiwi','apple','banana','pears']
>>> fruits
['apple', 'banana', 'kiwi', 'apple', 'banana', 'pears']
>>> fruits.count('apple')
2
>>> fruits.count('cherry')
0
>>> fruits.index('banana')
1
>>> fruits.index('banana',4)
4
>>> fruits.reverse()
>>> fruits
['pears', 'banana', 'apple', 'kiwi', 'banana', 'apple']
>>> fruits.append('grapes')
>>> fruits
['pears', 'banana', 'apple', 'kiwi', 'banana', 'apple', 'grapes']
>>> fruits.sort()
>>> fruits
['apple', 'apple', 'banana', 'banana', 'grapes', 'kiwi', 'pears']
>>> fruits.pop()
'pears'
>>> fruits.pop()
'kiwi'
>>> fruits.pop('grapes')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'str' object cannot be interpreted as an integer
>>> fruits.pop(1)
'apple'
>>> fruits.pop(2)
'banana'
>>> fruits
['apple', 'banana', 'grapes']
>>> fruits = ['apple','banana','kiwi','apple','banana','pears']
>>> fruits
['apple', 'banana', 'kiwi', 'apple', 'banana', 'pears']
>>> from collections import deque
>>> queue = deque(["Eric","John","Michael"])
>>> queue
deque(['Eric', 'John', 'Michael'])
>>> queue.append('Terry')
>>> queue.append('Graham')
>>> queue.popleft()
'Eric'
>>> queue
deque(['John', 'Michael', 'Terry', 'Graham'])
>>> queue.popright()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: 'collections.deque' object has no attribute 'popright'
>>> queue.pop
<built-in method pop of collections.deque object at 0x101453d30>
>>> queue.pop()
'Graham'
>>> queue
deque(['John', 'Michael', 'Terry'])
>>> suares = []
>>> for i in range(10):
... print(i)
  File "<stdin>", line 2
    print(i)
    ^
IndentationError: expected an indented block after 'for' statement on line 1
>>> for i in range(10):
...     print(i)
... 
0
1
2
3
4
5
6
7
8
9
>>> for i in range(10:
  File "<stdin>", line 1
    for i in range(10:
                     ^
SyntaxError: invalid syntax
>>> for i in range(10):
...     squares.append(i**2)
... 
Traceback (most recent call last):
  File "<stdin>", line 2, in <module>
NameError: name 'squares' is not defined. Did you mean: 'suares'?
>>> squares = []
>>> for i in range(10):
...     squares.append(i**2)
... 
>>> squares
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
>>> x
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'x' is not defined
>>> i
9
>>> squares = list(map(lambda x : x**2, range(10))
... 
... )
>>> print(squares)
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
>>> squares = [x**2 for x in range(100)]
>>> 
>>> 
>>> squares
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961, 1024, 1089, 1156, 1225, 1296, 1369, 1444, 1521, 1600, 1681, 1764, 1849, 1936, 2025, 2116, 2209, 2304, 2401, 2500, 2601, 2704, 2809, 2916, 3025, 3136, 3249, 3364, 3481, 3600, 3721, 3844, 3969, 4096, 4225, 4356, 4489, 4624, 4761, 4900, 5041, 5184, 5329, 5476, 5625, 5776, 5929, 6084, 6241, 6400, 6561, 6724, 6889, 7056, 7225, 7396, 7569, 7744, 7921, 8100, 8281, 8464, 8649, 8836, 9025, 9216, 9409, 9604, 9801]
>>> import numpy as np
>>> np
<module 'numpy' from '/Users/gurubrahmanadamekambaram/anaconda3/lib/python3.11/site-packages/numpy/__init__.py'>
>>> [(x,y) for x in [1,2,3] for y in [3,1,4] if x!=y]
[(1, 3), (1, 4), (2, 3), (2, 1), (2, 4), (3, 1), (3, 4)]
>>> combs=[]
>>> for x in [1,2,3]:
...     for y in [3,1,4]:
...             if x!=y:
...                     combs.append((x,y))
... 
>>> combs
[(1, 3), (1, 4), (2, 3), (2, 1), (2, 4), (3, 1), (3, 4)]
>>> vec = [-4,-2,0,2,4]
>>> [x**2 for x in vec]
[16, 4, 0, 4, 16]
>>> [x for x in vec if x>=0]
[0, 2, 4]
>>> [abs(x) for x in vec]
[4, 2, 0, 2, 4]
>>> freshfruit = [' banana ',' loganberry ','passion fruit ']
>>> [ weapon.strip() for weapon in freshfruit]
['banana', 'loganberry', 'passion fruit']
>>> from math import pi
>>> [str[round(pi,i) for i in range(1,6)]
  File "<stdin>", line 1
    [str[round(pi,i) for i in range(1,6)]
     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
SyntaxError: invalid syntax. Perhaps you forgot a comma?
>>> [str(round(pi,i)) for i in range(1,6)]
['3.1', '3.14', '3.142', '3.1416', '3.14159']
>>> round(pi)
3
>>> pi
3.141592653589793
