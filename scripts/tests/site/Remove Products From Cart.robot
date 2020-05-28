*** Settings ***
Resource         ../../support/magalu.robot
Documentation    Objective: These tests verify if the user is able to remove products from cart
Force Tags       removeFromCart    negative

*** Test Cases ***
Clear Cart With One Product
    Given I Navigate to Magazine Luiza
    When I Search And Go To Product ${videoGame}
    And I Add Product ${videoGame} To Cart
    Then Product ${videoGame} Must Be Available In Cart
    When I Click on Remove ${videoGame} from Cart
    Then Cart Must Be Empty

Remove One Product From Cart
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
    When I Click on Remove ${videoGame} from Cart
    Then Product ${videoGame} Must Not Be Available In Cart
    And Product ${game} Must Be Available In Cart
    And Quantity in Cart Must Be Equal To 1
