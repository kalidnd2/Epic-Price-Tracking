from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys
import time 


url = 'https://www.epicgames.com/store/en-US/browse?sortBy=title&sortDir=ASC&count=40&start=0'

driver = webdriver.Firefox(executable_path='D:/EpicGames Price Tracker/Drivers/geckodriver.exe')

driver.get(url)
games_list = []
while(True):
    element = WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.CLASS_NAME, "css-zgal9t-DiscoverCardLayout__component"))
    )
    
    body = driver.find_element_by_tag_name('body') 
    for i in range(7):
        body.send_keys(Keys.PAGE_DOWN)
        time.sleep(0.5)

    games = driver.find_elements_by_class_name('css-zgal9t-DiscoverCardLayout__component')
    next_paginate = None
    
    for game in games:
        title = game.find_element_by_xpath('.//*[@data-testid="offer-title-info-title"]').text
        subtitle = game.find_element_by_xpath('.//*[@data-testid="offer-title-info-subtitle"]').text
        pricing = game.find_element_by_xpath('.//*[@class="css-nxq7ez-PriceLayout__rowItem" or @class="css-1mc6sjq"]').text

        thumbnail = game.find_element_by_xpath('.//*[@data-testid="offer-card-image-portrait"]')
        thumbnail = WebDriverWait(thumbnail, 10).until(EC.presence_of_element_located((By.TAG_NAME, "img"))) #waits until the thumbnail is loaded in the browser
        thumbnail = thumbnail.get_attribute('src')

        game_obj = {
            'title': title,
            'subtitle': subtitle,
            'pricing': pricing,
            'thumbnail': thumbnail
        }

        print(thumbnail)

        games_list.append(game_obj)

    next_paginate = driver.find_elements_by_class_name('css-1j31wz6-Icon__wrapper-PaginationItem__next')  
    
    try:
        if next_paginate:
            next_paginate[0].click()
            time.sleep(5)
        else:
            print(games_list)
            break
    except:
        print(games_list)
        break

    


    


