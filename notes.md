
## SQL

SQL é uma linguagem de banco de dados, um acrônimo de *Structured Query Linguagem* (linguagem estruturada de consulta) que nos possibilita  criar e manipular Bases de dados.

Trabalhamos com ela criando Queries (INSERT, UPDATE, SELECT) e existem pequenas variações na sintaxe de acordo com a ferramenta que gerencia o banco (MySQL, PostgreSQL, SQL Server), também chamados de `SGBD's`(Sistema gerenciador de bancos de dados).

-----

## Banco de Dados

E onde armazenamos os dados no nosso sistema.

Vamos criar os bancos de dados através da SQL e o SGBD vai ajudar-nos a gerenciar o banco e os dados;

O banco de dados possui algumas entidades fundamentais para o seu correto funcionamento, como tabelas e elas que armazenam as informações.

----
## Principais estruturas de banco de dados

##### Diagrama do Banco:
É o projeto do banco, parte fundamental e mais avançada, que define o sucesso do projeto;
##### Banco de dados:
A entidade que vai guardar todos os elementos do
banco;
##### Tabelas:
A categoria dos dados;
##### Colunas:
Tipos de informações que precisamos salvar;
##### Dados:
O dado final entregue pelo usuário;

-----
## CRIANDO UM BANCO DE DADOS

para iniciar uma base de dados, na aplicação 'visual', inserimos a query:

```sql
CREATE DATABASE <database_name> ;
```

### A SINTAXE DO SQL

Em SQL, por convenção, todas as instruções são em maiúsculos e os
nomes são em minúsculo (banco, tabela, coluna)

Toda instrução deve ser finalizada com um ponto e vírgula;

Alguns SGBD's não exigem ponto e vírgula, porém inserir eles em todas
as instruções é uma maneira de garantir a execução;

### IMPORTAÇÃO DE BANCOS DE DADOS

Importação de banco é quando temos um arquivo pronto de banco com
tabelas e dados) e inserimos ele no nosso SGBD, geralmente originado de uma exportação.

Se trata de ação simples para obter todos os dados já cadastrados em um sistema. Após a importação podemos utilizar como se o banco houvesse sido
criado na nossa máquina É uma prática comum no dia a dia em uma empresa.

Vamos primeiramente acessar o MySQL pelo terminal no diretório onde o arquivo a ser importado está:

```shell
mysql -u root
```


Agora devemos criar um banco, como exemplo o banco vai se chamar empresa:

```sql
CREATE DATABASE empresa;
```

Verificamos a criação:

```sql
SHOW DATABASES;
```

Verificada a criação, selecionamos o banco usando `USE <nome>`:

```sql
USE empresa;
```


E depois utilizar o comando`source empresa` para que o banco reexecute as queries antes utilizadas para criação do banco de dados:

```sql
source empresa.sql;
```

----
## QUERIES:

#### GERENCIANDO BANCOS DE DADOS:

A partir daqui vamos focar em manipular diretamente os bancos de dados via comandos:

* Criação de bancos de dados:

```sql
CREATE DATABASE <db_name>;
```

* Exclusão de banco de dados:

```sql
DROP DATABASE <db_name>
```

* Fazendo a checagem das bases de dados:

```sql
SHOW DATABASES;
```

* Selecionando um banco:

```sql
USE <db_name>
```

* Importar um banco de dados (OBS: Estar com terminal no local do arquivo)

```sql
source <db_name.sql>
```

* Assim como importamos, podemos gerar um arquivo .sql e o exportar(OBS: star com terminal no local do arquivo )

```shell
mysqldump -u <user> <db_name> > <file_name>.sql
```

#### GERENCIANDO TABELAS:

##### TABELAS:
É a entidade responsável por guardar nossos dados Uma tabela é formada por colunas.

##### COLUNAS:
As colunas são como categorias dos nossos dados: nome, profissão, idade, etc.

As colunas possuem tipos de dados determinados, como: textos, números, datas e atributos: não nulo, chave primária, auto incremento;

* Para criar tabelas utilizamos o comando `CREATE TABLE` seguido pelo nome da tabela e entre parênteses as colunas referentes àquela tabela, caso a tabela possua mais de 1 coluna elas devem ser separadas por vírgulas.

* As colunas devem possuir o nome e o tipo de dado que ela vai representar(int, float, datas, varchar, etc.) e seu limite máximo de caracteres.

```sql
CREATE TABLE users(id number (5) , nome varcar (255))
```

##### TIPOS DE DADOS:

Os tipos de dados classificam um dado e os inserimos em uma coluna (texto, data, número e outros).

É uma parte extremamente importante da criação do nosso projeto e do
banco de dados uma vez que, uma boa estruturação dos dados no banco impacta na performance das buscas.

Alguns dados também permitem limites serem definidos, como quantidade máxima de caracteres;

###### DADOS DO TIPO TEXTO:

- **CHAR(x)**: aceita de formato de texto de 0 a 255 onde x representa a quantidade;

- **VARCHAR(x)**: aceita de formato de texto de 0 a 65535 onde x representa a quantidade

- **TYNETEXT**: Aceita apenas textos com até 255 caracteres;

- **MEDIUMTEXT**: Aceita apenas textos com até 16777215 caracteres;


*Exemplo:*

```sql

USE test_data_types;

CREATE TABLE cadastro (nome VARCHAR(100), sobrenome VARCHAR (100), telefone CHAR(13), bio MEDIUMTEXT;
```

----

###### Tipos de Dados Numéricos

- **TINYINT(x)**: armazena números inteiros de 0 a 255.

- **INT**: armazena números inteiros de -2147483648 a 2147483647 ou 0 a 4294967295.

- **BIT(x)**: armazena números com de 1 a 64 caracteres.

