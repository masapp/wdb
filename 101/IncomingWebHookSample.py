#-*- coding: utf-8 -*-
#!/usr/bin/python

import json
import requests

def send_slack():
    reqdata = {}
    reqdata['text'] = {*投稿したい内容*}
    content = json.dumps(reqdata, ensure_ascii=False)

    url = {*Webhook URL*}
    res = requests.post(url, data=content)

    print res.text

if __name__ == '__main__':
    send_slack()
