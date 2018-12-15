/**
 * Declares a dictionary's functionality.
 */

#ifndef DICTIONARY_H
#define DICTIONARY_H

#include <stdbool.h>

// maximum length for a word
// (e.g., pneumonoultramicroscopicsilicovolcanoconiosis)

#define SIZE 27//size of root array
#define LENGTH 45//max size of word

//structure for a node
typedef struct node
{
    bool is_word; 
    struct node *children[SIZE]; 
}node;

bool check(const char *word);
bool load(const char *dictionary);

unsigned int hash (char c);
unsigned int size(void);

bool free_trie (node *trav);
bool unload(void);

#endif // DICTIONARY_H
