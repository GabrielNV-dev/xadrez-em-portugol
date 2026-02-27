algoritmo "semnome"

var

tabuleiro: vetor[1..8, 1..8] de literal
pecas_pretas: vetor[1..9] de literal
pecas_brancas: vetor[1..9] de literal
x,y,Dx,Dy,pass,c,f: inteiro

inicio

pecas_pretas[1] <- "t"
pecas_pretas[2] <- "c"
pecas_pretas[3] <- "b<"
pecas_pretas[4] <- "d"
pecas_pretas[5] <- "r"
pecas_pretas[6] <- ">b"
pecas_pretas[7] <- "c"
pecas_pretas[8] <- "t"
pecas_pretas[9] <- "p"

pecas_brancas[1] <- " T "
pecas_brancas[2] <- " C "
pecas_brancas[3] <- "B< "
pecas_brancas[4] <- " D "
pecas_brancas[5] <- " R "
pecas_brancas[6] <- " >B"
pecas_brancas[7] <- " C "
pecas_brancas[8] <- " T "
pecas_brancas[9] <- " P "

procedimento verTabuleiro()
// Esta função nos permite visualizar o tabuleiro
inicio
escreval("     1     2     3     4     5     6     7     8")
escreva("     |     |     |     |     |     |     |     |")

para x de 1 ate 8 faca
   escreval()
   escreva(x,"-")
   para y de 1 ate 8 faca

      para c de 1 ate 9 faca
         se tabuleiro[x,y] = "b<" entao
            f <- 2
         senao
            se tabuleiro[x,y] = ">b" entao
               f <- 3
            senao
               se tabuleiro[x,y] = pecas_pretas[c] entao
                  f <- 1
               fimse
            fimse
         fimse
      fimpara

      se f =2 entao
         escreva("(",tabuleiro[x,y]," ) ")
      fimse
      se f =3 entao
         escreva("( ",tabuleiro[x,y],") ")
      fimse
      se f = 0 entao
         escreva("(",tabuleiro[x,y],") ")
      fimse
      se f = 1 entao
         escreva("( ",tabuleiro[x,y]," ) ")
         f <- 0
      fimse


   fimpara
fimpara
escreval()
fimprocedimento

procedimento Montartabuleiro()
inicio
para x de 1 ate 2 faca // Preto
   para y de 1 ate 8 faca
      se x = 1 entao
         tabuleiro[x,y] <- pecas_pretas[y]
      senao
         tabuleiro[x,y] <- pecas_pretas[9]
      fimse
   fimpara
fimpara

para x de 7 ate 8 faca // Branco
   para y de 1 ate 8 faca
      se x = 8 entao
         tabuleiro[x,y] <- pecas_brancas[y]
      senao
         tabuleiro[x,y] <- pecas_brancas[9]
      fimse
   fimpara
fimpara
fimprocedimento

procedimento peaoP(linha, coluna, destinoL, destinoC,)
// Regras de movimento do peao preto
inicio
f <- 0
se linha = 2 entao
   pass <- 2
senao
   pass <- 1
fimse

limpatela

para c de 1 ate 9 faca
   se tabuleiro[destinoL,destinoC] = pecas_brancas[c] entao
      f <- 1
   fimse
fimpara

se f = 1 entao

   se ((linha+1 = destinoL) e (coluna+1 = destinoC)) ou
      ((linha+1 = destinoL) e (coluna-1 = destinoC)) entao

      escreval("movimento concluido")
      tabuleiro[destinoL,destinoC] <- tabuleiro[linha,coluna]
      tabuleiro[linha,coluna] <- " "
   senao
      escreval("Movimento invalido")
   fimse

senao

   se (destinoL - linha) > 2 e ((destinoL - linha) > pass) ou
      (destinoL < linha) ou
      (coluna <> destinoC) entao

      escreval("Movimento invalido")
   senao
      escreval("movimento concluido")
      tabuleiro[destinoL,destinoC] <- tabuleiro[linha,coluna]
      tabuleiro[linha,coluna] <- " "
   fimse

fimse

verTabuleiro()
fimprocedimento

procedimento peaoB(linha, coluna, destinoL, destinoC,)
// Regras de movimento do peao branco
inicio
f <- 0
se linha = 7 entao
   pass <- 2
senao
   pass <- 1
fimse

