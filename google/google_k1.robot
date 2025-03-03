*** Settings ***
Library    SeleniumLibrary


*** Variables ***


*** Test Cases ***
ทดสอบ การค้นหาด้วยคำค้น "Keychron" บนเว็ปไซต์ Google ต้องเจอ Keychron Thailand
    เปิด Browser เข้าสู่เว็ปไซต์ https://www.google.com/
    กรอกข้อความ "Keychron" และค้นหา
    ตรวจผลลัพธ์แล้วต้องเจอ Keychron Thailand

*** Keywords ***
เปิด Browser เข้าสู่เว็ปไซต์ https://www.google.com/
    Open Browser    browser=Edge    url=https://www.google.com/

กรอกข้อความ "Keychron" และค้นหา
    Input Text      name=q    text=Keychron
    Press Keys      None    RETURN

ตรวจผลลัพธ์แล้วต้องเจอ Keychron Thailand
    Wait Until Page Contains    Keychron Thailand