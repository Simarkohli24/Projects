import NewsAPIMiner
import DataMine
import Smart
import re
from bs4 import BeautifulSoup

company = "samsung"

# Grabbing HTML and relevant information
html = DataMine.URLParse(company, 20)
text = DataMine.Soupify(html)

# Processing Headlines
text = text.replace("...", " · ")
title_headlines = text.split("·")
new_title_headlines = Smart.preprocess(title_headlines)

for x in title_headlines:
    print(x)
print("------vs-------")
for x in new_title_headlines:
    print(x)


# Sentiment analysis and Top Words generation
word_map = Smart.word_chart(new_title_headlines)
word_map.remove(company)
x = Smart.analyzer(new_title_headlines)
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
