import urllib.request
import requests
import re
from bs4 import BeautifulSoup


class AppURLopener(urllib.request.FancyURLopener):
    version = "Mozilla/5.0"


def URLParse(input, number=50):
    # https://www.google.com/search?q=samsung&sxsrf=ALeKk00WVuUUqMfcY_kHyrC6wC06J1829A:1608848470079&source=lnms&tbm=nws&sa=X&ved=2ahUKEwiKobnM0-ftAhWktVkKHWsXCRgQ_AUoAXoECAsQAw&biw=1854&bih=927
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
