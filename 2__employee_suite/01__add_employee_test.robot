*** Settings ***
Documentation  This file contains test cases related to valid employee record
Resource    ../resource/base/common_functionalities.resource
Library  DataDriver  file=../test_data/orange_data.xlsx  sheet_name=AddEmployee
Test Setup  Launch Browser And Navigate To Url
Test Teardown  Close Browser

Test Template  Add Valid Employee Template

*** Test Cases ***
Add Valid Employee Test_${test_name}


*** Keywords ***
Add Valid Employee Template
    [Arguments]  ${username}  ${password}  ${firstname}  ${middlename}  ${lastname}  ${val_name}   ${val_firstname}
    Input Text   name=username    ${username}
    Input Text   name=password    ${password}
    Click Element   xpath=//button[text()=' Login ']
    Click Element   xpath=//span[text()='PIM']
    Click Element   link=Add Employee
    Input Text   name=firstName    ${firstname}
    Input Text   name=middleName    ${middlename}
    Input Text   name=lastName    ${lastname}
    sleep  5s
    Click Element   xpath=//button[text()=' Save ']
    Wait Until Page Contains   ${firstname}${SPACE}${lastname}
    Element Text Should Be   xpath=//h6[contains(normalize-space(),'${firstname}')]    ${val_name}
    Element Attribute Value Should Be   name=firstName    value    ${val_firstname}




