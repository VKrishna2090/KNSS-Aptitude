import requests
from bs4 import BeautifulSoup

def scrape(url):
    q=""
    r = requests.get(url)
    soup = BeautifulSoup(r.content)
    g_data = soup.find_all("div",{"class":"entry-content"})
    for i in g_data:
        q = q + "\n" + (i.text)
    return q

def initiate_scraping(url):
    file1 = open(r"Scraped_Text.txt","w+")
    file1.write(scrape(url))
