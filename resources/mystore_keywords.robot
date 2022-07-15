*** Settings ***
Resource    base.robot

*** Keywords ***
#CENÁRIO A
Dado que o Usuário acessa a tela de Login
    Click Element                       xpath=//a[@class="login"]

Quando o usuário cadastra novo e-mail
    ${NOME}=                            FakerLibrary.FirstName
    ${SOBRENOME}=                       FakerLibrary.LastName
    ${EMAIL}=                           Set Variable                                ${NOME}.${SOBRENOME}@orbia.ag
    Input Text                          id=email_create                             ${EMAIL}
    Click Element                       id=SubmitCreate
    Set Global Variable                 ${EMAIL}
    Set Global Variable                 ${NOME}
    Set Global Variable                 ${SOBRENOME}

E o usuário preenche os dados cadastrais obrigatórios
    Wait Until Element Is Enabled       id=id_gender1                               5
    ${SENHA}=                           FakerLibrary.Password                       length=5
    Set Global Variable                 ${SENHA}     
    Select Radio Button                 id_gender                                   1
    Radio Button Should Be Set To       id_gender                                   1
    Input Text                          id=customer_firstname                       ${NOME}
    Input Text                          id=customer_lastname                        ${SOBRENOME}
    Input Text                          id=passwd                                   ${SENHA}
    Element Attribute Value Should Be   id=email                                    value                       ${EMAIL}
    Select From List By Value           id=days                                     9
    Select From List By Value           id=months                                   3
    Select From List By Value           id=years                                    1987
    Select Checkbox                     id=newsletter
    Checkbox Should Be Selected         id=newsletter
    Input Text                          id=address1                                 3708 Las Vegas Blvd
    Input Text                          id=city                                     Las Vegas
    Wait Until Element Is Enabled       id=id_state 
    Select From List By Value           id=id_state                                 28
    Input Text                          id=postcode                                 89109
    Input Text                          id=phone_mobile                             (11)95947-0039
    Capture Page Screenshot
    Click Element                       id=submitAccount
        
Então o usuário será direcionado para a tela de My Account   
    Wait until Page Contains            My personal information                      5
    Capture Page Screenshot
   
 #Teste 2
Quando o usuário loga com uma conta existente
    ${cadastro}                         Run Keyword And Return Status               Variable Should Not Exist    ${SENHA}
    Run Keyword If                      '${cadastro}'=='True'                       Criacao de conta
    Login

E Realiza a compra de 2 vestidos  
    Click Element                       xpath=//div[@id="block_top_menu"]/ul/li/a[@title="Dresses"]
    Click Element                       xpath=//ul[@class="tree dynamized"]/li/a[contains(.,"Evening Dresses")]
    Wait Until Page Contains            Catalog
    Capture Page Screenshot
#Seleciona o primeiro vestidos
    Click Element                       xpath=//div[@class="product-image-container"]//img
    Wait Until Element Is Visible       xpath=//div[@id="short_description_content"]/p
    Select From List By Value           id=group_1                                     2
    Click Element                       xpath=//a[@id="color_7"]
    Click Element                       xpath=//button[@class="exclusive"]
    Wait until Page Contains            There is 1 item in your cart.
    Wait Until Element Is Visible       xpath=//span[@class="continue btn btn-default button exclusive-medium"]                      
    Click Element                       xpath=//span[@class="continue btn btn-default button exclusive-medium"]
    Click Element                       xpath=//div[@class="breadcrumb clearfix"]/a[@title="Evening Dresses"]
#Seleciona o segundo vestido
    Click Element                       xpath=//div[@class="product-image-container"]//img
    Wait Until Element Is Visible       xpath=//div[@id="short_description_content"]/p
    Select From List By Value           id=group_1                                     3
    Click Element                       xpath=//a[@id="color_24"]
    Click Element                       Xpath=//button[@class="exclusive"]
    Wait until Page Contains            There are 2 items in your cart.
    Wait Until Element Is Enabled       xpath=//span[contains(.,'Proceed to checkout')]                                 
    Click Element                       xpath=//span[contains(.,'Proceed to checkout')]                                 
    Checkout

Então os 2 vestidos serão exibidos no Histórico de pedidos
    ${data}=                            Get Current Date                            result_format=%m/%d/%Y
    Wait until Page Contains            Here are the orders you've placed since your account was created.
    Element Text Should Be              xpath=//td[@class="history_date bold"]      ${data}
    Element Text Should Be              xpath=//span[contains(.,"On backorder")]    On backorder
    Element Text Should Be              xpath=//td[@class="history_method"]         Payment by check
    Capture Page Screenshot
    
#Auxiliar
Criacao de conta
    Quando o usuário cadastra novo e-mail
    E o usuário preenche os dados cadastrais obrigatórios
    Então o usuário será direcionado para a tela de My Account
    Click Element                       xpath=//a[contains(.,'Sign out')]

Login   
    Input Text                          id=email                                    ${EMAIL}
    Input Text                          id=passwd                                   ${SENHA}
    Click Element                       id=SubmitLogin
    Wait until Page Contains            Dresses                                     5    
    
Checkout
    Wait until Page Contains            Your shopping cart contains:
    Click Element                       xpath=//p[@class="cart_navigation clearfix"]//span[contains(.,"Proceed to checkout")]
    Wait Until Element Is Visible       //h1[text()="Addresses"]
    Click Element                       xpath=//p/button/span[text()="Proceed to checkout"]
    Wait Until Element Is Visible       xpath=//h1[text()="Shipping"]
    Checkbox
    Click Element                       xpath=//p/button//span[contains(.,"Proceed to checkout")]
    Wait Until Element Is Visible       xpath=//h1[text()="Please choose your payment method"]
    Click Element                       xpath=//a[contains(.,'Pay by check')]
    Wait Until Element Is Visible       xpath=//h3[contains(.,'Check payment')]
    Click Element                       xpath=//p/button//span[contains(.,"I confirm my order")]
    Wait Until Element Is Visible       xpath=//p[contains(.,"Your order on My Store is complete.")]
    Capture Page Screenshot
    Click Element                       xpath=//a[contains(.,"Back to orders")]

Checkbox
    Click Element                       xpath=//a[@class="iframe"]
    Wait Until Element Is Enabled       xpath=//a[@title="Close"]
    Capture Page Screenshot
    Click Element                       xpath=//a[@title="Close"]
    Wait Until Element Is Visible       xpath=//h1[text()="Shipping"]
    Select Checkbox                     id=cgv
    Checkbox Should Be Selected         id=cgv