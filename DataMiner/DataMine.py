import urllib.request
import requests
import re
from bs4 import BeautifulSoup


class AppURLopener(urllib.request.FancyURLopener):
    version = "Mozilla/5.0"


def URLParse(input, number=50):
    # https://www.google.com/search?q=samsung&sxsrf=ALeKk00WVuUUqMfcY_kHyrC6wC06J1829A:1608848470079&source=lnms&tbm=nws&sa=X&ved=2ahUKEwiKobnM0-ftAhWktVkKHWsXCRgQ_AUoAXoECAsQAw&biw=1854&bih=927
    # https://www.google.com/search?q=apple&rlz=1C5CHFA_enUS728US728&biw=1854&bih=927&sxsrf=ALeKk021K1FuoE6nFKbZ4_zBhV2v7bHSKQ%3A1608955794603&source=lnt&tbs=cdr%3A1%2Ccd_min%3A12%2F22%2F2020%2Ccd_max%3A12%2F22%2F2020&tbm=nws
    # https://www.google.com/search?q=apple&rlz=1C5CHFA_enUS728US728&tbm=nws&sxsrf=ALeKk03hdxkqlRL8FGnW0CZWfoCt-jHQUw:1608955970403&tbas=0&source=lnt&sa=X&ved=0ahUKEwjqvcyI5OrtAhWlo1kKHWI5CJ0QpwUIJw&biw=1854&bih=927&dpr=1.33
    beginning = "https://www.google.com/search?q="
    ending = "&sxsrf=ALeKk00WVuUUqMfcY_kHyrC6wC06J1829A:1608848470079&source=lnms&tbm=nws&sa=X&ved=2ahUKEwiKobnM0-ftAhWktVkKHWsXCRgQ_AUoAXoECAsQAw&biw=1854&bih=927"
    complete_url = beginning + input + ending + "&num=" + str(number)
    opener = AppURLopener()
    page = opener.open(complete_url)
    html = (page.read()).decode("utf-8")
    return html


def Soupify(input):
    soup = BeautifulSoup(input, "html.parser")
    text = soup.get_text()
    pattern = "center}.*?next >"
    match_results = re.search(pattern, text, re.I)
    real_text = match_results.group()
    filtered_text = re.sub("center}", "", re.sub("Next >", "", real_text))
    return filtered_text
