#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h> // Para sleep()

#define TEXTO "Bem-vindo ao sistema. O que você deseja fazer?"

// ==== CADASTRO E LOGIN ====

void realizarCadastro() {
    char nome[50], sobre[50], email[100], senha[20];
    long int rg;
    int dia, mes, ano, resp;

    do {
        printf("Digite seu nome completo:\n");
        scanf("%s %s", nome, sobre);

        printf("Digite seu RG:\n");
        scanf("%ld", &rg);

        printf("Digite sua data de nascimento (DD MM AAAA):\n");
        scanf("%d %d %d", &dia, &mes, &ano);

        printf("Digite seu e-mail:\n");
        scanf("%s", email);

        printf("Digite sua senha:\n");
        scanf("%s", senha);

        do {
            printf("\n===== DADOS INFORMADOS =====\n");
            printf("Nome: %s %s\n", nome, sobre);
            printf("RG: %ld\n", rg);
            printf("Data de nascimento: %02d/%02d/%d\n", dia, mes, ano);
            printf("E-mail: %s\n", email);
            printf("Os dados informados estão corretos?\n1. Sim\n2. Não\n");
            scanf("%d", &resp);

            if (resp == 2) {
                int opcao;
                printf("\nO que deseja corrigir?\n");
                printf("1 - Nome\n2 - RG\n3 - Data de nascimento\n4 - E-mail\n5 - Senha\n6 - Nada, continuar\n");
                scanf("%d", &opcao);
                switch (opcao) {
                    case 1:
                        printf("Digite seu nome completo novamente:\n");
                        scanf("%s %s", nome, sobre);
                        break;
                    case 2:
                        printf("Digite seu RG novamente:\n");
                        scanf("%ld", &rg);
                        break;
                    case 3:
                        printf("Digite sua data de nascimento novamente (DD MM AAAA):\n");
                        scanf("%d %d %d", &dia, &mes, &ano);
                        break;
                    case 4:
                        printf("Digite seu e-mail novamente:\n");
                        scanf("%s", email);
                        break;
                    case 5:
                        printf("Digite sua senha novamente:\n");
                        scanf("%s", senha);
                        break;
                    case 6:
                        resp = 1;
                        break;
                    default:
                        printf("Opção inválida! Tente novamente.\n");
                }
            }
        } while (resp == 2);

    } while (resp != 1);

    printf("\nCadastro concluído com sucesso!\n");
}

void realizarLogin() {
    char emailLogin[100], senhaLogin[20];
    printf("Digite seu e-mail para login: ");
    scanf("%s", emailLogin);
    printf("Digite sua senha para login: ");
    scanf("%s", senhaLogin);

    printf("\nVocê fez login com sucesso!\n");
    printf("E-mail: %s\n", emailLogin);
    printf("Senha: %s\n", senhaLogin);
}

// ==== CONSULTA DE PRODUTOS ====

