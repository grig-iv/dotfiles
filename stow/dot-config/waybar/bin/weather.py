import urllib.request
import json

weather_icons = {
    0: "☀️", 1: "🌤️", 2: "⛅", 3: "☁️",
    45: "🌫️", 48: "🌫️",
    51: "🌧️", 53: "🌧️", 55: "🌧️",
    56: "🌨️", 57: "🌨️",
    61: "🌧️", 63: "🌧️", 65: "🌧️",
    66: "🌨️", 67: "🌨️",
    71: "🌨️", 73: "🌨️", 75: "❄️",
    77: "🌨️",
    80: "🌦️", 81: "🌧️", 82: "🌧️",
    85: "🌨️", 86: "❄️",
    95: "⛈️", 96: "⛈️", 99: "⛈️"
}

def weather(lat, lon):
    url = "https://api.open-meteo.com/v1/forecast?current=temperature_2m,weather_code&latitude=" + lat + "&longitude=" + lon
    with urllib.request.urlopen(url) as r:
        resp = json.loads(r.read().decode())
        icon = weather_icons[resp["current"]["weather_code"]]
        temp = resp["current"]["temperature_2m"]
        print(icon + " " + str(temp) + "°C")

weather("59.961472", "30.291766")
