*** Settings ***
Library    FakerLibrary

*** Test Cases ***
TC1
    ${card_number}    Credit Card Number
    Log To Console    ${card_number} 

    ${output}    Word
    Log To Console    ${output} 