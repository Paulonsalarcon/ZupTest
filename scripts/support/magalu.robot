***Settings***
Library      SeleniumLibrary    timeout=15
Variables    locators.py
Resource     common.robot


***Keywords***
I Go to Magazine Luiza
    Go To    https://www.magazineluiza.com.br/

Magazine Luiza Home Page Must be Opened
    Elements Must Be Visible    ${homePageElements}

I Navigate to Magazine Luiza
    Given I Go to Magazine Luiza
    Then Magazine Luiza Home Page Must be Opened

I Input Product ${product} in Search Bar
    Wait And Input Text    ${searchInput}    ${product}

I Click on Search Button
    Wait and Click Element    ${searchButton}

I Search Product ${product}
    Given I Input Product ${product} in Search Bar
    When I Click on Search Button

Product ${product} Must Be Available
    Element Should Be Visible    ${productBlock}\[title*='${product}']

Search Results Page Must Be Opened
    Elements Must Be Visible    ${searchResultPageElements}
    Page Should Contain Element    ${productBlock}    limit:60
    ${productCount}    Get Element Count    ${productBlock}
    Should Be Equal As Integers    ${productCount}    60

Product ${product} Must Be Found
    Search Results Page Must Be Opened
    Product ${product} Must Be Available

I Search And Go To Product ${product}
    Given I Search Product ${product}
    Then Product ${product} Must Be Found
    When I Click on Product ${product}
    Then Product ${product} Details Page Must Be Opened

I Click on Product ${product}
    Wait and Click Element    ${productBlock}\[title*='${product}']

Product Details Page Must Be Opened
    Elements Must Be Visible    ${productElements}

Product ${product} Details Page Must Be Opened
    Product Details Page Must Be Opened
    ${text}    Get Text    ${productTitle}
    Should Contain    ${text}    ${product}

I Click On Add To Cart Button
    Wait and Click Element    ${productAddToCartButton}

Warranty Page Must Be Opened
    Elements Must Be Visible    ${warrantyElements}

I Click on Continue Button
    Wait And Click Element    ${warrantyContinueButton}

I Add Product ${product} To Cart
    Given I Click On Add To Cart Button
    And I Click on Continue Button

Cart Page Must Be Opened
    Elements Must Be Visible    ${cartElements}

Product ${product} Must Be Added To Cart
    Cart Page Must Be Opened
    Element Should Be Visible    xpath:.//*[@class='BasketItemProduct-info-title']//*[contains(text(),'${product}')]

Quantity of Product ${product} Must Be Equal To ${quantity}
    ${text}    Get Text    css:.BasketPriceBox-prices-title--normal
    ${quantityText}    Run Keyword If    ${quantity}==1    Set Variable    (${quantity} item)
    ...    ELSE    Set Variable    (${quantity} itens)
    Should Be Equal As Strings    ${quantityText}    ${text}

Product ${product} Must Be Added To Cart With Quantity ${quantity}
    Then Product ${product} Must Be Added To Cart
    And Quantity of Product ${product} Must Be Equal To ${quantity}

I Change Quantity of Product ${product} To ${quantity}
    Select From List By Value    xpath:.//*[@class='BasketItemProduct-info-title']//*[contains(text(),'${product}')]//ancestor::*[@class='BasketItem-productContainer']//select[@class='BasketItemProduct-quantity-dropdown']
    ...     ${quantity}
    Wait For Loading

Wait For Loading
    Wait Until Element Is Not Visible    ${loading}



    
