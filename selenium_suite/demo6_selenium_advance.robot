*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://nasscom.in/
    Mouse Over    xpath=//a[text()='Membership']
    Click Element    xpath=//a[text()='Members Listing']


TC2
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://nasscom.in/

    Mouse Over    xpath=//a[text()='Membership']
    #Mouse Over on Become a Member
    Mouse Over    xpath=//a[text()='Become a member']
    Click Element    xpath=//a[text()='Membership Benefits']
    
TC3
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    
    ${html}    Get Source
    Log    ${html}

    ${text}    Get Text    xpath=//h1
    Log    ${text}

    Element Text Should Be    xpath=//h1    PDF to WORD Converter


    
TC4
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.ilovepdf.com/pdf_to_word

    Choose File    xpath=//input[@type='file']    D:${/}Mine${/}Balaji-Profile_2022.pdf
    #  Choose File    css=input[type='file']    D:${/}Mine${/}Balaji-Profile_2022.pdf

TC5
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.facebook.com
    Input Text    css=#email    bala123456@gmail.com
    Input Password    css=#pass       welcome123
    Click Element    css=button[name='login']
    
TC6
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.citibank.co.in/ssjsps/forgetuseridmidssi.jsp
    Click Element    link=select your product type
    Click Element    link=Credit Card
    # Input Text    id=bill-date-long    17/09/2022
    Execute Javascript    document.querySelector('#bill-date-long').value='30/09/2022'
    Select Checkbox    name=agree
    

#alernate option to run using javascript 
TC7
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.citibank.co.in/ssjsps/forgetuseridmidssi.jsp
    Click Element    link=select your product type
    Click Element    link=Credit Card
    
    ${element}    Get WebElement    xpath=//input[@id='bill-date-long']

    Execute Javascript    arguments[0].value='30/09/2022'    ARGUMENTS    ${element}
 

#click on hidden element
 TC8
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://nasscom.in/

    ${ele}    Get WebElement    xpath=//a[text()='Members Listing']
    Execute Javascript    arguments[0].click()    ARGUMENTS    ${ele}
   
    # Execute Javascript    document.querySelector('#bill-date-long').value='30/09/2022';document.querySelector('#cvvnumber').value='322';
   
#     ${ele1}    Get WebElement    xpath=//a[text()='Members Listing']
#     ${ele2}    Get WebElement    xpath=//a[text()='Members Listing']

#    Execute Javascript    arguments[0].click();arguments[1].click()    ARGUMENTS    ${ele1}     ${ele2}    



 TC9
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Set Selenium Speed    1s
    Go To    url=https://google.com/
    Press Keys    None    hello
    Press Keys    None    ARROW_DOWN 
    Press Keys    None    ARROW_DOWN     
    Press Keys    None    ENTER  

 TC10
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Set Selenium Speed    1s
    Go To    url=https://phptravels.net/
    Input Text    id=autocomplete    dal
    Press Keys    None    ARROW_DOWN 
    Press Keys    None    ENTER  


TC8
    Open Browser    browser=chrome     alias=b1    executable_path=D:${/}Software${/}chromedriver.exe
    Go To    url=http://google.com

    Open Browser    browser=chrome    alias=b2     executable_path=D:${/}Software${/}chromedriver.exe
    Go To    url=http://facebook.com

    
    Switch Browser    b1
    
    Log Title

    Close Browser

    Close All Browsers

