*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        https://google.com

*** Test Cases ***
Open Website
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Google
    Close Browser

Verify Page Elements
    Open Browser    ${URL}    ${BROWSER}
    Page Should Contain Element    id=header
    Page Should Contain Element    css=.content
    Close Browser

Verify Links
    Open Browser    ${URL}    ${BROWSER}
    Click Link    link=More information...
    Location Should Be    https://www.example.com
    Go Back
    Click Link    partial link=IETF
    Location Should Be    https://www.example.com/1
    Close Browser

Submit Form
    Open Browser    ${URL}    ${BROWSER}
    Input Text    name=firstname    John
    Input Text    name=lastname    Doe
    Click Button    name=submit
    Page Should Contain    Thank you!
    Close Browser

*** Keywords ***
Title Should Be
    [Arguments]    ${expected_title}
    Wait Until Page Contains    ${expected_title}    timeout=10s
    Page Should Contain    ${expected_title}

Verify Page Elements
    Open Example Website
    Page Elements Should Be Visible

Verify Links
    Open Example Website
    Click Link and Verify Location    More information...    https://www.example.com
    Go Back
    Click Link and Verify Location    IETF    https://www.example.com/1

Submit Form
    Open Example Website
    Fill Out and Submit Form    John    Doe

Verify Dropdown
    Open Example Website
    Select Dropdown Option    Option 2

Verify Checkbox
    Open Example Website
    Check Checkbox and Verify Selection

Verify Radio Button
    Open Example Website
    Select Radio Button and Verify Selection

*** Keywords ***
Open Example Website
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Example Domain

Page Elements Should Be Visible
    Page Should Contain Element    id=header
    Page Should Contain Element    css=.content

Click Link and Verify Location
    [Arguments]    ${link_text}    ${expected_location}
    Click Link    ${link_text}
    Location Should Be    ${expected_location}

Fill Out and Submit Form
    [Arguments]    ${first_name}    ${last_name}
    Input Text    name=firstname    ${first_name}
    Input Text    name=lastname    ${last_name}
    Click Button    name=submit
    Page Should Contain    Thank you!

Select Dropdown Option
    [Arguments]    ${option_value}
    Select From List by Value    id=dropdown    ${option_value}
    ${selected_option}=    Get Selected List Value    id=dropdown
    Should Be Equal    ${selected_option}    Option ${option_value}

Check Checkbox and Verify Selection
    Check Checkbox    name=checkbox
    Checkbox Should Be Selected    name=checkbox

Select Radio Button and Verify Selection
    Click Element    css=input[value="female"]
    Radio Button Should Be Set To    css=input[value="female"]