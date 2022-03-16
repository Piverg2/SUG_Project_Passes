*** Settings ***
Library  SeleniumLibrary
Variables  ../WebElements.py

*** Variables ***
${email}  gpiver@gmail.com
${password}  Sugtest123!

*** Keywords ***

Input Email and Password and Login

    [arguments]  ${My_Account}
    Input Text  ${LoginPageEmailElement}  ${email}
    Input Text  ${LoginPagePasswordElement}  ${password}
    Click Element  ${LoginPageLoginButtonElement}
    Sleep  4s
    Element Should Contain  ${LoginPageAccountIconElement}  ${My_Account}


Correct Email and Incorrect Password

    [documentation]  This test attempts to login with incorrect password.
    ...  It passes the page contains the error message
    [arguments]  ${wrong_password}  ${My_Account}
    Input Text  ${LoginPageEmailElement}  ${email}
    Input Text  ${LoginPagePasswordElement}  ${wrong_password}
    Click Element  ${LoginPageLoginButtonElement}
    Sleep  5s
    Wait Until Page Contains  You did not enter a valid email and password.
    Element Should Not Contain  ${LoginPageAccountIconElement}  ${My_Account}


Incorrect Email and Correct Password

    [documentation]  This test attempts to login with incorrect email.
    ...  It passes if the page contains the error message
    [arguments]  ${wrong_email}  ${My_Account}
    Input Text  ${LoginPageEmailElement}  ${wrong_email}
    Input Text  ${LoginPagePasswordElement}  ${password}
    Click Element  ${LoginPageLoginButtonElement}
    Sleep  5s
    Wait Until Page Contains  You did not enter a valid email and password.
    Element Should Not Contain  ${LoginPageAccountIconElement}  ${My_Account}


Incorrect Email Format and Correct Password
    [documentation]  This test attempts to login with wrong email format.
    ...  It passes
    [arguments]  ${wrong_emailformat}  ${My_Account}
    Input Text  ${LoginPageEmailElement}  ${wrong_emailformat}
    Input Text  ${LoginPagePasswordElement}  ${password}
    Click Element  ${LoginPageLoginButtonElement}
    Element Should Not Contain  ${LoginPageEmailElement}  @
    Element Should Not Contain  ${LoginPageAccountIconElement}  ${My_Account}

Correct Email but no Password
    [documentation]  This test attempts to login with no password.
    ...  It passes if the popup appears
    Input Text  ${LoginPageEmailElement}  ${email}
    Click Element  ${LoginPageLoginButtonElement}
    Wait Until Page Contains Element  ${LoginPageErrorPopupElement}
