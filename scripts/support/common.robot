***Settings***
import SeleniumLibrary

***Keywords***
Start Browser
    Open Browser 	about:blank 	${BROWSER}
    ${isHeadless}    Run Keyword and Return Status    Should Contain    ${BROWSER}    isHeadless
    Run Keyword If    ${isHeadless}    Set Window Size    1366    768
    ...    ELSE    Maximize Window

Clear Cookies and Close Browser
    Delete All Cookies
    Close All Browsers