limpatela

para c de 1 ate 9 faca
   se tabuleiro[destinoL,destinoC] = pecas_pretas[c] entao
      f <- 1
   fimse
fimpara

se f = 1 entao

   se ((linha-1 = destinoL) e (coluna+1 = destinoC)) ou ((linha-1 = destinoL) e (coluna-1 = destinoC)) entao

      escreval("movimento concluido")
      tabuleiro[destinoL,destinoC] <- tabuleiro[linha,coluna]
      tabuleiro[linha,coluna] <- "   "
   senao
      escreval("Movimento invalido")
   fimse

senao

   se (linha - destinoL) > 2 e ((linha - destinoL) > pass) ou (destinoL > linha) ou (coluna <> destinoC) entao

      escreval("Movimento invalido")
   senao
      escreval("movimento concluido")
      tabuleiro[destinoL,destinoC] <- tabuleiro[linha,coluna]
      tabuleiro[linha,coluna] <- "   "
   fimse

fimse

verTabuleiro()
fimprocedimento

procedimento torreP(linha, coluna, destinoL, destinoC,)
var
pascolunaA, pascolunaP, paslinhaA, paslinhap : inteiro
inicio

f <- 0

para c de 1 ate 9 faca
   se tabuleiro[destinoL,destinoC] = pecas_brancas[c] entao
      f <- 1
   fimse
fimpara

limpatela

para x de 1 ate 8 faca
   se coluna - x < 1 entao
      pascolunaP <- 0
      interrompa
   fimse

   se tabuleiro[linha,coluna - x] <> "   " entao
      pascolunaA  <- (coluna - x)
      interrompa
   fimse
fimpara

para x de 1 ate 8 faca
   se (coluna + x) > 8 entao
      pascolunaP <- 9
      interrompa
   fimse

   se tabuleiro[linha,coluna + x] <> "   " entao
      pascolunaP  <- x+coluna
      interrompa
   fimse
fimpara

para x de 1 ate 8 faca
   se linha - x < 1 entao
      paslinhaA <- 0
      interrompa
   fimse

   se tabuleiro[linha - x,coluna] <> "   " entao
      paslinhaA  <- (linha - x)
      interrompa
   fimse
fimpara

para x de 1 ate 8 faca

   se linha + x > 8 entao
      paslinhaP <- 9
      interrompa
   fimse

   se tabuleiro[linha + x,coluna] <> "   " entao
      paslinhaP  <- (linha + x)
      interrompa
   fimse
fimpara

se f = 0 entao
   se (((linha = destinoL) e (coluna <> destinoC)) ou  ((linha <> destinoL) e (coluna = destinoC))) e ((destinoC > pascolunaA) e (destinoC < pascolunaP) e(destinoL > paslinhaA) e(destinoL < paslinhaP)) entao

      escreval("movimento concluido")
      tabuleiro[destinoL,destinoC] <- tabuleiro[linha,coluna]
      tabuleiro[linha,coluna] <- "   "

   senao
      escreval("Movimento invalido")
   fimse
senao
   se (((linha = destinoL) e (coluna <> destinoC)) ou  ((linha <> destinoL) e (coluna = destinoC))) e ((destinoC >= pascolunaA) e (destinoC <= pascolunaP) e(destinoL >= paslinhaA) e(destinoL <= paslinhaP)) entao

      escreval("movimento concluido")
      tabuleiro[destinoL,destinoC] <- tabuleiro[linha,coluna]
      tabuleiro[linha,coluna] <- "   "

   senao
      escreval("Movimento invalido")
   fimse
fimse
verTabuleiro()
fimprocedimento

procedimento cavaloP(linha, coluna, destinoL, destinoC,)
inicio
limpatela

f <- 0

para c de 1 ate 9 faca
   se tabuleiro[destinoL,destinoC] = pecas_pretas[c] entao
      f <- 1
   fimse
fimpara


se ((((linha-2 = destinoL) e (coluna-1 = destinoC)) ou ((linha-2 = destinoL) e (coluna+1 = destinoC))) ou (((linha+2 = destinoL) e (coluna-1 = destinoC)) ou ((linha+2 = destinoL) e (coluna+1 = destinoC)))) e (f = 0) entao
   escreval("movimento concluido")
   tabuleiro[destinoL,destinoC] <- tabuleiro[linha,coluna]
   tabuleiro[linha,coluna] <- "   "
