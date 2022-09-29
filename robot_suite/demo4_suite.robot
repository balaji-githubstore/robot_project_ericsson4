*** Keywords ***
Print My Detail
    Log To Console    Balaji
    Log To Console    Welcome to the session
    Log To Console    Let's start
    
Get Area Of Circle
    [Arguments]    ${radius}    
    ${res}    Evaluate    3.14*${radius}*${radius}
    [Return]  ${res}  

#CREATE KEYWORD FOR AREA OF TRIANGLE 
Get Area Of Triangle
    [Arguments]    ${base}    ${height}
    ${result}    Evaluate    (${base}*${height})/2
    Return From Keyword    ${result}

*** Test Cases ***
TC1
   Print My Detail

TC2
   ${output}     Get Area Of Circle    20
   Log To Console    ${output} 

   ${output}     Get Area Of Circle    30
   Log To Console    ${output} 
   
   ${output}     Get Area Of Triangle    25    1
   Log To Console    ${output} 
   