- **BOOLEAN**: armazena valores verdadeiros ou falsos (1 ou 0).

- **BIGINT**: armazena números inteiros de -9223372036854775808 a 9223372036854775807 ou 0 a 18446744073709551615 se unsigned.

- **FLOAT(x,y)**: armazena números de ponto flutuante com precisão de 32 bits. `x` representa o total de dígitos e `y` a quantidade de dígitos após o ponto decimal.


```sql
CREATE TABLE servidores ( nome  VARCHAR(100), espaco_disco INT(10), ligado BOOL);

INSERT INTO servidores (nome,espaco_disco, ligado) VALUES ( 'Dell 003', 48000, 1);
```

-----
###### Tipos de Dados de Data e Hora

- **DATE**: armazena uma data no formato 'YYYY-MM-DD'.

- **DATETIME**: armazena uma data e hora no formato 'YYYY-MM-DD HH:MM'.

- **TIMESTAMP**: armazena um carimbo de data/hora no formato 'YYYY-MM-DD-HH:MM', geralmente usado para registrar a última modificação.

```sql
CREATE TABLE aniversarios ( nome VARCHAR(155), aniversario DATE);

 INSERT INTO aniversarios(nome,aniversario) VALUES ('Marcelo Marte
lo', '2016-07-17');
```

----

###### Outros Tipos de Dados

- **BOOLEAN**: armazena valores verdadeiros ou falsos (1 ou 0).

- **ENUM**: armazena um valor de uma lista de valores predefinidos.

- **SET**: armazena zero ou mais valores de uma lista de valores predefinidos.

- **BINARY(x)**: armazena dados binários de comprimento fixo de até 255 bytes.

- **VARBINARY(x)**: armazena dados binários de comprimento variável de até 65535 bytes.

- **BLOB**: armazena grandes quantidades de dados binários (Binary Large Objects). Existem diferentes tipos de BLOB:
    - **TINYBLOB**: armazena até 255 bytes de dados binários.
    - **BLOB**: armazena até 65535 bytes de dados binários.
    - **MEDIUMBLOB**: armazena até 16777215 bytes de dados binários.
    - **LONGBLOB**: armazena até 4294967295 bytes de dados binários.


----

##### INSERINDO DADOS NA TABELA:

Uma das operações mais comuns é inserir dados, utilizamos o comando:
`INSERT INTO <tabela> (<colunas...>) VALUES (<valores...>)`

Precisamos inserir o nome das colunas e também os valores para cada
uma, separados por vírgula.

Os valores precisam corresponder a ordem das colunas;

```sql
INSERT INTO funcionarions(nome, profissao) VALUES ('Jhon do', 'Example man');
```


----

##### ALTERANDO DADOS DA TABELA:

Há três tipos de alterações em SQL e todas elas tem em comum o comando `ALTER TABLE <table_name> <alteracao>` :

* Adição de colunas (ADD COLUMN)

```sql

CREATE TABLE funcionarios (nome varchar(100));

ALTER TABLE funcionarios ADD COLUMN profissao;

INSERT INTO funcionarions(nome, profissao) VALUES ('Jhon do', 'Example man');
```


* Remoção de colunas (DROP COLUM):

```sql

CREATE TABLE funcionarios (nome varchar(100), dummy_data VARCHAR(50));

ALTER TABLE funcionarios DROP COLUMN dummy_data;

```


* Modificar tipo da coluna (MODIFY COLUMN):

```sql

CREATE TABLE funcionarios (nome varchar(100), dummy_data VARCHAR(50));

ALTER TABLE funcionarios MODIFY COLUMN dummy_data char(50);

```


---
##### QUERIES (SIMPLES)

CRUD um acrônimo para *CREATE, READ , UPDATE, DELETE*, constituem as ações mais utilizadas para a manipulação de dados nas tabelas.

Toda aplicação web com banco de dados tem pelo menos uma destas operações e possivelmente todas.

* **`INSERT (CREATE)`**:
   Utilizada para inserir dados em uma coluna ou colunas. Os valores e as colunas devem ser separados por vírgula. Caso a inserção for utilizar todos os campos da tabela não é necessário a sua escrita desde que estejam na ordem  da tabela

```SQL
INSERT INTO <table> (<columns_name>) VALUES (<columns_values>);

INSERT INTO users (name VARCHAR(150), age CHAR(3), job VARCHAR(150)) VALUES ('JHON DOE', '40', 'DBA');

INSERT INTO users VALUES ('JANE DOE', '35', 'SOFTWARE DEVELOPER')
```


* **`SELECT (READ)`**:
   Utilizado para leitura dos dados de determinada coluna, para selecionar as colunas, depois da query, especificar a/as colunas separadas por vírgula e caso a intenção seja recuperar uma tabela por inteiro utiliza-se o * .

```SQL
SELECT <column_table query> FROM <table_name>;

SELECT * FROM users -- seleciona todas as colunas da tabela de usuarios
```

* **`UPDATE`**:
  Para atualizar dados vamos utilizar a instrução **UPDATE** e para especificar o registro da tabela utiliza-se o operador **WHERE**.

  Podemos inserir mais colunas, separando elas por vírgula;

```sql
UPDATE <tabela> SET <column = value > WHERE <condition (specify query)>;

UPDATE users SET national_id = '01987654321' WHERE nome = 'jannet' ;
```

* **`DELETE`**:
  Para deletar dados vamos utilizar a instrução DELETE.

  Lembrar sempre de utilizar o **WHERE** caso contrario, deletaremos todos os dados da coluna. A quantidade de dados removidos depende do **WHERE**;

```sql
DELETE FROM <table_name> WHERE <query>;

DELETE FROM users WHERE nome = 'JHON DOE';
```
