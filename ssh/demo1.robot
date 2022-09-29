*** Settings ***
Library    SSHLibrary 

Test Teardown    Close Connection

*** Test Cases ***
TC1
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    Get File    source=C:\\mine\\dp.jpg    destination=D:\\dp.jpg

TC2
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    @{directories}    List Directory    C:\\
    Log To Console    ${directories}


TC3
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    Enable Ssh Logging    log_detail.log
    ${stdout}    Execute Command    python --version
    Log To Console    ${stdout}


TC4
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    ${stdout}    Execute Command    java -jar selenium.jar
    Log To Console    ${stdout}

TC5
    Open Connection    host=192.168.1.7    port=22    alias=machine1
    Login    username=jidi    password=123456
    Start Command    appium -p 7878
    # Log To Console    ${stdout}


    Open Connection    host=192.168.1.7    port=22    alias=machine2


    Switch Connection    machine1
    