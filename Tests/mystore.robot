*** Settings ***

Resource        ../resources/base.robot

Test Setup      Abrir Navegador
Test Teardown   Fechar Navegador

*** Variables ***

*** Keywords ***

*** Test Cases ***
Cenário A: Criar uma conta no site
    [tags]          Cadastro
    Dado que o Usuário acessa a tela de Login
    Quando o usuário cadastra novo e-mail
    E o usuário preenche os dados cadastrais obrigatórios
    Então o usuário será direcionado para a tela de My Account

Cenário B: Realizar uma compra de dois vestidos na loja
    [tags]          Compra
    Dado que o Usuário acessa a tela de Login
    Quando o usuário loga com uma conta existente
    E Realiza a compra de 2 vestidos
    Então os 2 vestidos serão exibidos no Histórico de pedidos
     