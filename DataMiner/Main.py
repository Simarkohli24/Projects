import NewsAPIMiner
import DataMine
import Smart
import re
from bs4 import BeautifulSoup

company = "covid"

# Grabbing HTML and relevant information
html = DataMine.URLParse(company, 20)
text = DataMine.Soupify(html)

# Processing Headlines
text = text.replace("...", " · ")
title_headlines = text.split("· ")

# Sentiment analysis and Top Words generation
word_map = Smart.word_chart(title_headlines)
word_map.remove(company)
word_map.remove("mins")
x = Smart.analyzer(title_headlines)
y = Smart.vcompare(x)

print("Sentiment Analysis")
print(y)
print("Top Words")
print("1. " + word_map[0])
print("2. " + word_map[1])
print("3. " + word_map[2])
print("4. " + word_map[3])
print("5. " + word_map[4])
print("6. " + word_map[5])
print("7. " + word_map[6])
