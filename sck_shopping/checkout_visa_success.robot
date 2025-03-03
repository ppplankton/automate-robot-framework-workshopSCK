*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://139.59.248.187/product/list
${BROWSER}    Edge
&{DERIVERY}    thai_post=shipping-method-2-card    kerry=shipping-method-1-card
*** Test Cases ***
ชำระเงินด้วย VISA CARD สำเร็จ
    เข้าหน้า HOME ของ SCK Shopping Mall
    ค้นหาสินค้าด้วยคำค้น BiCyCle
    
    ตรวจสอบผลการค้นหาที่ตำแหน่ง product-card-name-1 ต้องพบ Balance Training Bicycle และที่ตำแหน่ง product-card-price-1 ต้องพบราคาต่อชิ้น ฿4,314.60 บาท
    ตรวจสอบผลการค้นหาที่ตำแหน่ง product-card-name-10 ต้องพบ Princess Training Bicycle และที่ตำแหน่ง product-card-price-10 ต้องพบราคาต่อชิ้น ฿4,314.60 บาท
    ตรวจสอบผลการค้นหาที่ตำแหน่ง product-card-name-458 ต้องพบ BICYCLE Playing Dices และที่ตำแหน่ง product-card-price-458 ต้องพบราคาต่อชิ้น ฿137.05 บาท

    ตรวจสอบผลการค้นหาที่ตำแหน่ง
    ...    product-card-name-1    Balance Training Bicycle
    ...    product-card-price-1    ฿4,314.60

    ตรวจสอบผลการค้นหาที่ตำแหน่ง
    ...    product-card-name-1    Princess Training Bicycle 
    ...    product-card-price-1    ฿4,314.60
     

    
    เลือกดูรายละเอียดสินค้าที่ตำแหน่ง product-card-1 และที่ตำแหน่ง product-card-name-1 ชื่อสินค้าต้องพบ Balance Training Bicycle

    ตรวจสอบข้อมูลสินค้าที่ตำแหน่ง product-detail-product-name ชื่อสินค้าเท่ากันกับ Balance Training Bicycle
    ตรวจสอบแบรนสินค้าที่ตำแหน่ง product-detail-brand ชื่อแบรนจะต้องเท่ากับ SportsFun
    ตรวจสอบราคาของสินค้าที่ตำแหน่ง product-detail-price-thb จำนวนราคาที่แสดงต้องเท่ากับ ฿4,314.60
    ตรวจสอบแต้มของสินค้าที่ตำแหน่ง product-detail-point จำนวนแต้มที่แสดงต้องเท่ากับ 43 Points

    ตรวจสอบจำนวนสินค้าที่ตำแหน่ง product-detail-quantity-input ต้องมีจำนวนเท่ากับ value 1
    กดเพิ่มจำนวนสินค้าที่ตำแหน่ง product-detail-quantity-increment-btn จำนวน 3 ครั้ง และตรวจสอบที่ตำแหน่ง product-detail-quantity-input ต้องมีจำนวนเท่ากับ 4
    # ตรวจสอบจำนวนคงเหลือของสินค้าที่ตำแหน่ง product-detail-stock จำนวนของสินค้าที่แสดงต้องแสดงจำนวน Stock 100 items
    
    กดเพิ่มสินค้าลงตระกร้า Add to cart
 
    คลิกดูตระกร้าสินค้าและแสดงหน้าตระกร้าสินค้า
    # ตรวจสอบในตระกร้า ชื่อสินค้าเท่ากันกับ Balance Training Bicycle
    # ตรวจสอบในตระกร้า ราคาเท่ากันกับ ฿17,258.40
    # ตรวจสอบในตระกร้า แต้มเท่ากันกับ 172 Points
    # ตรวจสอบในตระกร้า จำนวนสินค้าที่เลือก เท่ากันกับ 4
    # ตรวจสอบในตระกร้า ราคารวมเท่ากันกับ ฿17,258.39
    คลิกที่ปุ่ม Checkout
    
    แสดงหน้าสรุปคำสั่งซื้อ

    กรอกที่อยู่จัดส่ง    
    ...    shipping-form-province-select    เชียงใหม่    
    ...    เมืองเชียงใหม่    
    ...    สุเทพ
    ...    50200
    ...    0985862820
    
    เลือกวิธีการจัดส่ง  ${DERIVERY}[kerry]

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