senao
   se ((((linha-1 = destinoL) e (coluna+2 = destinoC)) ou ((linha+1 = destinoL) e (coluna+2 = destinoC))) ou (((linha-1 = destinoL) e (coluna-2 = destinoC)) ou ((linha+1 = destinoL) e (coluna-2 = destinoC)))) e (f = 0) entao
      escreval("movimento concluido")
      tabuleiro[destinoL,destinoC] <- tabuleiro[linha,coluna]
      tabuleiro[linha,coluna] <- "   "
   senao
      escreval("Movimento invalido")
   fimse
fimse
verTabuleiro()

fimprocedimento

procedimento cavaloB(linha, coluna, destinoL, destinoC,)
inicio
limpatela

f <- 0

para c de 1 ate 9 faca
   se tabuleiro[destinoL,destinoC] = pecas_brancas[c] entao
      f <- 1
   fimse
fimpara


se ((((linha-2 = destinoL) e (coluna-1 = destinoC)) ou ((linha-2 = destinoL) e (coluna+1 = destinoC))) ou (((linha+2 = destinoL) e (coluna-1 = destinoC)) ou ((linha+2 = destinoL) e (coluna+1 = destinoC)))) e (f = 0) entao
   escreval("movimento concluido")
   tabuleiro[destinoL,destinoC] <- tabuleiro[linha,coluna]
   tabuleiro[linha,coluna] <- "   "
senao
   se ((((linha-1 = destinoL) e (coluna+2 = destinoC)) ou ((linha+1 = destinoL) e (coluna+2 = destinoC))) ou (((linha-1 = destinoL) e (coluna-2 = destinoC)) ou ((linha+1 = destinoL) e (coluna-2 = destinoC)))) e (f = 0) entao
      escreval("movimento concluido")
      tabuleiro[destinoL,destinoC] <- tabuleiro[linha,coluna]
      tabuleiro[linha,coluna] <- "   "
   senao
      escreval("Movimento invalido")
   fimse
fimse
verTabuleiro()

fimprocedimento


procedimento bispoB(linha, coluna, destinoL, destinoC,)
var
verf, passCP, passCA, passLA, passLP : inteiro

inicio

verf <- 0

para c de 1 ate 8 faca

   se ((coluna-c) = destinoC) e ((linha-c) = destinoL) entao
      verf <- 1
   fimse

   se ((coluna+c) = destinoC) e ((linha+c) = destinoL) entao
      verf <- 1
   fimse

   se ((coluna-c) = destinoC) e ((linha+c) = destinoL) entao
      verf <- 1
   fimse

   se ((coluna+c) = destinoC) e ((linha-c) = destinoL) entao
      verf <- 1
   fimse

   se verf = 1 entao
      interrompa
   fimse
fimpara

para c de 1 ate 8 faca
   se (coluna - c < 1) ou (linha-c < 1) entao
      passCA <- 0
      interrompa
   fimse

   se tabuleiro[linha-c,coluna-c] <> "   " entao
      passCA <- (coluna - c) - 1
      interrompa
   fimse
fimpara

para c de 1 ate 8 faca
   se (coluna + c > 8) ou (linha - c < 1) entao
      passCP <- 8
      interrompa
   fimse

   se tabuleiro[linha-c,coluna+c] <> "   " entao
      passCP <- (coluna + c)  1
      interrompa
   fimse
fimpara
//maior que passCA

para c de 1 ate 9 faca
   se tabuleiro[destinoL,destinoC] = pecas_brancas[c] entao
      verf <- 0
   fimse
fimpara

se (linha = destinoL) e (coluna = destinoC) entao
   verf <- 0
fimse
limpatela

escreva(destinoL)
escreval(passLA)

se (verf = 1) e ((destinoC > passCA)e (destinoC <= passCP)) entao

   escreval("movimento concluido")
   tabuleiro[destinoL,destinoC] <- tabuleiro[linha,coluna]
   tabuleiro[linha,coluna] <- "   "

senao
   escreval("Movimento invalido")
fimse

vertabuleiro()

fimprocedimento


procedimento torreB(linha, coluna, destinoL, destinoC,)
var
pascolunaA, pascolunaP, paslinhaA, paslinhap : inteiro
inicio

f <- 0

