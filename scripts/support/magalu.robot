***Settings***
Library      SeleniumLibrary
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

Product ${product} Must Be Found
    Search Results Page Must Be Opened
    Product ${product} Must Be Available

I Click on Product ${product}
    Wait Wait and Click Element    ${productBlock}\[title*='${product}']

Product Details Page Must Be Opened
    Elements Must Be Visible    

Product ${product} Details Page Must Be Opened
    Product Details Page Must Be Opened


    
