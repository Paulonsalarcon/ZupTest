***Settings***
Resource    ../../support/magalu.robot

***Test Cases***
Search Product and Add To Cart
    Given I Navigate to Magazine Luiza
    When I Search Product ${videoGame}
    Then Product ${videoGame} Must Be Found
    When I Click on Product ${videoGame}
    