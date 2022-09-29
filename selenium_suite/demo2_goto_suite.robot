*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Click Until Element Pass
    [Arguments]    ${locator}
     FOR    ${i}    IN RANGE    1    100    
        
        @{output}    Run Keyword And Ignore Error    Click Element    ${locator}
        Log To Console    ${output}   

        IF    '${output}[0]' == 'PASS'
            Exit For Loop
        END 
    END


*** Test Cases ***
TC1
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.goto.com/meeting/
    # Run Keywords    Log To Console    bala    AND     Log To Console    bala 
    
    @{output}    Run Keyword And Ignore Error    Click Element    xpath=//king
    Log To Console    ${output}   

    IF    '${output}[0]' == 'FAIL'
        Log To Console    Element not available
    END 

    Run Keyword And Ignore Error    Click Element    id=truste-consent-button
    Click Element    link=Try Free
    Input Text    id=first-name    Balaji
    Input Text    id=last-name    Dina
    Input Text    id=login__email    bala@cccs.com
    Select From List By Label    id=CompanySize    10 - 99
    Click Element    xpath=//button[text()='Start My Trial']

    Sleep    3s
    [Teardown]    Close Browser


TC2
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.goto.com/meeting/
    # Run Keywords    Log To Console    bala    AND     Log To Console    bala 
    
    #run until click on pass
    FOR    ${i}    IN RANGE    1    100    
        
        @{output}    Run Keyword And Ignore Error    Click Element    xpath=//king
        Log To Console    ${output}   

        IF    '${output}[0]' == 'PASS'
            Exit For Loop
        END 
    END


    