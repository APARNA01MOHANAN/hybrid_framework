*** Settings ***
Documentation  This file contains test cases related to valid login
Resource    ../resource/base/common_functionalities.resource

Test Setup  Launch Browser And Navigate To Url
Test Teardown  Close Browser

Test Template  Valid Login Template

*** Test Cases ***
Valid Login Test  Admin  admin123


*** Keywords ***
Valid Login Template
    [Arguments]  ${username}  ${password}  ${expected_header}
    Input Text   name=username    ${username}
    Input Text   name=password    ${password}
    Click Element   xpath=//button[text()=' Login ']
    Element Should Contain   xpath=//h6[text()='Dashboard']    ${expected_header}

    sleep  10s