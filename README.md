# Desafio programação - para vaga Back-end

Por favor leiam este documento do começo ao fim, com muita atenção.
O intuito deste teste é avaliar seus conhecimentos técnicos com o back-end, para ser mais específico em Ruby.

O teste consiste em parsear [este arquivo de texto (CNAB)](https://github.com/mlalbuquerque/desafio-ruby-backend/blob/master/CNAB.txt) e salvar suas informações (transações financeiras) em uma base de dados a critério do candidato.

Este desafio deve ser feito por você em sua casa. 

# Instruções de entrega do desafio

1. Primeiro, faça um fork deste projeto para sua conta no Github (crie uma se você não possuir).
2. Em seguida, implemente o projeto tal qual descrito abaixo, em seu clone local.
3. Por fim, envie via email um arquivo patch para seu contato na Impulso.

# Descrição do projeto

Você recebeu um arquivo CNAB com os dados das movimentações finanaceira de várias lojas.
Precisamos criar uma maneira para que estes dados sejam importados para um banco de dados.

Sua tarefa é criar uma interface web que aceite upload do [arquivo CNAB](https://github.com/mlalbuquerque/desafio-ruby-backend/blob/master/CNAB.txt), normalize os dados e armazene-os em um banco de dados relacional e exiba essas informações em tela.

**Sua aplicação web DEVE:**

1. Ter uma tela (via um formulário) para fazer o upload do arquivo
2. Interpretar ("parsear") o arquivo recebido, normalizar os dados, e salvar corretamente a informação em um banco de dados relacional, **se atente as documentações** que estão logo abaixo.
3. Exibir uma lista das operações importadas por lojas, e nesta lista deve conter um totalizador do saldo em conta
4. Ser escrita obrigatoriamente em Ruby 2.0+
5. Ser simples de configurar e rodar, funcionando em ambiente compatível com Unix (Linux ou Mac OS X). Ela deve utilizar apenas linguagens e bibliotecas livres ou gratuitas.

**Sua aplicação web NÃO precisa:**

1. Lidar com autenticação ou autorização (pontos extras se ela fizer, mais pontos extras se a autenticação for feita via OAuth).
2. Ser escrita usando algum framework específico (mas não há nada errado em usá-los também, use o que achar melhor).

# Documentação do CNAB

| Descrição do campo  | Inicio | Fim | Tamanho | Comentário
| ------------- | ------------- | -----| ---- | ------
| Tipo  | 1  | 1 | 1 | Tipo da transação
| Data  | 2  | 9 | 8 | Data da ocorrência
| Valor | 10 | 19 | 10 | Valor da movimentação. *Obs.* O valor encontrado no arquivo precisa ser divido por cem(valor / 100.00) para normalizá-lo.
| CPF | 20 | 30 | 11 | CPF do beneficiário
| Cartão | 31 | 42 | 12 | Cartão utilizado na transação 
| Hora  | 43 | 48 | 6 | Hora da ocorrência atendendo ao fuso de UTC-3
| Dono da loja | 49 | 62 | 14 | Nome do representante da loja
| Nome loja | 63 | 81 | 19 | Nome da loja

# Documentação sobre os tipos das transações

| Tipo | Descrição | Natureza | Sinal |
| ---- | -------- | --------- | ----- |
| 1 | Débito | Entrada | + |
| 2 | Boleto | Saída | - |
| 3 | Financiamento | Saída | - |
| 4 | Crédito | Entrada | + |
| 5 | Recebimento Empréstimo | Entrada | + |
| 6 | Vendas | Entrada | + |
| 7 | Recebimento TED | Entrada | + |
| 8 | Recebimento DOC | Entrada | + |
| 9 | Aluguel | Saída | - |

# Avaliação

Seu projeto será avaliado de acordo com os seguintes critérios.

1. Sua aplicação preenche os requerimentos básicos?
2. Você documentou a maneira de configurar o ambiente e rodar sua aplicação?
3. Você seguiu as instruções de envio do desafio?
4. Qualidade e cobertura dos testes unitários.

Adicionalmente, tentaremos verificar a sua familiarização com as bibliotecas padrões (standard libs), bem como sua experiência com programação orientada a objetos a partir da estrutura de seu projeto.

---

Boa sorte!


# INFORMAÇÃO/INSTALAÇÃO

Este projeto tem como finalidade o processamento de remessa de logistas de acordo com as normas do CNAB.
O objetivo é digitalizar a emissão e a baixa dos pagamentos, de forma que os dados sejam preenchidos automaticamente dentro de um padrão.

Foram proposto os seguintes desafios

* Cria um formulario para fazer o upload da CNAB.
* Processar (interpretar, parsear) o arquivo recebido, e normalizar os dados num banco de dados relacional.
* Segir a documentação informada.
* Exibir uma lista das operações importados por lojas.
* Totaliza o saldo em conta das lojas
* Ter sido escrita em ruby 2.0+
* Ser simples de configura e rodar.
* Funcionar em um ambiente Unix.
* Utilizar bibliotecas livres ou gratuitas

## Como configura este projeto ? 🔨

### Banco de dados PostgresSQL :game_die:

Para configura o banco de dados basta criar um container do postgres com o seguinte comando abaixo.

```shell
sudo docker run -d \
--name=postgres \
-v /etc/localtime:/etc/localtime:ro \
-e POSTGRES_USER=root \
-e POSTGRES_PASSWORD=root \
-v /storage/pgdata:/var/lib/postgresql/data \
-p 5432:5432 \
--restart=always \
postgres
```

No arquivo database.yml aponta para o container:
host: (normalmente é 172.17.0.1)
username: root
password: root

E por fin execute os seguintes comandos dentro da raiz do projeto:

* ```rails db:create```
* ```rails db:migrate```
* Abaixo execute os seeds para criação das transações simples.
  * ```rails db:seed```
* ```rails rails s```

Acesse [localhost:3000](localhost:3000)

## Autenticação :key:

Crie um usuario manualmente usando esse link http://localhost:3000/users/sign_up ou autentique com sua conta do google (oauth2)

### Fim Obrigado! :D 🚀

