*** Keywords ***
Print My Detail
    Log To Console    Balaji
    Log To Console    Welcome to the session
    Log To Console    Let's start
    
Get Area Of Circle
    [Arguments]    ${radius}
    ${res}    Evaluate    3.14*${radius}*${radius}
    [Return]  ${res}  

    