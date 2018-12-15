# Speller
An iOS app that checks if a word exists in a dictionary in O(1) time. 

![Speller](https://media.giphy.com/media/TgMDHBm76Q9DhENP0y/giphy.gif)

## Powered by C

The app is based on a [trie](https://en.wikipedia.org/wiki/Trie) data structure implemented in C. 

It loads a dictionary of 143,091 English words and checks if it contains a given word in about... 0,04 second!

It was initially written by me as a part of the [Harvard's CS50](https://www.edx.org/course/cs50s-introduction-computer-science-harvardx-cs50x) course's problem set. 

## Mix and match 

You'll find an Objective-C file in the project (dict.m). I've found out that I needed to import Foundation to provide access to my dictionary .txt file in the application bundle. The whole story is documented on the [Stack Overflow](https://stackoverflow.com/questions/25877635/my-c-program-reads-a-text-file-when-i-put-it-into-xcode-it-fails-whats-happen/50219478#50219478). 

# How to use

Download the repository manually or run:

```
$ git clone https://github.com/joliejuly/Speller.git
```
Compiles in XCode 9 or newer. 
