# Read in date 
import sys
import os
import requests
import socket
import string

from bs4 import BeautifulSoup
from lxml import html
 
def Scrape():
	
	buildURL = 'https://jqueryvalidation.org/files/demo/site-demos.css'
	
	# Read data from URL
	r = requests.get(buildURL)
	
	District = ""
	soup = BeautifulSoup(r.text,'lxml')

	for each_p in soup.findAll('class':'left'):
		list = str(each_p)	
		
	District = list
	
	return District
	
def main(argv):

	DistrictCourt = Scrape()
	print DistrictCourt