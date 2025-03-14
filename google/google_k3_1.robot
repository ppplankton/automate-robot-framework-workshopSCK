*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://www.google.com/
${BROWSER}    chrome


*** Test Cases ***
ทดสอบด้วยคำค้น
    [Template]    ค้นหาด้วยคำค้น
    Keychron    Keychron Thailand
    Agile    Agile manifesto

*** Keywords ***
ค้นหาด้วยคำค้น
    [Arguments]    ${keywords}    ${expected_result}
    เปิด Browser เข้าสู่เว็ปไซต์ https://www.google.com/
    ใส่คำค้น    ${keywords}
    ตรวจผลลัพธ์แล้วต้องเจอ    ${expected_result}



เปิด Browser เข้าสู่เว็ปไซต์ https://www.google.com/
    Open Browser    browser=${BROWSER}    url=${URL}

ใส่คำค้น
    [Arguments]    ${keywords}
    Input Text      name=q    text=${keywords}
    Press Keys      None    RETURN

ตรวจผลลัพธ์แล้วต้องเจอ
    [Arguments]    ${expected_result}
    Wait Until Page Contains    ${expected_result}