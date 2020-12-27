import nltk
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import WordNetLemmatizer
from nltk import pos_tag
import os
import re
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
# NLTK VADER for sentiment analysis


def preprocess(input):
    output_list = []
    for headline in input:
        split_l_headline = headline.split(" ")
        print(split_l_headline)
        new_headline = []
        for word in split_l_headline:
            if (word != ''):
                modification_flag = False
                new_word = word.replace(' ', '')
                new_word = new_word.replace('"', '')
                issue_index = 0
                for i in range(len(new_word)):
                    if (new_word[0].isalpha() and modification_flag == False):
                        if ((new_word[i].isdigit() or new_word[i].isupper()) and i != 0 and i != 1):
                            modification_flag = True
                            issue_index = i
                if (modification_flag):
                    modified_string = new_word[0:issue_index] + \
                        " " + new_word[issue_index:]
                else:
                    modified_string = new_word
                new_headline.append(modified_string)
        if (len(new_headline[:-3]) > 4):
            output_list.append(" ".join(new_headline[:-3]))
    return output_list


def final_cleaning(input):
    output_list = []
    for headline in input:
        if (len(headline) >= 10):
            new_headline = re.sub(r'\b(\w+)( \1\b)+', r'\1', headline)
            output_list.append(new_headline)


def vcompare(input):
    output = input['pos'] > input['neg']
    output.name = 'Outputs'
    parse_score = input.join(output, rsuffix='_right')
    return parse_score


def analyzer(input):
    vader = SentimentIntensityAnalyzer()
    columns = ['headline']
    parse_score = pd.DataFrame(input, columns=columns)
    scores = parse_score['headline'].apply(vader.polarity_scores).tolist()
    scores_df = pd.DataFrame(scores)
    parse_score = parse_score.join(scores_df, rsuffix='_right')
    return parse_score


def word_chart(input):
    lemmatizer = WordNetLemmatizer()
    word_map = {}
    stop_words = set(stopwords.words('english'))
    stop_words.add("hours")
    stop_words.add("ago")
    for headline in input:
        headline = headline.lower()
        word_tokens = word_tokenize(headline)
        filtered_sentence = [w for w in word_tokens if not w in stop_words]
        tag_tokens = pos_tag(filtered_sentence)
        for word, tag in tag_tokens:
            if ("’s" in word):
                cur_word = word[:-2]
            else:
                cur_word = word
            if (len(cur_word) > 2):
                tag1 = tag[0].lower()
                tag1 = tag1 if tag1 in ['a', 'r', 'n', 'v'] else None
                if not tag1:
                    lem_word = cur_word
                else:
                    lem_word = lemmatizer.lemmatize(cur_word, tag1)
                if (not lem_word in word_map):
                    word_map[lem_word] = 1
                else:
                    word_map[lem_word] = word_map.get(lem_word) + 1

    return sorted(word_map, key=word_map.get, reverse=True)
