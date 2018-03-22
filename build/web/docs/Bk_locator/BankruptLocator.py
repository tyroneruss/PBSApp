# Read in date 
import sys
import os
import requests
import socket
import string

from bs4 import BeautifulSoup
from lxml import html
 
def ScrapeBKCourt(zipcode):
	
	buildURL = 'http://www.uscourts.gov/court-locator/zip/' + str(zipcode) + '/court/bankruptcy'
	
	# Read data from URL
	r = requests.get(buildURL)
	
	District = ""
	soup = BeautifulSoup(r.text,'lxml')
	
	for each_p in soup.findAll('p',{'class':'grouped-court'}):
		list = str(each_p)
		list = list.split(">")
		line = list[2].split("Court")
		line = line[0].strip()
		DistrictCourt = line.split(" ")
		print DistrictCourt
		if len(DistrictCourt) == 4:
			state = DistrictCourt[0] + " " + DistrictCourt[1]
		else:
			state = DistrictCourt[0]
			
		area = DistrictCourt[1]
		DistrictTest = DistrictCourt[1] + " District of " + state
		break	
			
	return District
	
def main(argv):

	if len(sys.argv) != 2:
		print("\nError! You do not have enough arguments")
		exit()
	
	Zipcode = sys.argv[1]
	DistrictCourt = ScrapeBKCourt(Zipcode)
	print DistrictCourt