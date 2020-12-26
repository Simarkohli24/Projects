import nltk
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
# NLTK VADER for sentiment analysis


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
    word_map = {}
    stop_words = set(stopwords.words('english'))
    stop_words.add("hours")
    stop_words.add("ago")
    for headline in input:
        headline = headline.lower()
        word_tokens = word_tokenize(headline)
        filtered_sentence = [w for w in word_tokens if not w in stop_words]
        for word in filtered_sentence:
            if (len(word) > 2):
                if (not word in word_map):
                    word_map[word] = 1
                else:
                    word_map[word] = word_map.get(word) + 1

    return sorted(word_map, key=word_map.get, reverse=True)
