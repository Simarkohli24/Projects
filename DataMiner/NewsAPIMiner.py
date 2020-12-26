import pprint
import requests

secret = "825aac9fd4074ff1aa69772a129c80e9"
url = "https://newsapi.org/v2/everything?"


def miner(input):
    parameters = {
        'q': "+apple",  # query phrase
        'qInTitle': "+apple",  # make sure we're talking about the actual thing
        'language': 'en',  # country of origin
        'pageSize': 20,  # maximum is 100
        'from': "2020-12-24",
        'sortBy': "relevancy",
        'apiKey': secret  # your own API key
    }
    response = requests.get(url, params=parameters)
    response_json = response.json()
    return response_json
