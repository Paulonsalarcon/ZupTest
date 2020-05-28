*** Settings ***
Resource         ../../support/magalu.robot
Documentation    Objective: These tests verify if the user is able to remove products from cart
Force Tags       removeFromCart    negative

*** Test Cases ***
Clear Cart With One Product
    [Tags]    DEBUG
    Given I Navigate to Magazine Luiza
    When I Search And Go To Product ${videoGame}
    And I Add Product ${videoGame} To Cart
    Then Product ${videoGame} Must Be Added To Cart
    When I Click on Remove ${videoGame} from Cart
    Then Cart Must Be Empty