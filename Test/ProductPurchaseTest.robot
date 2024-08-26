*** Settings ***
Library     SeleniumLibrary
Resource    Resource/TestStepsKeyword.robot
Test Setup  Navigate to Sauce Demo application      ${URL}
Test Teardown   Close Browser

*** Variables ***
${USERNAME}     standard_user
${PASSWORD}     secret_sauce
${URL}      https://www.saucedemo.com/
${LOGIN_LOGO_LOCATOR}       xpath://div[@class='login_logo']
${PAGE_TITLE}       css:[data-test='title']

*** Test Cases ***
Login with a valid user and password
    [Documentation]     Valid login test using valid credentials
    # Verify if Login Page is displayed after navigating the application URL
    Verify Login Page is displayed
    # Logging in using the credentials provided in the variables section
    Login to Sauce Demo with Valid Credentials      ${USERNAME}     ${PASSWORD}
    # Verify successful login
    Verify that Product Page is displayed

Complete product purchase
    [Documentation]     Complete product purchase test, adding 3 products to the cart and verify end to end flow
    # Logging in using the credential provided in the variables section
    Login to Sauce Demo with Valid Credentials      ${USERNAME}     ${PASSWORD}
    # Adding Products to the cart from the Products page
    Add Product    Sauce Labs Backpack
    Add Product    Sauce Labs Bike Light
    Add Product    Sauce Labs Onesie
    # Verify if 3 products were added successfully to the cart
    Verify that Product quantity added to the cart is    3
    # Navigate to the Cart Page
    Go to Cart Page
    # Verify if correct Products are added
    Verify that Cart Page is displayed
    Verify Product Detail Added To The Cart    Sauce Labs Backpack   $29.99
    Verify Product Detail Added To The Cart    Sauce Labs Bike Light   $9.99
    Verify Product Detail Added To The Cart    Sauce Labs Onesie   $7.99
    # Navigate to the Checkout Page
    Go to Checkout Page
    # Filling up Customer Information
    Verify that Checkout Information Page is displayed
    Fill Checkout Information form and submit    John    Doe    1201
    Verify Checkout Overview Page information details    Payment Information:       Shipping Information:       Price Total
    # Complete Product checkout
    Finish purchase
    Verify that Checkout Complete Page is displayed
    Verify Order Success Message is displayed    Thank you for your order!    Your order has been dispatched, and will arrive just as fast as the pony can get there!