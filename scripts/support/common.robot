***Settings***
Library    SeleniumLibrary

***Keywords***
Start Browser
    Open Browser 	about:blank 	${BROWSER}
    ${isHeadless}    Run Keyword and Return Status    Should Contain    ${BROWSER}    isHeadless
    Run Keyword If    ${isHeadless}    Set Window Size    1366    768
    ...    ELSE    Maximize Window

Clear Cookies and Close Browser
    Delete All Cookies
    Close All Browsers

Elements Must Be Visible
    [Arguments]    ${elements}
    Wait Until Element Is Visible    ${elements[0]}
    :FOR     ${element}    IN    @{elements}
        Element Should Be Visible    ${element}