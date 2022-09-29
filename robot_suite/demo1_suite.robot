*** Settings ***
Library    DateTime


*** Test Cases ***
TC1
    Log To Console    Balaji Dinakaran
    Log To Console    Welcome to the session
    Log To Console    Hello    

TC2
    ${my_name}    Set Variable    Bala
    Log To Console    ${my_name}
    Log    ${my_name}

TC3
   ${radius}    Set Variable    10
   
   ${result}    Evaluate    3.14*${radius}*${radius} 
   Log     ${result} 

   ${expected_result}    Convert To Number   314

   #number comparison 
   Should Be Equal    ${result}    ${expected_result}

   
TC4
    ${current_date}    Get Current Date
    Log To Console    ${current_date}

TC5
    ${browser}    Set Variable    edge
    IF    '${browser}'=='ch'
        Log To Console    launch chrome
    ELSE IF    '${browser}'=='edge'
        Log To Console    launch Edge
    ELSE
        Log To Console    launch ff
    END

TC6
    FOR    ${i}    IN RANGE    1    11   
        Log To Console    ${i}
    END