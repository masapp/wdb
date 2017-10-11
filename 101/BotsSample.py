#-*- coding: utf-8 -*-
#!/usr/bin/python

import urllib
import urllib2

def send_slack():
    reqdata = {}
    reqdata['token'] = {*API Token*}
    reqdata['channel'] = {*投稿したいチャンネルID*}
    reqdata['text'] = {*投稿したい内容*}

    params = urllib.urlencode(reqdata)

    req = urllib2.Request("https://slack.com/api/chat.postMessage")
    req.add_data(params)

    res = urllib2.urlopen(req)
    print res

if __name__ == '__main__':
    send_slack()
