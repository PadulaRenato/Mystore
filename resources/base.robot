*** Settings ***
Library     SeleniumLibrary  # biblioteca do selenium
Library     FakerLibrary            locale=pt_BR
Library     DateTime
Resource    mystore_keywords.robot


*** Keywords ***
Abrir Navegador
    Open Browser        http://www.automationpractice.com/index.php/    chrome
    Maximize Browser Window


Fechar Navegador
    Close Browser