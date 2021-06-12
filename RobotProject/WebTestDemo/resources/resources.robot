*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}      firefox
${URL}          http://automationpractice.com

*** Keywords ***
Open site page
    Open Browser    about:blank   ${BROWSER}

Close site page
    Close Browser

Access home page
    Go To               ${URL}
    Title Should Be     My Store

Search for "${PRODUCT}" on search element
    Input Text          name=search_query    ${PRODUCT}
    Click Element       name=submit_search

Validate search for "${PRODUCT}"
    Wait Until Element Is Visible   css=#center_column > h1
    Title Should Be                 Search - My Store
    Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src='${URL}/img/p/7/7-home_default.jpg']
    Page Should Contain Link        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUCT}")]

Validate error message "${ALERT_MESSAGE}"
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be          xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${ALERT_MESSAGE}