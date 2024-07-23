*** Settings ***

Library     SeleniumLibrary
Resource    ../amazon_resources.robot

*** Keywords ***
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

E existe o produto "Console Xbox Series S" no carrinho
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando acessar o menu "Mais Vendidos"
    Entrar no menu "Mais Vendidos"

Quando pesquisar pelo produto "Console Xbox Series S"
    Digitar o nome de produto "Console Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Quando pesquisar pelo produto "Console Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
    Adicionar o produto "Console Xbox Series S" no carrinho

Quando remover o produto "${PRODUTO}" do carrinho
    Remover o produto "${PRODUTO}" do carrinho
    

Então o título da página deve ficar "${TITULO}"
    Verificar se o título da página fica "${TITULO}"

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio

E o texto "Mais Vendidos" deve ser exibido na página
    Verificar se aparece a frase "Mais Vendidos"    

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

E um produto da linha "${PRODUTO}" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto '${PRODUTO}'

