# Read in date 
import sys
import os
import requests
import socket
import string
import json

from bs4 import BeautifulSoup
from lxml import html
     
def ScrapeBKCourt(zipcode):
	
	District = ''
	
	buildURL = 'http://www.uscourts.gov/court-locator/zip/' + str(zipcode) + '/court/bankruptcy'
	# URL = 'http://www.uscourts.gov/court-locator/zip/39501/court/bankruptcy'
	
	# Read data from URL
	r = requests.get(buildURL)
	
	soup = BeautifulSoup(r.text,'lxml')	
	
	results = soup.findAll('p',{'class':'grouped-court'})
	if not results:
		return "Not found"
	
	for each_p in soup.findAll('p',{'class':'grouped-court'}):
		list = str(each_p)
		list = list.split(">")
		line = list[2].split("Court")
		line = line[0].strip()
		DistrictCourt = line.split(" ")	
		# print DistrictCourt
		if ("Middle" in line) or ("Southern" in line) or ("Eastern" in line)or ("Western" in line) or ("Northern" in line):
			if len(DistrictCourt) > 3:
				state = DistrictCourt[0] + " " + DistrictCourt[1]
				area = DistrictCourt[2]
			else:
				state = DistrictCourt[0]
				area = DistrictCourt[1]
			District = area + " District of " + state
			break;
			
		state = DistrictCourt[0] + " " + DistrictCourt[1]
		District = "District of " + state
		break		
		
	return District
	
def main(argv):

	if len(sys.argv) != 2:
		print("\nError! You do not have enough arguments")
		exit()
	
	Zipcode = sys.argv[1]
	DistrictCourt = ScrapeBKCourt(Zipcode)
	print DistrictCourt
		
# Initiate main program	
if __name__ == "__main__":
	main(sys.argv);
