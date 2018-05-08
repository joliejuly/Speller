# Speller
iOS app that checks if a word exist in the English language in O(1) time. 

![Speller](https://media.giphy.com/media/TgMDHBm76Q9DhENP0y/giphy.gif)

## Powered by C underneath the hood

The app is based on [trie](https://en.wikipedia.org/wiki/Trie) data structure implemented in C. 

It loads a thesaurus of the English language (143,091 words) and checks if it contains a given word in about... 0,04 second!

I find it so quick and powerful that I decided to share it with the community. It can be used for any kind of dictionary search. 

## No storyboard - only code

The UI is implemented in code (Swift 4), so no merge conflicts will be provided in the future. 

## Mix and match 

You'll find an Objective-C file in the project (dict.m). It turned out I needed Foundation to provide access to my dictionary .txt file in the application bundle. The whole story is documented on the [Stack Overflow](https://stackoverflow.com/questions/25877635/my-c-program-reads-a-text-file-when-i-put-it-into-xcode-it-fails-whats-happen/50219478#50219478). 

# How to use

Download the repository manually or run:

```
$ git clone https://github.com/joliejuly/Speller.git
```
You will need XCode 9 or newer. 

## Enjoy!
