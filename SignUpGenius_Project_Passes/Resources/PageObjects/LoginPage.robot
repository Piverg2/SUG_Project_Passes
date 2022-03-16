*** Settings ***
Library  SeleniumLibrary
Variables  ../WebElements.py

*** Variables ***
${email}  gpiver@gmail.com
${password}  Sugtest123!
${Login_URL}  https://www.signupgenius.com/index.cfm?go=c.Login

*** Keywords ***

Input Email and Password and Login

    Input Text  ${LoginPageEmailElement}  ${email}
    Input Text  ${LoginPagePasswordElement}  ${password}
    Click Element  ${LoginPageLoginButtonElement}
    Wait Until Location Is Not  ${Login_URL}


Correct Email and Incorrect Password

    [documentation]  This test attempts to login with incorrect password.
    ...  It passes the page contains the error message
    [arguments]  ${wrong_password}
    Input Text  ${LoginPageEmailElement}  ${email}
    Input Text  ${LoginPagePasswordElement}  ${wrong_password}
    Click Element  ${LoginPageLoginButtonElement}
    Sleep  5s
    Wait Until Page Contains  You did not enter a valid email and password.


Incorrect Email and Correct Password

    [documentation]  This test attempts to login with incorrect email.
    ...  It passes if the page contains the error message
    [arguments]  ${wrong_email}
    Input Text  ${LoginPageEmailElement}  ${wrong_email}
    Input Text  ${LoginPagePasswordElement}  ${password}
    Click Element  ${LoginPageLoginButtonElement}
    Sleep  5s
    Wait Until Page Contains  You did not enter a valid email and password.


Incorrect Email Format and Correct Password
    [documentation]  This test attempts to login with wrong email format.
    ...  It passes
    [arguments]  ${wrong_emailformat}
    Input Text  ${LoginPageEmailElement}  ${wrong_emailformat}
    Input Text  ${LoginPagePasswordElement}  ${password}
    Click Element  ${LoginPageLoginButtonElement}
    Wait Until Element Does Not Contain  ${LoginPageEmailElement}  @


Correct Email but no Password
    [documentation]  This test attempts to login with no password.
    ...  It passes if the popup appears
    Input Text  ${LoginPageEmailElement}  ${email}
    Click Element  ${LoginPageLoginButtonElement}
    Wait Until Page Contains Element  ${LoginPageErrorPopupElement}