# Read in date 
import sys
import os
import requests
import ForelistCounter
import socket
import string
import re

from bs4 import BeautifulSoup
from lxml import html
  
def ScrapeForeHtml():
	
	URLforeclosure = 'http://http://www.russlawgroup.net/contact'
	
	# Read data from URLforeclosure
	r = requests.get(URLforeclosure)
	
	soup = BeautifulSoup(r.text,'lxml')

	print soup
	
ScrapeForeHtml()	

	<table cellpadding="15" cellspacing="0" align="center" style="border:solid 1px #b9cee6">
		<tr>
			<td style="background-color:White">
				<table cellpadding="0" cellspacing="0" width="970px" align="center">
					<tr>
						<td valign="top" rowspan="2">
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td>
										<table style="width: 730px; background: #2d4a6c url('Images/header.jpg')" cellpadding="0"
											cellspacing="0">
											<tr>
												<td colspan="4" style="height: 200px">
													&nbsp;
												</td>
											</tr>
											<tr>
												<td width="150" align="center" valign="bottom" style="padding-left: 5px; padding-bottom: 10px;
													height: 96px;" onclick="w=popWindow('mortgage_quotes.aspx', '_blank', 640, 460, 1, 0 ); return false;">
													<a href="#">
														<img src="Images/btn_mtg.png" border="0" style="cursor: pointer;" /></a>
												</td>
												<td width="150" align="center" valign="bottom" style="padding-bottom: 10px;" onclick="var w=popWindow('score_a4.aspx', '_blank', 990, 740, 1, 0 ); return false;">
													<a href="#">
														<img src="Images/btn_report.png" border="0" /></a>
												</td>
												<td width="150" align="center" valign="bottom" style="padding-bottom: 10px;" onclick="popWindow('mortgage_quotes.aspx?n=1.F&started=1&lm=avdfor&welcome=0', '_blank', 640, 460, 1, 0 ); return false;">
													<a href="#">
														<img src="Images/btn_foreclosure.png" border="0" style="cursor: pointer;" /></a>
												</td>
												<td>
													&nbsp;
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td style="padding-top: 20px">
	
