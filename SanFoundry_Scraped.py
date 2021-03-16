import requests
from bs4 import BeautifulSoup

def scrape():
    url = "https://www.sanfoundry.com/java-mcqs-integer-floating-data-types/"
    #url = input("Enter a URL:")
    q=""
    r = requests.get(url)
    soup = BeautifulSoup(r.content)
    g_data = soup.find_all("div",{"class":"entry-content"})
    for i in g_data:
        q = q + "\n" + (i.text)
    #print(url)
    return q
file1 = open(r"C:\Users\zenon\Documents\Python\Python networking\Scraped_Text.txt","w+")
file1.write(scrape())
print ("Done Scraping..")
