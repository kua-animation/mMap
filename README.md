
# Mmap 
**My Main assembly program**

# Mmap explane

Mmap is a sipele **x86_64 linux assembly API** for terminal drawing.
I use ubuntu linux it shud work on all linux distribution the shame. 
I use make for bilding and nasm as my assmbeler and ld for linking.


## cursor functions


| *name* | *rdi* | *rsi* | *rdx* | *rcx* | *r8* | *r9* |
|  :--:  |  :-:  |  :-:  |  :-:  |  :-:  | :--: | :--: | 
| **up** | number of line | 0x00 | 0x00 | 0x00 | 0x00 | 0x00 |
| **down** | number of line | 0x00 | 0x00 | 0x00 | 0x00 | 0x00 |
| **left** | number of columns | 0x00 | 0x00 | 0x00 | 0x00 | 0x00 |
| **right** | number of columns | 0x00 | 0x00 | 0x00 | 0x00 | 0x00 |
| **reset** | 0x00 | 0x00 | 0x00 | 0x00 | 0x00 | 0x00 | 0x00 | 0x00 |
## text functions

| *name* | *rdi* | *rsi* | *rdx* | *rcx* | *r8* | *r9* |
| :--: | :--: | :--: | :--: | :--: | :--: | :--: | 
| **line**  | X cursor offset | Y cursor offset | length | newline | char | 0x00 |
| **rect** | X cursor offset | Y cursor offset | width | height | char | 0x00 |
| **clear** | 0x00 | 0x00 | 0x00 | 0x00 | 0x00 | 0x00 |
| **clear_rect** | X cursor offset | Y cursor offset | width | height | 0x00 | 0x00 |
|**print** | file locatin | size of mesige factir of 16 | 0x00 | 0x00 | 0x00 | 0x00 | 


##### note offset starts form the top left of the 
##### trminal window **if you don't mov** the cursor.
