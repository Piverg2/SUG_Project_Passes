*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/PageObjects/LoginPage.robot
Resource  ../../Resources/CommonFunctionality.robot

Test Setup  Start TestCase
Test Teardown  Finish TestCase

*** Test Cases ***
TC Succesfully Log in
    [documentation]  This Login attempt should Pass
    [tags]  Should_Pass

    LoginPage.Input Email and Password and Login  GP

TC Login Fails - Incorrect Password
    [documentation]  This Login attempt should not be successful
    [tags]  Should_Pass

    LoginPage.Correct Email and Incorrect Password  testpassword  GP

TC Login Fails - Incorrect Email and Correct Password
    [documentation]  This Login attempt should not be successful. Incorrect Email
    [tags]  Should_Pass

    LoginPage.Incorrect Email and Correct Password  wrong@gmail.com  GP

TC Login Fails - Incorrect Email Format and Correct Password
    [documentation]  This Login attempt should not be successful. Incorrect email format
    [tags]  Should_Pass

    LoginPAge.Incorrect Email Format and Correct Password  wrongformat  GP

TC No Password
    [documentation]  This Login attempt should not be successful. No password submitted
    [tags]  Should_Pass

    LoginPage.Correct Email but no Password


