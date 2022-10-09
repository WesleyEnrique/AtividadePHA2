#NOME: Wesley Enrique araujo dos santos 
#Turma 4 

*** Settings ***
Documentation    atividades PHA
Library    SeleniumLibrary
Library    Collections


*** Variables ***

&{PESSOA}    nome=wesley    idade=23    rua=marcantonio    cep=89382    numero=10    cidade=sao paulo    bairro=parque america

@{FRUTAS}    \nmorango    banana    abacaxi    jacuticaba    uva    melão    melancia

@{LISTA1}    A    1    B    2    C    3
@{NOVA_LISTA}

*** Test Cases ***
exercico dicionario
    Log To Console    \n${PESSOA.nome}
    Log To Console    ${PESSOA.idade}
    Log To Console    ${PESSOA.rua}
    Log To Console    ${PESSOA.cep}
    Log To Console    ${PESSOA.numero}
    Log To Console    ${PESSOA.cidade}
    Log To Console    ${PESSOA.bairro}

exercico if simples
     exercico argumento e retornos "23" e "2022"

Exercicio For Simples + Lista
    Exiba cada uma das frutas de uma lista usando um For Simples

Exercício If Inline + For in Range
    Crie um loop que conte quantos números par existem entre 0 e 10, usando if inline

Exercício Try + Except + Finally
    adicionar somente os números numa nova lista


*** Keywords ***
exercico argumento e retornos "${NUM_A}" e "${NUM_B}"
    ${idade}    Evaluate    ${NUM_A} - ${NUM_B}    
    IF    ${idade} > 2000
        Log To Console    ${idade}
    ELSE
        Log To Console    \n voce nasceu no seculo passado 
    END


Exiba cada uma das frutas de uma lista usando um For Simples    
    FOR    ${FRUTAS}    IN    @{FRUTAS}
        Log To Console    ${FRUTAS}
        
    END

Crie um loop que conte quantos números par existem entre 0 e 10, usando if inline
   ${NUM1}    Set Variable    ${0}
   ${NUM2}    Set Variable    ${1}
    
    FOR    ${counter}    IN RANGE    0    11    
        IF    ${counter} %2 ==0 
            Log To Console   \n${counter}
            ${NUM1}    Evaluate    ${NUM1}+${NUM2}
        
        END
        
    END
    Log To Console    ${NUM1} numeros pares!

adicionar somente os números numa nova lista

    FOR     ${ELEMENT}   IN    @{LISTA1}
        TRY
            IF    "${ELEMENT}" != "A" and "${ELEMENT}" != "B" and "${ELEMENT}" != "C"
            Append To List    ${NOVA_LISTA}   ${ELEMENT}

            ELSE
                Fail
            END
        EXCEPT
            Log To Console    \nisso é uma letra
        FINALLY
            Log To Console    \nessa é a nova lista: @{NOVA_LISTA}\n
        END


    END