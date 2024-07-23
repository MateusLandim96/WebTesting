*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                    https://www.amazon.com.br/
${MENU_MAIS_VENDIDOS}     //a[contains(.,'Mais Vendidos')]
${LOGO_AMAZON}            nav-logo-sprites
${HEADER_MAIS_VENDIDOS}   zg_banner_text   
${PESQUISAR}              nav-search-submit-button  
${ADD_CARRINHO_BUTTON}    add-to-cart-button
${FECHAR_PEDIDO_BUTTON}   proceedToRetailCheckout 
${EXCLUIR_DO_CARRINHO}    //input[@value='Excluir']
${ACESSAR_CARRINHO}       //a[@href='/cart?ref_=ewc_gtc'][contains(.,'Ir para o carrinho')]



*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window    
    

Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${LOGO_AMAZON}
    Wait Until Element Is Visible    locator=${MENU_MAIS_VENDIDOS}

Entrar no menu "Mais Vendidos"
    Click Element    locator=${MENU_MAIS_VENDIDOS}

Verificar se aparece a frase "Mais vendidos"
    Wait Until Page Contains         text=Mais Vendidos
    Wait Until Element Is Visible    locator=${HEADER_MAIS_VENDIDOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}    

Verificar se aparece a categoria "Computadores e Informática"
    Wait Until Element Is Visible    locator=//a[@href='/gp/bestsellers/computers/ref=zg_bs_nav_computers_0'][contains(.,'Computadores e Informática')]     
       
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa 
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=${PESQUISAR}

Verificar o resultado da pesquisa se está listando o produto '${PRODUTO}'
    Wait Until Element Is Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]
    Wait Until Page Contains         text=Resultados
    Wait Until Page Contains         text=Consulte as páginas dos produtos para ver outras opções de compra.

Adicionar o produto "${PRODUTO}" no carrinho
    Click Element    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]
    Wait Until Element Is Visible    locator=productTitle
    Wait Until Element Is Visible    locator=${ADD_CARRINHO_BUTTON}
    Click Button                     locator=${ADD_CARRINHO_BUTTON}

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Page Contains         text=Adicionado ao carrinho
    Wait Until Element Is Visible    locator=${FECHAR_PEDIDO_BUTTON}
    Wait Until Element Is Visible    locator=//img[@class='sc-product-image']
    Wait Until Element Is Visible    locator=//span[@class='a-button-text a-declarative'][contains(.,'1')]

Remover o produto "${PRODUTO}" do carrinho
    Click Element    locator=${ACESSAR_CARRINHO}
    Wait Until Element Is Visible    locator=//h1[contains(.,'Carrinho de compras')]
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]
    Click Element    locator=${EXCLUIR_DO_CARRINHO}

    
Verificar se o carrinho fica vazio
    Wait Until Page Contains    text=Seu carrinho de compras da Amazon está vazio.
    
    
    
    
    
            
    
