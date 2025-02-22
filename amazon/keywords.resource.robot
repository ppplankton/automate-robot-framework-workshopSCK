*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
ค้นหาด้วยคำค้น
    [Arguments]    ${keywords}    ${expected_result}    ${expected_result1}    ${book_name}   ${paperback}    ${kindle}
    เปิด Browser เข้าเว็ป amazon
    ใส่คำค้น    ${keywords}
    ตรวจผลลัพธ์แล้วต้องเจอ    ${expected_result}    ${expected_result1}    ${book_name}   ${paperback}    ${kindle}

เปิด Browser เข้าเว็ป amazon
    Open Browser    browser=${BROWSER}    url=${URL}

ใส่คำค้น
    [Arguments]    ${keywords}
    Input Text      id=twotabsearchtextbox    text=${keywords}
    Press Keys      None    RETURN

ตรวจผลลัพธ์แล้วต้องเจอ
    [Arguments]    ${expected_result}    ${expected_result1}    ${book_name}    ${paperback}    ${kindle}
    Wait Until Page Contains    ${expected_result}    
    Wait Until Page Contains    ${expected_result1}
    Wait Until Page Contains    ${book_name}
    Wait Until Page Contains    ${paperback}
    Wait Until Page Contains    ${kindle}