
*** Settings ***

Library  SeleniumLibrary
Documentation   Suite description

*** Variables ***


${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en

${BROWSER}        Chrome

${LOGIN INPUT}       //*[@id='login']

${PASSWORD INPUT}        //*[@id="password"]

${SIGNIN BUTTON}     //div/button/span

${SIGNOUT BUTTON}    //*[@id="__next"]/div[1]/div/div/div/ul[2]/div[2]/div[2]/span

${ADD A PLAYER BUTTON}    //*/div/a/button

${PAGE LOGO}     //*[@id="__next"]/form/div/div[1]/h5

${MAIN PAGE LOGO}     //*[@id="__next"]/div[1]/header/div/h6

${LEG DROPDOWN}     //*[@id="mui-component-select-leg"]

${RIGHT LEG SELECT}      //*[@id="menu-leg"]/div[3]/ul/li[1]

${ADD PLAYER LOGO}       //*[@id="__next"]/div[1]/main/div[2]/form/div[1]/div/span

${ADD PLAYER NAME}        //*/div[2]/div/div/input

${ADD PLAYER SURNAME}      //*/div/div[3]/div/div/input

${ADD PLAYER MAIN POSITION}       //*/div/div[11]/div/div/input

${ADD PLAYER AGE}       //*/div/div[7]/div/div/input

${ADD PLAYER SUBMIT BUTTON}       //*/form/div[3]/button[1]/span[1]

${DEV TEAM CONTACT BUTTON}      //div[1]/div/div[3]/a/span[1]

${CLEAR BUTTON}      //*/div[3]/button[2]/span[1]

*** Test Cases ***

Login to the system
    Open login page
    Type In Email
    Type in password
    Click on the submit button
    Assert dashboard
    [Teardown]    Close Browser

Sign Out Of The System
    Open login page
    Type In Email
    Type in password
    Click on the submit button
    Wait Until Element Is Visible   //*[@id="__next"]/div[1]/div/div/div/ul[2]/div[2]/div[2]/span   50
    Click sign out button
    Assert dashboard
    [Teardown]    Close Browser

Leg dropdown
    Open login page
    Type In Email
    Type in password
    Click on the submit button
    Wait Until Element Is Visible   //*/div/a/button    50
    Click on the add a player button
    Wait Until Element Is Visible   //*[@id="mui-component-select-leg"]     10
    Click on the leg drodpown
    Click on the right leg button
    Assert add a player page
    [Teardown]    Close Browser

Add a player form
    Open login page
    Type In Email
    Type in password
    Click on the submit button
    Wait Until Element Is Visible   //*/div/a/button    50
    Click on the add a player button
    Type In Name
    Type In Surname
    Type In Main Position
    Type In Age
    Click on The Add Player Submit Button
    Assert add a player page
    [Teardown]    Close Browser

Contact button
    Open login page
    Type In Email
    Type in password
    Click on the submit button
    Wait Until Element Is Visible   //div[1]/div/div[3]/a/span[1]    10
    [Teardown]    Close Browser

Clear form
    Open login page
    Type In Email
    Type in password
    Click on the submit button
    Wait Until Element Is Visible   //*/div/a/button    50
    Click on the add a player button
    Type In Name
    Type In Surname
    Type In Main Position
    Type In Age
    Click clear button
    Wait Until Element Is Visible   //*/div[3]/button[2]/span[1]    10
    [Teardown]    Close Browser

*** Keywords ***

Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Scouts panel - sign in
Type in Email
    Input Text  ${LOGIN INPUT}   user05@getnada.com
Type in password
    Input Text  ${PASSWORD INPUT}    Test-1234
Click on the submit button
    Click Element   //div/button/span
Assert dashboard
    Wait Until Element Is Visible   ${PAGE LOGO}
    Title Should Be     Scouts panel - sign in
    Capture Page Screenshot    alert.png
Click sign out button
    Click Element   //*[@id="__next"]/div[1]/div/div/div/ul[2]/div[2]/div[2]/span
Click on the add a player button
    Click Element   //*/div/a/button
Click on the leg drodpown
    Click Element    //*[@id="mui-component-select-leg"]
Click on the right leg button
    Click Element    //*[@id="menu-leg"]/div[3]/ul/li[1]
Assert add a player page
    Wait Until Element Is Visible   ${ADD PLAYER LOGO}
    Title Should Be    Add player
Type In Name
    Input Text  ${ADD PLAYER NAME}  Iksinski
Type In Surname
    Input Text  ${ADD PLAYER SURNAME}   Ygrek
Type In Main Position
    Input Text  ${ADD PLAYER MAIN POSITION}   keeper
Type In Age
    Input Text    ${ADD PLAYER AGE}     12.07.2023
Click on The Add Player Submit Button
    Click Element   //*/form/div[3]/button[1]/span[1]
Assert contact button
    Wait Until Element Is Visible
Click clear button
    Click Element    //*/div[3]/button[2]/span[1]