ตรวจสอบผลการค้นหาที่ตำแหน่ง
    [Arguments]    
    ...    ${id_name}    ${id_name}
    ...    ${id_price}    ${price}
    
    

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

กดเพิ่มจำนวนสินค้าที่ตำแหน่ง ${product-detail-quantity-increment-btn} จำนวน 3 ครั้ง และตรวจสอบที่ตำแหน่ง ${product-detail-quantity-input} ต้องมีจำนวนเท่ากับ 4
    Click Button    id=${product-detail-quantity-increment-btn}
    Element Attribute Value Should Be  id=${product-detail-quantity-input}    value    2
     Click Button    id=${product-detail-quantity-increment-btn}
    Element Attribute Value Should Be  id=${product-detail-quantity-input}    value    3
     Click Button    id=${product-detail-quantity-increment-btn}
    Element Attribute Value Should Be  id=${product-detail-quantity-input}    value    4

ตรวจสอบจำนวนคงเหลือของสินค้าที่ตำแหน่ง ${product-detail-stock} จำนวนของสินค้าที่แสดงต้องแสดงจำนวน ${expected_stock_number}
    Element Text Should Be    id=${product-detail-stock}    expected=${expected_stock_number}


กดเพิ่มสินค้าลงตระกร้า ${Add to cart}
    # Element Text Should Be    id=header-menu-cart-badge    expected=0
    Element Text Should Be    id=product-detail-add-to-cart-btn    expected=${Add to cart}
    Click Button    id=product-detail-add-to-cart-btn
    Wait Until Element Is Visible    id=header-menu-cart-badge
    # Element Text Should Be    id=header-menu-cart-badge    expected=1

คลิกดูตระกร้าสินค้าและแสดงหน้าตระกร้าสินค้า
    Click Element    id=header-menu-cart-badge
    Wait Until Element Is Visible    id=shopping-cart-header
    Element Text Should Be    id=shopping-cart-header    expected=Shopping cart

ตรวจสอบในตระกร้า ชื่อสินค้าเท่ากันกับ ${expected_product_name}
    Element Text Should Be    id=product-1-name    expected=${expected_product_name}




ตรวจสอบในตระกร้า ราคาเท่ากันกับ ฿17,258.40
    Element Text Should Be    id=product-1-price    expected=฿17,258.40

ตรวจสอบในตระกร้า แต้มเท่ากันกับ 172 Points
    Element Text Should Be    id=product-1-point    expected=172 Points

ตรวจสอบในตระกร้า จำนวนสินค้าที่เลือก เท่ากันกับ 4
    Element Attribute Value Should Be    id=product-1-quantity-input    value    expected=4

ตรวจสอบในตระกร้า ราคารวมเท่ากันกับ ฿17,258.39
    Element Text Should Be    id=shopping-cart-subtotal-price    expected=฿17,258.39

คลิกที่ปุ่ม Checkout
    Element Should Be Visible    id=shopping-cart-checkout-btn
    Click Element    id=shopping-cart-checkout-btn

แสดงหน้าสรุปคำสั่งซื้อ
    Wait Until Page Contains    Orders    10s
กรอกที่อยู่จัดส่ง
    [Arguments]    
    ...    ${ID_provice}    ${provide}         
    ...    ${district}    
    ...    ${sub_district}
    ...    ${zipcode}
    ...    ${mobile_number}

    Select From List By Label    id=${ID_provice}    ${provide}
    Capture Element Screenshot    id=shipping-form-province-select    filename=province.png

    Select From List By Label    id=shipping-form-district-select    ${district}
    Select From List By Label    id=shipping-form-sub-district-select    ${sub_district}
    Element Attribute Value Should Be    id=shipping-form-zipcode-input    value    ${zipcode}
    Input Text    id=shipping-form-mobile-input    ${mobile_number}

เลือกวิธีการจัดส่ง 
    [Arguments]    
    ...    ${derivery}
    Click Element    id=${derivery}