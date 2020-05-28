*** Settings ***
Resource         ../../support/magalu.robot
Documentation    Objective: These tests verify if the user is able to add a products to cart
Force Tags       addToCart    positive
*** Test Cases ***
Search Product and Add To Cart
    [Documentation]     Objective: Veridy that a product can be added to cart
    ...                 Pass criteria: The test pass when selected product is added to cart
    Given I Navigate to Magazine LuizaForce Tags    addToCart
    When I Search Product ${videoGame}
    Then Product ${videoGame} Must Be Found
    When I Click on Product ${videoGame}
    Then Product ${videoGame} Details Page Must Be Opened
    When I Click On Add To Cart Button
    Then Warranty Page Must Be Opened
    When I Click on Continue Button
    Then Product ${videoGame} Must Be Added To Cart