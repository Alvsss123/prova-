algoritmo "cadastro de usuarios "
// Autor: Henrique
// Data: 23/07/2025
// Objetivo: Sistema de cadastro de usuarios para uma empresa de carros

var
   nome, nome_usuario, senha, email, cpf: caractere
   contem_arroba: logico
   i: inteiro

inicio
   // --- Apresenta??o ---
   escreval("=====================================")
   escreval("    SISTEMA DE CADASTRO DE CARROS     ")
   escreval("=====================================")
   escreval("")

   // --- Entrada de Dados ---
   escreva("Digite seu nome completo: ")
   leia(nome)

   escreva("Digite um nome de usuario: ")
   leia(nome_usuario)

   escreva("Digite sua senha: ")
   leia(senha)

   // --- Validacao do E-mail ---
   contem_arroba <- falso
   enquanto nao contem_arroba faca
      escreva("Digite seu e-mail: ")
      leia(email)

      para i de 1 ate compr(email) faca
         se (copia(email, i, 1) = "@") entao
            contem_arroba <- verdadeiro
         fimse
      fimpara

      se nao contem_arroba entao
         escreval
         escreval("!!! ERRO: E-mail invalido! O e-mail precisa ter o caractere '@'.")
         escreval
      fimse
   fimenquanto

   // --- Valida??o do CPF ---

   enquanto (compr(cpf) <> 11) faca
      escreva("Digite seu CPF (apenas 11 numeros): ")
      leia(cpf)

      se (compr(cpf) <> 11) entao
         escreval
         escreval("!!! ERRO: CPF invalido! O CPF precisa ter EXATAMENTE 11 numeros.")
         escreval
      fimse
   fimenquanto

   // Limpa a tela para mostrar o resultado final
   limpatela

   // --- Exibi??o dos Dados Cadastrados ---
   escreval("  CADASTRO REALIZADO COM SUCESSO!  ")
   escreval("Nome: ", nome)
   escreval("Nome de Usuario: ", nome_usuario)
   escreval("Senha: ", senha)
   escreval("E-mail: ", email)
   escreval("CPF: ", cpf)
fimalgoritmo