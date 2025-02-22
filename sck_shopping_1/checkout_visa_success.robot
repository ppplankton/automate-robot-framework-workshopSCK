*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://139.59.248.187/product/list
${BROWSER}    Edge
*** Test Cases ***
ชำระเงินด้วย VISA CARD สำเร็จ
    เข้าหน้า HOME ของ SCK Shopping Mall
    ค้นหาสินค้าด้วยคำค้น BiCyCle
    
    ตรวจสอบผลการค้นหา ต้องพบ Balance Training Bicycle และราคาต่อชิ้น 4,314.60 บาท
    ตรวจสอบผลการค้นหา ต้องพบ Princess Training Bicycle และราคาต่อชิ้น 4,314.60 บาท
    ตรวจสอบผลการค้นหา ต้องพบ BICYCLE Playing Dices และราคาต่อชิ้น 137.05 บาท
    เลือกดูรายละเอียดสินค้า Balance Training Bicycle

    ตรวจสอบข้อมูลสินค้า ชื่อสินค้าเท่ากันกับ Balance Training Bicycle
    ตรวจสอบข้อมูลสินค้า ราคาสินค้าเท่ากันกับ 4,314.60 บาท
    ตรวจสอบข้อมูลสินค้า จำนวนแต้มที่จะได้เท่ากันกับ 43 แต้ม
    ตรวจสอบข้อมูลสินค้า จำนวนสินค้าเท่ากันกับ 100 ชิ้น
    กดเลือกซื้อ Balance Training Bicycle จำนวน 3 คัน
    กด Add to cart
    ตรวจสอบจำนวนสินค้าในตะกร้าต้องเท่ากันกับ 1

    เข้าดูรายการสินค้าที่เลือกซื้อ
    ตรวจสอบตระกร้า ชื่อสินค้าเท่ากันกับ Balance Training Bicycle
    ตรวจสอบตระกร้า ราคาสินค้าเท่ากันกับ 12,943.80 บาท
    ตรวจสอบตระกร้า จำนวนแต้มที่จะได้เท่ากันกับ 129 แต้ม
    ตรวจสอบตระกร้า จำนวนสินค้าเท่ากันกับ 100 ชิ้น
    ตรวจสอบตระกร้า จำนวนสินค้า เท่ากับ 3 คัน
    ตรวจสอบตระกร้า ยอดรวม
    กด Chack out

    ตรวจสอบCheckout ชื่อสินค้าเท่ากันกับ Balance Training Bicycle
    ตรวจสอบCheckout ราคาสินค้าเท่ากันกับ 12,943.80 บาท
    ตรวจสอบCheckout จำนวนแต้มที่จะได้เท่ากันกับ 129 แต้ม
    ตรวจสอบCheckout จำนวนสินค้าเท่ากันกับ 100 ชิ้น
    ตรวจสอบCheckout จำนวนสินค้า เท่ากับ 3 คัน

    กรอกที่อยู่จัดส่ง
    เลือกขนส่ง Kerry
    เลือกชำระเงินด้วย Credit Card และกรอกข้อมูลบัตร
    ยืนยันการชำระเงิน
    กรอก OTP และยืนยันการชำระเงิน
    ตรวจสอบผลการชำระเงิน


*** Keywords ***
เข้าหน้า HOME ของ SCK Shopping Mall
    Open Browser    browser=${BROWSER}
    Go To     url=${URL}
    
ค้นหาสินค้าด้วยคำค้น BiCyCle
    Input Text      locator=search-product-input    text=BiCyCle
    Click Button    locator=search-product-btn

    
