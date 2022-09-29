*** Settings ***
Library    RPA.JSON
*** Test Cases ***
TC1
    &{json}    Load JSON from file    ${EXECDIR}${/}files${/}data.json
    Log To Console    ${json.browser}
    Log To Console    ${json.connectionstringdb}
    Log To Console    ${json.validcredentialtestdata}
    Log To Console    ${json.validcredentialtestdata}[0]
    Log To Console    ${json.validcredentialtestdata}[0][0]

    Log To Console    ${json}[browser]
   