para c de 1 ate 9 faca
   se tabuleiro[destinoL,destinoC] = pecas_pretas[c] entao
      f <- 1
   fimse
fimpara

limpatela

para x de 1 ate 8 faca
   se coluna - x < 1 entao
      pascolunaP <- 0
      interrompa
   fimse

   se tabuleiro[linha,coluna - x] <> "   " entao
      pascolunaA  <- (coluna - x)
      interrompa
   fimse
fimpara

para x de 1 ate 8 faca
   se (coluna + x) > 8 entao
      pascolunaP <- 9
      interrompa
   fimse

   se tabuleiro[linha,coluna + x] <> "   " entao
      pascolunaP  <- x+coluna
      interrompa
   fimse
fimpara

para x de 1 ate 8 faca
   se linha - x < 1 entao
      paslinhaA <- 0
      interrompa
   fimse

   se tabuleiro[linha - x,coluna] <> "   " entao
      paslinhaA  <- (linha - x)
      interrompa
   fimse
fimpara

para x de 1 ate 8 faca

   se linha + x > 8 entao
      paslinhaP <- 9
      interrompa
   fimse

   se tabuleiro[linha + x,coluna] <> "   " entao
      paslinhaP  <- (linha + x)
      interrompa
   fimse
fimpara



se f = 0 entao
   se (((linha = destinoL) e (coluna <> destinoC)) ou  ((linha <> destinoL) e (coluna = destinoC))) e ((destinoC > pascolunaA) e (destinoC < pascolunaP) e(destinoL > paslinhaA) e(destinoL < paslinhaP)) entao

      escreval("movimento concluido")
      tabuleiro[destinoL,destinoC] <- tabuleiro[linha,coluna]
      tabuleiro[linha,coluna] <- "   "

   senao
      escreval("Movimento invalido")
   fimse
senao
   se (((linha = destinoL) e (coluna <> destinoC)) ou  ((linha <> destinoL) e (coluna = destinoC))) e ((destinoC >= pascolunaA) e (destinoC <= pascolunaP) e(destinoL >= paslinhaA) e(destinoL <= paslinhaP)) entao

      escreval("movimento concluido")
      tabuleiro[destinoL,destinoC] <- tabuleiro[linha,coluna]
      tabuleiro[linha,coluna] <- "   "

   senao
      escreval("Movimento invalido")
   fimse
fimse
verTabuleiro()
fimprocedimento


// Dá valor nulo (branco) para todas as casas
para x de 1 ate 8 faca
   para y de 1 ate 8 faca
      tabuleiro[x,y] <- "   "
   fimpara
fimpara

Montartabuleiro()
verTabuleiro()

para c de 1 ate 100000 faca

   repita
      escreval("Linha da peça que deseja mexer")
      leia(x)
      escreval("Coluna da peça que deseja mexer")
      leia(y)
      escreval("Linha que deseja jogar a peça")
      leia(Dx)
      escreval("Coluna que deseja jogar a peça")
      leia(Dy)
      se ((x < 0) e (x > 9)) e ((y < 0) e (y > 9)) e ((Dy < 0) e (Dy > 9)) e ((Dx < 0) e (Dx > 9)) entao
         escreval("cordenadas invalidas")
      fimse
   ate ((x > 0) e (x < 9)) e ((y > 0) e (y < 9)) e ((Dy > 0) e (Dy < 9)) e ((Dx > 0) e (Dx < 9))

   se tabuleiro[x,y] = " P " entao
      peaoB(x,y,Dx,Dy)
   senao
      se tabuleiro[x,y] = " T " entao
         torreB(x,y,Dx,Dy)
      senao
         se tabuleiro[x,y] = "t" entao
            torreP(x,y,Dx,Dy)
         senao
            se tabuleiro[x,y] = " C " entao
               cavaloB(x,y,Dx,Dy)
            senao
               se tabuleiro[x,y] = "c" entao
                  cavaloP(x,y,Dx,Dy)
               senao
                  se tabuleiro[x,y] = "b< " entao
                     bispoB(x,y,Dx,Dy)
                  senao
                     se tabuleiro[x,y] = " >b" entao
                        peaoB(x,y,Dx,Dy)
                     fimse
                  fimse
               fimse
            fimse
         fimse
      fimse
   fimse
fimpara

fimalgoritmo
