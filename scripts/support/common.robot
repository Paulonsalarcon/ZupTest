*** Settings ***
Library    SeleniumLibrary    timeout=30

*** Keywords ***
Start Browser
    Open Browser 	about:blank 	${BROWSER}
    ${isHeadless}    Run Keyword and Return Status    Should Contain    ${BROWSER}    headless
    Run Keyword If    ${isHeadless}    Set Window Size    1366    768
    ...    ELSE    Maximize Browser Window

Clear Cookies and Close Browser
    Delete All Cookies
    Close All Browsers

Elements Must Be Visible
    [Arguments]    ${elements}
    Wait Until Element Is Visible    ${elements[0]}
    FOR     ${element}    IN    @{elements}
        Element Should Be Visible    ${element}
    END

Wait And Input Text
    [Arguments]    ${element}    ${text}    ${timeout}=15
    Wait Until Element is Visible    ${element}    ${timeout}
    Input Text    ${element}    ${text}

Wait And Click Element
    [Arguments]    ${element}    ${timeout}=15
    Wait Until Element is Visible    ${element}    ${timeout}
    Click Element    ${element}

Wait and Get Text
    [Arguments]    ${element}    ${timeout}=15
    Wait Until Element is Visible    ${element}    ${timeout}
    ${text}    Get Text    ${element}
    [Return]    ${text}