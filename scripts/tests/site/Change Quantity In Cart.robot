*** Settings ***
Resource         ../../support/magalu.robot
Documentation    Objective: These tests verify if the user is able to change the number of products in cart
Force Tags       addToCart    quantity     positive    boundary
Test Template    Change Quantity

*** Test Cases ***                   PRODUCT         QUANTITY
Change Quantity of Product To 2     ${videogame}      2
Change Quantity of Product To 10    ${videogame}     10

*** Keywords ***
Change Quantity
    [Documentation]     Objective: Veridy that a product can be added to cart
    ...                 Pass criteria: The test pass when selected product is added to cart
    [Arguments]    ${product}    ${quantity}
    Given I Navigate to Magazine Luiza
    When I Search And Go To Product ${product}
    And I Add Product ${product} To Cart
    Then Product ${product} Must Be Added To Cart With Quantity 1
    When I Change Quantity of Product ${product} To ${quantity}
    Then Quantity of Product ${product} Must Be Equal To ${quantity}