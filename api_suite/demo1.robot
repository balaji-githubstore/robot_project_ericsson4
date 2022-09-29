*** Settings ***
Library    RequestsLibrary 
Library    OperatingSystem

Suite Setup    
# Test Setup    Create Session    alias=petshop    url=https://petstore.swagger.io/v2

*** Keywords ***
Get Auth Details 
    Create Session    alias=auth    url=https://petstore.swagger.io/auth
    ${response}     POST On Session    alias=auth    url=pet    
    ${auth_id}    Convert To String    ${response.json()}[auth_id]
    Return From Keyword     ${auth_id}


*** Test Cases ***
TC1 Find By Pet
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    GET On Session    alias=petshop    url=pet/101

    Log To Console    ${response} 
    Log     ${response} 
    Log    ${response.json()}
    Log To Console    ${response.json()}[id]
    Log To Console    ${response.json()}[name]

    Status Should Be    200

    ${body}    Convert To String    ${response.json()}
    Should Contain    ${body}    kitty

TC2 Find By Status
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    GET On Session    alias=petshop    url=pet/findByStatus?status=sold
    Log    ${response}
    Log    ${response.json()}
    
    Status Should Be    200

TC3 Add A Pet 

    Create Session    alias=auth    url=https://petstore.swagger.io/auth
    ${response}     POST On Session    alias=auth    url=pet    
    ${auth_id}    Convert To String    ${response.json()}[auth_id]

    ${auth}    Get Auth Details    

    ${json}    Get Binary File    ${EXECDIR}${/}files${/}pet.json

    &{header}    Create Dictionary    Content-Type=application/json      Authorization=${auth}

    Create Session    alias=petshop    url=https://petstore.swagger.io/v2

    ${response}     POST On Session    alias=petshop    url=pet    headers=${header}    data=${json}

    Log    ${response.json()}

    Status Should Be    200
    
    ${response_body}    Convert To String    ${response.json()}
    Should Contain     ${response_body}     doggie-9001


TC4 Add A Pet 
    #reading json body
    ${json}    Get Binary File    ${EXECDIR}${/}files${/}pet.json

    #creating header
    &{header}    Create Dictionary    Content-Type=application/json

    Create Session    alias=petshop    url=https://petstore.swagger.io/v2

    #post session with header and json
    ${response}     POST On Session    alias=petshop    url=pet    headers=${header}    data=${json}

    Log    ${response.json()}

    Status Should Be    200
    
    ${response_body}    Convert To String    ${response.json()}
    Should Contain     ${response_body}     doggie-9001


TC5 Invalid Pet Id 
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    Run Keyword And Ignore Error     GET On Session    alias=petshop    url=pet/568

    Log  ${response}


    # ${actual_message}    Convert To String    ${response.json()}[message]

    # Should Be Equal    ${actual_message}    Pet not found

    
    # Status Should Be    404

TC6
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    DELETE On Session   alias=petshop    url=pet/5001
    Log To Console    ${response}

TC7
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${res}    GET On Session    alias=petshop    url=pet/5001        expected_status=404
    Log To Console    ${res}
    Log To Console    ${res.json()}[message]
    Status Should Be    404