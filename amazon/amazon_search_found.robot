*** Settings ***
Resource    keywords.resource.robot
Test Template    ค้นหาด้วยคำค้น


*** Variables ***
${URL}    https://www.amazon.com/
${BROWSER}    headlesschrome


*** Test Cases ***
ทดสอบด้วยคำค้น agile testing ต้องเจอ Lisa Crispin and Janet Gregory 
    agile testing    Lisa Crispin    Janet Gregory    Agile Testing: A Practical Guide for Testers and Agile Teams    35    33
