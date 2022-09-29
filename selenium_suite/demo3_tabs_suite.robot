*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.db4free.net/
    Click Element    partial link=phpMy
    Switch Window    phpMyAdmin
    Input Text    id=input_username    admin
    Input Text    id=input_password    admin123
    Click Element    xpath=//input[@type='submit']
    Element Should Contain    id=pma_errors    Access denied for user
    [Teardown]    Close Browser    

TC2
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.online.citibank.co.in/
    Click Element    link=APPLY FOR CREDIT CARDS
    Switch Window    Apply for a Credit Card | Online Credit Card Application | Citi India
    Click Element    link=Travel
    Scroll Element Into View    id=Email_Id 
    Input Text    id=Email_Id    test@gmail.com


# NEW And MAIN - can be used when dealing with two tabs/windows
TC3
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.online.citibank.co.in/
    Click Element    link=APPLY FOR CREDIT CARDS
    Switch Window    NEW
    Click Element    link=Travel
    Input Text    id=Email_Id    test@gmail.com
    Switch Window    MAIN
