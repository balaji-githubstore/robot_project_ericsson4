*** Settings ***
Library    DatabaseLibrary

Suite Setup   Connect To Database    dbapiModuleName=pymysql    dbName=dbfree_db    dbUsername=dbfree_db    
...    dbPassword=12345678    dbHost=db4free.net    dbPort=3306 
Suite Teardown    Disconnect From Database


*** Test Cases ***
TC1
    ${row_count}    Row Count    select * from Products  
    Log To Console    ${row_count}


TC2
    Row Count Is Greater Than X    select * from Products where productname='laptop'   1
    Row Count Is 0    select * from Products where productname='laptop123'
    Row Count Is Equal To X    select * from Products     127
    Row Count Is Less Than X    select * from Products     150

TC3
   @{output}      Query    select * from Products
   Log To Console    ${output}
   Log To Console    ${output}[0]
   Log To Console    ${output}[0][0]
   Log To Console    ${output}[0][1]
   Log To Console    ${output}[0][2]

TC4
    Execute Sql String    update Products set productname='mobile' where product_id=10 
    Row Count Is Equal To X    select * from Products where product_id=10 and productname='mobile'     1


TC5
   @{output}      Query    select * from Products where product_id<=11
   Log To Console    ${output}
   Log To Console    ${output}[0]
   Log To Console    ${output}[0][0]
   Log To Console    ${output}[0][1]
   Log To Console    ${output}[0][2]

   ${row_count}    Get Length    ${output}
   Log To Console     ${row_count}

    ${item_count_row1}    Get Length    ${output}[0]
   Log To Console     ${item_count_row1}

TC6
    Execute Sql String    delete from Products where product_id=10 


TC7
    Execute Sql String    insert into Products (product_id,productname,description) values (204,'Balaji','7skoo')
    Row Count Is Equal To X    select * from Products where product_id=204     1

TC8
   @{output}      Query    select * from Products where product_id=204
   Log To Console    ${output}

TC9
    Execute Sql String    insert into Products values (204,'jjj','7skoo')