import datetime
import random
import requests

direction = random.choice(['left', 'right'])

requests.post('http://localhost:3000/observations', data={'value':direction, 'start':datetime.datetime.now().isoformat(), 'end':datetime.datetime.now().isoformat()})
