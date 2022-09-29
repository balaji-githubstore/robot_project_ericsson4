*** Settings ***
Resource    demo.resource
Library    Process

*** Test Cases ***
TC1
   ${res}     Get Area Of Circle     10
   Log To Console    ${res}

TC2
    Start Process    C:\\Users\\Balaji\\AppData\\Roaming\\Zoom\\bin\\Zoom.exe

    Terminate Process