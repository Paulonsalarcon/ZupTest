*** Settings ***
Resource         ../../support/magalu.robot
Documentation    Objective: These tests verify if the user is able to add a products to cart
Force Tags       addToCart    positive
*** Test Cases ***
Search Product and Add To Cart
    [Documentation]     Objective: Veridy that a product can be added to cart
    ...                 Pass criteria: The test pass when selected product is added to cart
    Given I Navigate to Magazine Luiza
    When I Search Product ${videoGame}
    Then Product ${videoGame} Must Be Found
    And Search Results Page Must Show 60 Products
    When I Click on Product ${videoGame}
    Then Product ${videoGame} Details Page Must Be Opened
    When I Click On Add To Cart Button
    Then Warranty Page Must Be Opened
    When I Click on Continue Button
    Then Product ${videoGame} Must Be Available In Cart

Add Two Different Products to Cart
    Given I Navigate to Magazine Luiza
    When I Search And Go To Product ${videoGame}
    And I Add Product ${videoGame} To Cart
    Then Product ${videoGame} Must Be Available In Cart
    When I Click On Buy More Products
    Then Magazine Luiza Home Page Must be Opened
    And Quantity in Cart Icon Must Be Equal To 1
    When I Search And Go To Product ${game}
    And I Add Product ${game} To Cart
    Then Product ${game} Must Be Available In Cart
    And Quantity in Cart Must Be Equal To 2