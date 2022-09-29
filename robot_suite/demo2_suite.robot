*** Settings ***
Library    Collections

*** Variables ***
${MY_NAME}      Balaji Dinakaran
@{COLORS}    red    yellow    green    black    blue   red
&{MY_RECORD}    name=Balaji    mobile=89898    role=trainer

*** Test Cases ***
TC1
    Log To Console    ${MY_NAME} 
    Append To List    ${COLORS}    orange

    Set Global Variable    ${TC1_VAR}   hello


TC2
    Log To Console    ${MY_NAME} 
    Log To Console    ${COLORS}
    Log To Console    ${COLORS}[2]

TC3
    #write a for loop for printing all the colors 
    ${count}    Get Length    ${COLORS}
    Log To Console    ${count}

    FOR    ${i}    IN RANGE    0    ${count}  
        Log To Console   ${COLORS}[${i}]
    END

TC4
    FOR    ${color}    IN    @{COLORS}
        ${output}     Run Keyword And Ignore Error    Log To Console    ${color}
        Log      ${output}
    END

TC5
    FOR    ${i}    IN RANGE    0    10  
        ${output}     Run Keyword And Ignore Error    Log To Console    ${COLORS}[${i}]
        Log      ${output}
    END

TC6
    @{fruits}    Create List    apple    orange    mango
    Log To Console    ${fruits}

    Append To List    ${fruits}    grapes
    Log To Console    ${fruits}

    #remove orange from the list
    Remove Values From List    ${fruits}    orange
    Log To Console    ${fruits}

    Remove From List    ${fruits}    0

    #insert pineapple at index 1 
    Insert Into List    ${fruits}    1    pineapple
    #print the list 
    Log To Console    ${fruits}
    Log List    ${fruits}

TC7
    Log To Console    ${MY_RECORD}
    Log To Console    ${MY_RECORD}[mobile]

    &{emp_dic}    Create Dictionary    empid=45    empname=saul    role=sse
    Log To Console    ${emp_dic}
    Log To Console    ${emp_dic}[empname]

    @{keys}     Get Dictionary Keys    ${MY_RECORD}
    Log To Console    ${keys}

    Set Local Variable    ${name}    Balaji
    Log To Console    ${name}

    ${my_name}    Set Variable    Bala
    Log To Console    ${my_name}


    Log To Console    ${TC1_VAR} 

    