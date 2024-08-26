*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${LOGIN_LOGO_LOCATOR}       xpath://div[@class='login_logo']
${PAGE_TITLE}       css:[data-test='title']

*** Keywords ***
Navigate to Sauce Demo application
    [Arguments]     ${URL}
    Open Browser        ${URL}      Chrome
    Maximize Browser Window

Verify Login Page is displayed
    Element Should Contain    ${LOGIN_LOGO_LOCATOR}    Swag Labs

Login to Sauce Demo with Valid Credentials
    [Arguments]     ${USERNAME}     ${PASSWORD}
    Input Text    id:user-name    ${USERNAME}
    Input Password    id:password   ${PASSWORD}
    Click Button    id:login-button

Verify that Product Page is displayed
    Element Should Contain    ${PAGE_TITLE}    Product

Add Product
    [Arguments]     ${PRODUCT_NAME}
    Click Element    xpath://div[text()='${PRODUCT_NAME}']/parent::a/parent::div/parent::div/div[2]//button

Verify that Product quantity added to the cart is
    [Arguments]     ${QUANTITY}
    Element Should Contain    css:[data-test='shopping-cart-badge']    3

Verify that Cart Page is displayed
    Element Should Contain    ${PAGE_TITLE}    Your Cart

Verify Product Detail Added To The Cart
    [Arguments]     ${PRODUCT_NAME}     ${PRODUCT_PRICE}
    Element Should Contain    xpath://div[text()='${PRODUCT_NAME}']    ${PRODUCT_NAME}
    Element Should Contain    xpath://div[text()='${PRODUCT_NAME}']/parent::a/parent::div/div[2]/div    ${PRODUCT_PRICE}

Go to Cart Page
     Click Link    css:[data-test='shopping-cart-link']

Go to Checkout Page
    Click Button    id:checkout

Verify that Checkout Information Page is displayed
    Element Should Contain    ${PAGE_TITLE}    Checkout: Your Information

Fill Checkout Information form and submit
    [Arguments]     ${FIRST_NAME}   ${LAST_NAME}    ${ZIP_CODE}
    Input Text    id:first-name    ${FIRST_NAME}
    Input Text    id:last-name    ${LAST_NAME}
    Input Text    id:postal-code    ${ZIP_CODE}
    Click Element    id:continue

Verify that Checkout Overview Page is displayed
   Element Should Contain    ${PAGE_TITLE}    Checkout: Overview

Verify Checkout Overview Page information details
    [Arguments]     ${INFO1}        ${INFO2}        ${INFO3}
    Element Should Contain    css:[data-test='payment-info-label']    ${INFO1}
    Element Should Contain    css:[data-test='shipping-info-label']    ${INFO2}
    Element Should Contain    css:[data-test='total-info-label']    ${INFO3}

Finish purchase
    Click Element    id:finish

Verify that Checkout Complete Page is displayed
   Element Should Contain    ${PAGE_TITLE}    Checkout: Complete!

Verify Order Success Message is displayed
    [Arguments]     ${HEADER}       ${TEXT}
    Element Text Should Be      css:[data-test='complete-header']       ${HEADER}
    Element Text Should Be    css:[data-test='complete-text']    ${TEXT}

