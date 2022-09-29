*** Settings ***
Library  OperatingSystem

*** Test Cases ***
TC1
    
    Log To Console    ${CURDIR}
    Log To Console    ${EXECDIR}
    Log To Console    ${OUTPUT_DIR}
    Log To Console    ${TEMPDIR}
    Log To Console    ${TEST_NAME}
    Log To Console    ${SUITE_NAME}
    Log To Console    D:\\hello
    Log To Console    D:${/}hello

TC2
    Create Directory    D:${/}hello

TC3
    @{files}     List Files In Directory     C:${/}Users${/}Balaji
    Log     ${files}

TC4
    @{directories}     List Directory    D:${/}Mine
    Log To Console    ${directories}

TC5
    Create File    D:${/}hello.txt        hello, everyone
    File Should Exist    D:${/}hello.txt
    
TC6
    ${name}    Get Environment Variable    USERNAME
    Log    ${name}

    ${path}    Get Environment Variable    path
    Log    ${path}