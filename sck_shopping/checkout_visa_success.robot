*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://139.59.248.187/product/list
${BROWSER}    Edge
*** Test Cases ***
ชำระเงินด้วย VISA CARD สำเร็จ
    เข้าหน้า HOME ของ SCK Shopping Mall
    ค้นหาสินค้าด้วยคำค้น BiCyCle
    
    ตรวจสอบผลการค้นหาที่ตำแหน่ง product-card-name-1 ต้องพบ Balance Training Bicycle และที่ตำแหน่ง product-card-price-1 ต้องพบราคาต่อชิ้น ฿4,314.60 บาท
    ตรวจสอบผลการค้นหาที่ตำแหน่ง product-card-name-10 ต้องพบ Princess Training Bicycle และที่ตำแหน่ง product-card-price-10 ต้องพบราคาต่อชิ้น ฿4,314.60 บาท
    ตรวจสอบผลการค้นหาที่ตำแหน่ง product-card-name-458 ต้องพบ BICYCLE Playing Dices และที่ตำแหน่ง product-card-price-458 ต้องพบราคาต่อชิ้น ฿137.05 บาท
    
    เลือกดูรายละเอียดสินค้าที่ตำแหน่ง product-card-1 และที่ตำแหน่ง product-card-name-1 ชื่อสินค้าต้องพบ Balance Training Bicycle

    ตรวจสอบข้อมูลสินค้าที่ตำแหน่ง product-detail-product-name ชื่อสินค้าเท่ากันกับ Balance Training Bicycle
    ตรวจสอบแบรนสินค้าที่ตำแหน่ง product-detail-brand ชื่อแบรนจะต้องเท่ากับ SportsFun
    ตรวจสอบราคาของสินค้าที่ตำแหน่ง product-detail-price-thb จำนวนราคาที่แสดงต้องเท่ากับ ฿4,314.60
    ตรวจสอบแต้มของสินค้าที่ตำแหน่ง product-detail-point จำนวนแต้มที่แสดงต้องเท่ากับ 43 Points
    ตรวจสอบจำนวนสินค้าที่ตำแหน่ง product-detail-quantity-input ต้องมีจำนวนเท่ากับ value 1


    # กดเพิ่มจำนวนสินค้าที่ตำแหน่ง product-detail-quantity-increment-btn จำนวน 3 ครั้ง ต้องมีจำนวนเท่ากับ 4
    
    # ตรวจสอบจำนวนคงเหลือของสินค้าที่ตำแหน่ง product-detail-stock จำนวนของสินค้าที่แสดงต้องแสดงจำนวน Stock 100 items

    # ตรวจสอบข้อมูลสินค้า ราคาสินค้าเท่ากันกับ 4,314.60 บาท
    # ตรวจสอบข้อมูลสินค้า จำนวนแต้มที่จะได้เท่ากันกับ 43 แต้ม
    # ตรวจสอบข้อมูลสินค้า จำนวนสินค้าเท่ากันกับ 100 ชิ้น

    # กด Add to cart
    # ตรวจสอบจำนวนสินค้าในตะกร้าต้องเท่ากันกับ 1
    # เข้าดูรายการสินค้าที่เลือกซื้อ
    # ตรวจสอบตระกร้า ชื่อสินค้าเท่ากันกับ Balance Training Bicycle
    # ตรวจสอบตระกร้า ราคาสินค้าเท่ากันกับ 12,943.80 บาท


    # ตรวจสอบตระกร้า จำนวนแต้มที่จะได้เท่ากันกับ 129 แต้ม
    # ตรวจสอบตระกร้า จำนวนสินค้าเท่ากันกับ 100 ชิ้น
    # ตรวจสอบตระกร้า จำนวนสินค้า เท่ากับ 3 คัน
    # ตรวจสอบตระกร้า ยอดรวม
    # กด Chack out

    # ตรวจสอบCheckout ชื่อสินค้าเท่ากันกับ Balance Training Bicycle
    # ตรวจสอบCheckout ราคาสินค้าเท่ากันกับ 12,943.80 บาท
    # ตรวจสอบCheckout จำนวนแต้มที่จะได้เท่ากันกับ 129 แต้ม
    # ตรวจสอบCheckout จำนวนสินค้าเท่ากันกับ 100 ชิ้น
    # ตรวจสอบCheckout จำนวนสินค้า เท่ากับ 3 คัน

    # กรอกที่อยู่จัดส่ง
    # เลือกขนส่ง Kerry
    # เลือกชำระเงินด้วย Credit Card และกรอกข้อมูลบัตร
    # ยืนยันการชำระเงิน
    # กรอก OTP และยืนยันการชำระเงิน
    # ตรวจสอบผลการชำระเงิน


*** Keywords ***
เข้าหน้า HOME ของ SCK Shopping Mall
    Open Browser    browser=${BROWSER}
    Go To     url=${URL}
    
ค้นหาสินค้าด้วยคำค้น BiCyCle
    Input Text    id=search-product-input    text=BiCyCle
    Click Button    id=search-product-btn

ตรวจสอบผลการค้นหาที่ตำแหน่ง ${expected_card_id} ต้องพบ ${expected_product_name} และที่ตำแหน่ง ${expected_product_price_id} ต้องพบราคาต่อชิ้น ${expected_product_price} บาท
    
    Wait Until Element Is Visible    ${expected_card_id}
    Element Text Should Be    id=${expected_card_id}    expected=${expected_product_name}
    Element Text Should Be    id=${expected_product_price_id}    expected=${expected_product_price}

เลือกดูรายละเอียดสินค้าที่ตำแหน่ง ${expected_card_id} และที่ตำแหน่ง ${expected_product_id} ชื่อสินค้าต้องพบ ${expected_product_name}
    Element Should Be Visible    id=${expected_card_id}  
    Element Text Should Be    id=${expected_product_id}    expected=${expected_product_name}
    Click Element    ${expected_card_id}

ตรวจสอบข้อมูลสินค้าที่ตำแหน่ง ${product-detail-product-name} ชื่อสินค้าเท่ากันกับ ${expected_product_name}
    Wait Until Element Is Visible    id=${product-detail-product-name}
    Element Text Should Be    id=${product-detail-product-name}    expected=${expected_product_name}

ตรวจสอบแบรนสินค้าที่ตำแหน่ง ${product-detail-brand} ชื่อแบรนจะต้องเท่ากับ ${expected_brand_name}
    Element Text Should Be    id=${product-detail-brand}    expected=${expected_brand_name}

ตรวจสอบราคาของสินค้าที่ตำแหน่ง ${product-detail-price-thb} จำนวนราคาที่แสดงต้องเท่ากับ ${expected_price}
    Element Text Should Be    id=${product-detail-price-thb}    expected=${expected_price}

ตรวจสอบแต้มของสินค้าที่ตำแหน่ง ${product-detail-point} จำนวนแต้มที่แสดงต้องเท่ากับ ${expected_point}
    Element Text Should Be    id=${product-detail-point}    expected=${expected_point}

ตรวจสอบจำนวนสินค้าที่ตำแหน่ง ${product-detail-quantity-input} ต้องมีจำนวนเท่ากับ ${expected_value} ${expected_quantity}
    Element Attribute Value Should Be  id=${product-detail-quantity-input}    ${expected_value}    ${expected_quantity}

