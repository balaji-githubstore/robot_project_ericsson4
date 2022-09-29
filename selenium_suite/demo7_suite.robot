*** Settings ***
Library    SeleniumLibrary
Library    AutoItLibrary

*** Test Cases ***
TC1
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    # http://Username:Password@SiteURL
    Go To    url=https://bala:welcome123@softwaretesting.com/
    Sleep    2s
   
TC2
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://softwaretesting.com/
    Sleep    2s  
    # Send    {SHIFTDOWN}+hello
    Send    HELLO
    Send    {TAB}
    Send    welcome123
    Send    {ENTER}
   

TC3
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    Click Element    xpath=//span[text()='Select PDF file']
    Sleep    3s
    Control Focus    Open    ${EMPTY}    Edit1
    Control Set Text    Open    ${EMPTY}    Edit1    D:${/}Mine${/}Balaji-Profile_2022.pdf
    Control Click    Open    ${EMPTY}    Button1

   