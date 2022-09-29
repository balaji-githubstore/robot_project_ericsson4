*** Settings ***
Library    SeleniumLibrary
Library      AutoRecorder

*** Test Cases ***
TC1
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    
    Set Selenium Implicit Wait    10s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/IpinResetUsingOTP.htm

    Click Element    xpath=//img[@alt='Go']

    ${alert_text}    Handle Alert    action=ACCEPT    timeout=40s
    Log To Console    ${alert_text}
    Should Be Equal    ${alert_text}    Customer ID${SPACE}${SPACE}cannot be left blank.

    # Log To Console    Balaji${SPACE}${SPACE}Dinakaran
    
    