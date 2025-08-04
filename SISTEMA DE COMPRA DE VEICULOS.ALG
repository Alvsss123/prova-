algoritmo "Sistema de compra de veiculos"
// Professor   : douglas
// Autor(a)    : Henrique
// Data atual  : 04/08/2025

var
   modelos: vetor[1..100] de caractere
   anos: vetor[1..100] de inteiro
   precos: vetor[1..100] de real
   estoques: vetor[1..100] de inteiro
   n, i, opcao, qtdCarros, anoAtual: inteiro
   modeloCompra: caractere
   encontrou: logico
   indiceCarro, qtdComprada: inteiro
   totalCompra, desconto, imposto: real
   carrosComprados: vetor[1..100] de inteiro
   qtdsCompradas: vetor[1..100] de inteiro
   contCompra: inteiro

inicio
   anoAtual <- 2023 // Atualizar conforme o ano atual
   n <- 0
   contCompra <- 0

   repita
      escreval("Bem vindo!")
      escreval("")
      escreval("1 - Cadastrar carro")
       escreval("")
      escreval("2 - Registrar compra")
       escreval("")
      escreval("3 - Listar carros cadastrados")
       escreval("")
      escreval("4 - Listar compras realizadas")
       escreval("")
      escreval("5 - Sair")
      leia(opcao)

      escolha opcao
         caso 1
            se n < 100 entao
               n <- n + 1
               repita
                  escreva("Modelo do carro: ")
                  leia(modelos[n])
               ate modelos[n] <> ""

               repita
                  escreva("Ano do carro (1990-", anoAtual, "): ")
                  leia(anos[n])
               ate (anos[n] >= 1990) e (anos[n] <= anoAtual)

               repita
                  escreva("Preço do carro (minimo de R$10.000): R$")
                  leia(precos[n])
               ate precos[n] >= 10000

               repita
                  escreva("Quantidade em estoque: ")
                  leia(estoques[n])
               ate estoques[n] >= 0

               escreval("Carro cadastrado com sucesso!")
            senao
               escreval("Limite de carros cadastrados atingido!")
            fimse

         caso 2
            se n = 0 entao
               escreval("Nenhum carro cadastrado ainda!")
            senao
               totalCompra <- 0
               desconto <- 0
               imposto <- 0
               qtdCarros <- 0
               contCompra <- contCompra + 1

               repita
                  escreval("Carros disponíveis:")
                  para i de 1 ate n faca
                     escreval(i, " - ", modelos[i], " (", anos[i], ") - R$", precos[i]:0:2, " - Estoque: ", estoques[i])
                  fimpara

                  escreva("Digite o número do carro (0 para finalizar): ")
                  leia(indiceCarro)

                  se (indiceCarro > 0) e (indiceCarro <= n) entao
                     escreva("Quantidade desejada (estoque: ", estoques[indiceCarro], "): ")
                     leia(qtdComprada)

                     se (qtdComprada > 0) e (qtdComprada <= estoques[indiceCarro]) entao
                        carrosComprados[contCompra] <- indiceCarro
                        qtdsCompradas[contCompra] <- qtdComprada

                        totalCompra <- totalCompra + (precos[indiceCarro] * qtdComprada)
                        qtdCarros <- qtdCarros + qtdComprada
                        estoques[indiceCarro] <- estoques[indiceCarro] - qtdComprada
                        escreval("Adicionado ao carrinho!")
                     senao
                        escreval("Quantidade inválida ou indisponível!")
                     fimse
                  senao se indiceCarro <> 0 entao
                     escreval("Número de carro inválido!")
                  fimse
               ate indiceCarro = 0

               se qtdCarros > 0 entao
                  // Aplicar descontos
                  se qtdCarros > 2 entao
                     desconto <- totalCompra * 0.05
                     escreval("Desconto por quantidade (5%): R$", desconto:0:2)
                  fimse

                  // Verificar desconto por ano (10% para carros com ano anterior)
                  para i de 1 ate contCompra faca
                     se anos[carrosComprados[i]] < anoAtual entao
                        desconto <- desconto + (precos[carrosComprados[i]] * qtdsCompradas[i] * 0.10)
                     fimse
                  fimpara
                  escreval("Desconto adicional por ano (10%): R$", desconto:0:2)

                  totalCompra <- totalCompra - desconto

                  // Aplicar imposto de luxo se total > R$100.000
                  se totalCompra > 100000 entao
                     imposto <- totalCompra * 0.08
                     escreval("Imposto de luxo (8%): R$", imposto:0:2)
                     totalCompra <- totalCompra + imposto
                  fimse

                  escreval("Total da compra: R$", totalCompra:0:2)
                  escreval("Compra registrada com sucesso!")
               senao
                  escreval("Nenhum carro foi comprado.")
                  contCompra <- contCompra - 1
               fimse
            fimse

         caso 3
            se n = 0 entao
               escreval("Nenhum carro cadastrado ainda!")
            senao
               escreval("Lista de carros cadastrados:")
               escreval("Nº | Modelo       | Ano  | Preço      | Estoque")
               escreval("----------------------------------------------")
               para i de 1 ate n faca
                  escreva(i:2, " | ", modelos[i])
                  // Ajuste para alinhamento
                  se compr(modelos[i]) < 8 entao
                     escreva("       ")
                  senao se compr(modelos[i]) < 12 entao
                     escreva("    ")
                  senao
                     escreva(" ")
                  fimse
                  escreval(" | ", anos[i], " | R$", precos[i]:8:2, " | ", estoques[i])
               fimpara
            fimse

         caso 4
            se contCompra = 0 entao
               escreval("Nenhuma compra registrada ainda!")
            senao
               escreval("Histórico de compras:")
               para i de 1 ate contCompra faca
                  escreval("Compra ", i, ":")
                  escreval("Carro: ", modelos[carrosComprados[i]], " - Quantidade: ", qtdsCompradas[i])
               fimpara
            fimse

         caso 5
            escreval("Saindo do sistema...")

         outrocaso
            escreval("Opção inválida!")
      fimescolha
   ate opcao = 5
fimalgoritmo