void consultarProdutos() {
    int quantidadeProdutos, cont, idFiltrado;
    int tipoPesquisa;
    char sugerir;
    int idPedido[] = {1,2,3,5,7};
    bool laudo[]={1,0,0,1,1};
    quantidadeProdutos=5;
    cont=0;
    
    printf("Pelo que deseja filtrar? \n1- Todos os produtos\n2- Produtos pelo id\n3- Produtos que precisam de laudo\n4- Produtos que não precisam de laudo\n   Escreva: ");
    scanf("%d", &tipoPesquisa);
    printf("-------------------------------------------------------------\n");
    if(tipoPesquisa==1){
        //pesquisa por todos os produtos
        while(cont<quantidadeProdutos){
            if(laudo[cont]==0){
                printf(" -O produto do id: %d, NÃO precisa de prescricao para ser comprado \n", idPedido[cont]);
            }
            else if(laudo[cont]==1){
                printf(" -O produto do id: %d, PRECISA de prescricao para ser comprado \n", idPedido[cont]);
            }
            else{
                printf("\033[1;31m -Ocorreu um erro com o produto %d, contate o adm da aplicação\033[0m\n", idPedido[cont]);
            }
            cont++;
        }
    }
    else if(tipoPesquisa==2){
        //pesquisa pelo id do produto
        printf("Id que deseja filtrar: \n");
        scanf("%d", &idFiltrado);
        while(cont<quantidadeProdutos){
            if(idPedido[cont]==idFiltrado){
                if(laudo[cont]==0){
                    printf(" -O produto do id: %d, NÃO precisa de prescricao para ser comprado\n", idPedido[cont]);
                }
                else if(laudo[cont]==1){
                    printf(" -O produto do id: %d, PRECISA de prescricao para ser comprado \n", idPedido[cont]);
                }
                else{
                    printf("\033[1;31m -Ocorreu um erro com o produto %d, contate o adm da aplicação\033[0m\n", idPedido[cont]);
                }
            }
            cont++;
        }
    }
    else if(tipoPesquisa==3){
        //pesquisa por produtos que precisam de laudo
        while(cont<quantidadeProdutos){
            if(laudo[cont]==1){
                printf(" -O produto do id: %d, PRECISA de prescricao para ser comprado\n", idPedido[cont]);
            }
            else if(laudo[cont]==0){
                
            }
            else{
                printf("\033[1;31m -Ocorreu um erro, contate o adm da aplicação\033[0m\n");
            }    
            cont++;
        }
    }
    else if(tipoPesquisa==4){
        //pesquisa por produtos que nao precisam de laudo
        while(cont<quantidadeProdutos){
            if(laudo[cont]==0){
                printf(" -O produto do id: %d, NÃO precisa de prescricao para ser comprado\n", idPedido[cont]);
            }
            else if(laudo[cont]==1){
                
            }
            else{
                printf("\033[1;31m -Ocorreu um erro, contate o adm da aplicação\033[0m\n");
            }
            cont++;
        }
    }
    else{
        printf("Desculpa, a aplicação não atende a essa funcão.\n");
    }


}

// ==== RASTREAMENTO ====

void rastrearEntrega() {
    int idPedido[] = {1, 2, 3, 5, 7};
    bool chegou[] = {1, 0, 0, 1, 1};
    int quantidadeProdutos = 5;
    int idFiltrado, posicao = -1;

    printf("Id que deseja filtrar: ");
    scanf("%d", &idFiltrado);

    for (int i = 0; i < quantidadeProdutos; i++) {
        if (idPedido[i] == idFiltrado) {
            posicao = i;
            break;
        }
    }

    if (posicao == -1) {
        printf("Produto não encontrado!\n");
        return;
    }

    while (1) {
        if (chegou[posicao]) {
            printf("O produto %d chegou \a \a\n", idPedido[posicao]);
            break;
        } else {
            printf("O produto está a caminho...\n");
            sleep(3);
            chegou[posicao] = 1; // Simula que o produto chegou após um ciclo
        }
    }
}

// ==== MAIN ====

int main() {
    int opcaoLoginCadastro;

    printf("%s\n", TEXTO);
    printf("Escolha uma opção:\n1 - Login\n2 - Cadastro\n");
    scanf("%d", &opcaoLoginCadastro);

    if (opcaoLoginCadastro == 1) {
        realizarLogin();
    } else if (opcaoLoginCadastro == 2) {
        realizarCadastro();
    } else {
        printf("Opção inválida. Tente novamente.\n");
    }

    printf("\n--- Menu de funcionalidades ---\n");
    printf("1 - Consultar produtos\n2 - Rastrear pedido\nDigite: ");
    int escolha;
    scanf("%d", &escolha);

    if (escolha == 1) {
        consultarProdutos();
    } else if (escolha == 2) {
        rastrearEntrega();
    } else {
        printf("Opção inválida.\n");
    }

    return 0;
}
