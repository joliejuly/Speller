//
//  dict.m
//  Speller
//
//  Created by Julia Nikitina on 07.05.2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include "dictionary.h"
#define DICTIONARY "large.txt"

int words_total = 0;
node *root = NULL;

bool load (const char* dictionary)
{
    root = calloc(1, sizeof(node));
    if (root == NULL)
        return 1;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"large" ofType:@"txt"];
    FILE *dic = fopen([filePath cStringUsingEncoding: NSUTF8StringEncoding], "r");
    char temp[LENGTH + 1];
    node *trav = root;
    node *temp_node = NULL;
    
    while(fscanf(dic, "%s", temp) != EOF)
    {
        int i = 0;
        while (temp[i] != '\0')
        {
            //hash every letter in a word
            unsigned int h = hash(temp[i]);
            if (i == 0)
            {
                if (trav->children[h] == NULL)
                {
                    node *new_node = calloc(1, sizeof(node));
                    if (new_node == NULL)
                        return false;
                    trav->children[h] = new_node;
                    temp_node = new_node;
                    if (temp[i + 1] == '\0')
                    {
                        temp_node->is_word = true;
                        words_total++;
                    }
                }
                else
                {
                    temp_node = trav->children[h];
                    if (temp[i + 1] == '\0')
                    {
                        temp_node->is_word = true;
                        words_total++;
                    }
                }
            }
            else if (i > 0)
            {
                if (temp_node->children[h] == NULL)
                {
                    node *new_node = calloc(1, sizeof(node));
                    if (new_node == NULL)
                        return false;
                    temp_node->children[h] = new_node;
                    temp_node = new_node;
                    if (temp[i + 1] == '\0')
                    {
                        temp_node->is_word = true;
                        words_total++;
                    }
                }
                else
                {
                    temp_node = temp_node->children[h];
                    if (temp[i + 1] == '\0')
                    {
                        temp_node->is_word = true;
                        words_total++;
                    }
                }
            }
            i++;
        }
    }
    fclose(dic);
    filePath = NULL;
    free((__bridge void *)(filePath));
    return true;
}

unsigned int hash (char c)
{
    if (c == '\'')
        return 26;
    return (toupper(c) - 'A') % 26;
}

bool check (const char *word)
{
    bool loaded = load(DICTIONARY);
    if (loaded) {
        printf("Loaded!");
    } else {
        printf("Error while load!");
    }
    //hash every letter in a word
    int i = 0;
    node *trav1 = root;
    node *temp1 = NULL;
    
    while (word[i] != '\0')
    {
        unsigned int h = hash(word[i]);
        
        if (i == 0)
        {
            if (trav1->children[h] == NULL)
            {
                return false;
            }
            else if (trav1->children[h] != NULL)
            {
                temp1 = trav1->children[h];
                
                if (word[i + 1] == '\0' && temp1->is_word == true) {
                    
                    return true;
                }
                else if (word[i + 1] == '\0' && temp1->is_word != true) {
                    
                    return false;
                }
                
            }
        }
        else if (i > 0 && temp1 != NULL)
        {
            if(temp1->children[h] == NULL) {
                return false;
            }
            else
            {
                temp1 = temp1->children[h];
                if (word[i + 1] == '\0' && temp1->is_word == true) {
                    return true;
                }
                else if (word[i + 1] == '\0' && temp1->is_word != true) {
                    return false;
                }
            }
        }
        
        i++;
    }
    unload();
    return false;
}

bool unload(void)
{
    node *utrav = root;
    if (free_trie(utrav) == true)
    {
        free(root);
        return true;
    }
    return false;
}

bool free_trie(node *trav)
{
    for (int i = 0; i < SIZE; i++)
    {
        if (trav->children[i] != NULL)
        {
            free_trie(trav->children[i]);
            free(trav->children[i]);
        }
    }
    return true;
}

unsigned int size(void)
{
    return words_total;
}
