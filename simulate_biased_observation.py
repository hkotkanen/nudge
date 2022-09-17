import datetime
import numpy as np
import requests
import sys

def observe_and_transmit(value='left'):
    distribution = [0.8, 0.2] if value=='left' else [0.2, 0.8]
    direction = np.random.choice(['left', 'right'], p=distribution)
    postdata = {
            'value':direction,
            'start':datetime.datetime.now().isoformat(),
            'end':datetime.datetime.now().isoformat()
            }

    requests.post('http://localhost:3000/observations', data=postdata)

if __name__=='__main__':
    if len(sys.argv)==2 and sys.argv[1] in ['left', 'right']:
        observe_and_transmit(sys.argv[1])
    elif len(sys.argv)==1:
        observe_and_transmit()
    else:
        print('python {} [left or right]\n\nWithout params, defaults to left.'.format(sys.argv[0]))
