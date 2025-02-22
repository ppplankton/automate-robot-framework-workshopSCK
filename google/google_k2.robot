*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://www.google.com/
${BROWSER}    chrome


*** Test Cases ***
ทดสอบด้วยคำค้น Keychron ต้องเจอ Keychron Thailand
    เปิด Browser เข้าสู่เว็ปไซต์ https://www.google.com/
    ใส่คำค้น    Keychron
    ตรวจผลลัพธ์แล้วต้องเจอ Keychron Thailand

ทดสอบด้วยคำค้น Agile ต้องเจอ Agile manifesto
    เปิด Browser เข้าสู่เว็ปไซต์ https://www.google.com/
    ใส่คำค้น    Agile
    ตรวจผลลัพธ์แล้วต้องเจอ Agile manifesto

*** Keywords ***
เปิด Browser เข้าสู่เว็ปไซต์ https://www.google.com/
    Open Browser    browser=${BROWSER}    url=${URL}

ใส่คำค้น
    [Arguments]    ${keywords}
    Input Text      name=q    text=${keywords}
    Press Keys      None    RETURN

ตรวจผลลัพธ์แล้วต้องเจอ
    [Arguments]    ${expected_resule}
    Wait Until Page Contains    ${expected_resule}