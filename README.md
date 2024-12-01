# WeatherApp
WeatherApp CGX technical assessment.

from Mark at CGX and the technical assessment 

The goal is to create a weather app which will show the user the current weather at a location. The app will have a search box for the user to enter an address, it will then search the Current Weather (not a forecast) for that location and display the results for the user.

It should display at least:

Temperature
Apparent Temperature
Wind including gusts and direction
Rain
Cloud cover
Temperature should be displayed in Celsius and speeds in mph.

All information on how to get the information for the Current Weather is shown in the documentation at https://open-meteo.com/en/docs as well the parameters required to be sent. This is returned in a JSON format and is free with no API Key required.

The api requires a Lat and Long so use https://geocode.maps.co/search?q={location} to firstly get the latitude and longitude for the location to send onto the open-meteo api. You will need an API Key to use this API.

The UI design isn’t really what we’re looking at in this test but please do present it in a user friendly interface to show your attention to detail. But keep in mind the main focus of this test is the code layout, testability, maintainability and patterns chosen.

>
![Simulator Screenshot - iPhone 16 Pro - 2024-12-01 at 11 32 39](https://github.com/user-attachments/assets/f0d3bda8-8c38-42ff-ae8a-2315493be8fc)
>
>
![Simulator Screenshot - iPhone 16 Pro - 2024-12-01 at 11 32 48](https://github.com/user-attachments/assets/ba9fb2bc-138e-4a7d-9b7e-4a27b38c4129)
>
>
![Simulator Screenshot - iPhone 16 Pro - 2024-12-01 at 11 33 05](https://github.com/user-attachments/assets/bf402c87-d481-479d-b4b9-4373b3a6d8df)
>
>
><img width="728" alt="Screenshot 2024-11-30 at 23 03 00" src="https://github.com/user-attachments/assets/21c6ed48-3089-4257-9498-0fb83d33194f">






