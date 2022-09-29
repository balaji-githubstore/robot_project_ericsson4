*** Settings ***
Library    SeleniumLibrary
Library    DatabaseLibrary


*** Test Cases ***
TC1
    Open Browser    url=https://www.facebook.com/    browser=chrome     executable_path=D:${/}Software${/}chromedriver.exe
    Input Text    id=email    bala123456@gmail.com
    Input Password    id=pass       welcome123
    Click Element    name=login

TC2
    Open Browser    url=https://www.facebook.com/    browser=chrome     executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Click Element    link=Create New Account
    Input Text    name=firstname    Balaji
    Input Text    name:lastname    Dinakaran
    Input Password    id=password_step_input    welcome123
    #20 Feb 2000
    Select From List By Label    id=day    20
    Select From List By Label    id=month    Feb

    # Select From List By Value    id=month    2
    # Select From List By Index    id=month     1

    #select year as 2000
    Select From List By Label    id=year    2000
    Click Element    xpath=//input[@value='-1']
    #select They: "Wish them a happy birthday!"
    #click on sign up
    # Select Radio Button    sex    -1
    
    # Row Count Is Equal To X    select * from tbl_register where firstname='Balaji' and lastname='Dinakaran'    1
    
    

    
    


