import requests
from bs4 import BeautifulSoup

def scrape(url):
    # url = "https://www.sanfoundry.com/java-mcqs-integer-floating-data-types/"
    
    q=""
    r = requests.get(url)
    soup = BeautifulSoup(r.content)
    g_data = soup.find_all("div",{"class":"entry-content"})
    for i in g_data:
        q = q + "\n" + (i.text)
    
    return q

url = input("Enter a URL:")
file1 = open(r"Scraped_Text.txt","w+")
file1.truncate(0)
file1.write(scrape(url))
print ("Done Scraping..")
