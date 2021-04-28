"ESP 001 = 192.168.8.24"

import urllib.request
root_url = "http://192.168.8.24"  # ESP's url, ex: https://192.168.102 (Esp serial prints it when connected to wifi)

def sendRequest(url):
	n = urllib.request.urlopen(url) # send request to ESP

sendRequest(root_url+"/control?cmd=GPIO,0,1")
sendRequest(root_url+"/control?cmd=GPIO,0,0")

sendRequest(root_url+"/control?cmd=GPIO,2,1")
sendRequest(root_url+"/control?cmd=GPIO,2,0")


# long pulse- to open lock for a small time
sendRequest(root_url+"/control?cmd=LongPulse_mS,0,1,5000")
sendRequest(root_url+"/control?cmd=LongPulse,0,1,5")
