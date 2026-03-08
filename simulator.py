import requests
import random
import time

while True:
    voltage = round(random.uniform(210, 230), 2)
    current = round(random.uniform(5, 15), 2)
    power = round(voltage * current, 2)

    data = {
        "voltage": voltage,
        "current": current,
        "power": power
    }

    requests.post("http://127.0.0.1:5000/data", json=data)
    print("Sent:", data)

    time.sleep(1)
