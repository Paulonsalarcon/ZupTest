***Settings***
Resource    ../../support/magalu.robot

***Test Cases***
Search Product and Add To Cart
    Given I Navigate to Magazine Luiza
    When I Search Product ${videoGame}
    Then Product ${videoGame} Must Be Found
    When I Click on Product ${videoGame}
    Then Product ${videoGame} Details Page Must Be Opened
    When I Click On Add To Cart Button
    Then Warranty Page Must Be Opened
    When I Click on Continue Button
    Then Product ${videoGame} Must Be Added To Cartf