## SQL

SQL é uma linguagem de banco de dados, um acrônimo de _Structured Query Linguagem_ (linguagem estruturada de consulta) que nos possibilita criar e manipular Bases de dados.

Trabalhamos com ela criando Queries (INSERT, UPDATE, SELECT) e existem pequenas variações na sintaxe de acordo com a ferramenta que gerencia o banco (MySQL, PostgreSQL, SQL Server), também chamados de `SGBD's`(Sistema gerenciador de bancos de dados).

---

## Banco de Dados

E onde armazenamos os dados no nosso sistema.

Vamos criar os bancos de dados através da SQL e o SGBD vai ajudar-nos a gerenciar o banco e os dados;

O banco de dados possui algumas entidades fundamentais para o seu correto funcionamento, como tabelas e elas que armazenam as informações.

---

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

---

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

---

## QUERIES:

#### GERENCIANDO BANCOS DE DADOS:

A partir daqui vamos focar em manipular diretamente os bancos de dados via comandos:

- Criação de bancos de dados:

```sql
CREATE DATABASE <db_name>;
```

- Exclusão de banco de dados:

```sql
DROP DATABASE <db_name>
```

- Fazendo a checagem das bases de dados:

```sql
SHOW DATABASES;
```

- Selecionando um banco:

```sql
USE <db_name>
```

- Importar um banco de dados (OBS: Estar com terminal no local do arquivo)

```sql
source <db_name.sql>
```

- Assim como importamos, podemos gerar um arquivo .sql e o exportar(OBS: star com terminal no local do arquivo )

```shell
mysqldump -u <user> <db_name> > <file_name>.sql
```

#### GERENCIANDO TABELAS:

##### TABELAS:

É a entidade responsável por guardar nossos dados Uma tabela é formada por colunas.

##### COLUNAS:

As colunas são como categorias dos nossos dados: nome, profissão, idade, etc.

As colunas possuem tipos de dados determinados, como: textos, números, datas e atributos: não nulo, chave primária, auto incremento;

- Para criar tabelas utilizamos o comando `CREATE TABLE` seguido pelo nome da tabela e entre parênteses as colunas referentes àquela tabela, caso a tabela possua mais de 1 coluna elas devem ser separadas por vírgulas.

- As colunas devem possuir o nome e o tipo de dado que ela vai representar(int, float, datas, varchar, etc.) e seu limite máximo de caracteres.

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

_Exemplo:_

```sql

USE test_data_types;

CREATE TABLE cadastro (nome VARCHAR(100), sobrenome VARCHAR (100), telefone CHAR(13), bio MEDIUMTEXT;
```

---

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

---

###### Tipos de Dados de Data e Hora

- **DATE**: armazena uma data no formato 'YYYY-MM-DD'.

- **DATETIME**: armazena uma data e hora no formato 'YYYY-MM-DD HH:MM'.

- **TIMESTAMP**: armazena um carimbo de data/hora no formato 'YYYY-MM-DD-HH:MM', geralmente usado para registrar a última modificação.

```sql
CREATE TABLE aniversarios ( nome VARCHAR(155), aniversario DATE);

 INSERT INTO aniversarios(nome,aniversario) VALUES ('Marcelo Marte
lo', '2016-07-17');
```

---

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

---

##### INSERINDO DADOS NA TABELA:

Uma das operações mais comuns é inserir dados, utilizamos o comando:
`INSERT INTO <tabela> (<colunas...>) VALUES (<valores...>)`

Precisamos inserir o nome das colunas e também os valores para cada
uma, separados por vírgula.

Os valores precisam corresponder a ordem das colunas;

```sql
INSERT INTO funcionarions(nome, profissao) VALUES ('Jhon do', 'Example man');
```

---

##### ALTERANDO DADOS DA TABELA:

Há três tipos de alterações em SQL e todas elas tem em comum o comando `ALTER TABLE <table_name> <alteracao>` :

- Adição de colunas (ADD COLUMN)

```sql

CREATE TABLE funcionarios (nome varchar(100));

ALTER TABLE funcionarios ADD COLUMN profissao;

INSERT INTO funcionarions(nome, profissao) VALUES ('Jhon do', 'Example man');
```

- Remoção de colunas (DROP COLUM):

```sql

CREATE TABLE funcionarios (nome varchar(100), dummy_data VARCHAR(50));

ALTER TABLE funcionarios DROP COLUMN dummy_data;

```

- Modificar tipo da coluna (MODIFY COLUMN):

```sql

CREATE TABLE funcionarios (nome varchar(100), dummy_data VARCHAR(50));

ALTER TABLE funcionarios MODIFY COLUMN dummy_data char(50);

```

---

##### QUERIES (SIMPLES)

CRUD um acrônimo para _CREATE, READ , UPDATE, DELETE_, constituem as ações mais utilizadas para a manipulação de dados nas tabelas.

Toda aplicação web com banco de dados tem pelo menos uma destas operações e possivelmente todas.

- **`INSERT (CREATE)`**:
  Utilizada para inserir dados em uma coluna ou colunas. Os valores e as colunas devem ser separados por vírgula. Caso a inserção for utilizar todos os campos da tabela não é necessário a sua escrita desde que estejam na ordem da tabela

```SQL
INSERT INTO <table> (<columns_name>) VALUES (<columns_values>);

INSERT INTO users (name VARCHAR(150), age CHAR(3), job VARCHAR(150)) VALUES ('JHON DOE', '40', 'DBA');

INSERT INTO users VALUES ('JANE DOE', '35', 'SOFTWARE DEVELOPER')
```

- **`SELECT (READ)`**:
  Utilizado para leitura dos dados de determinada coluna, para selecionar as colunas, depois da query, especificar a/as colunas separadas por vírgula e caso a intenção seja recuperar uma tabela por inteiro utiliza-se o \* .

```SQL
SELECT <column_table query> FROM <table_name>;

SELECT * FROM users -- seleciona todas as colunas da tabela de usuarios
```

- **`UPDATE`**:
  Para atualizar dados vamos utilizar a instrução **UPDATE** e para especificar o registro da tabela utiliza-se o operador **WHERE**.

  Podemos inserir mais colunas, separando elas por vírgula;

```sql
UPDATE <tabela> SET <column = value > WHERE <condition (specify query)>;

UPDATE users SET national_id = '01987654321' WHERE nome = 'jannet' ;
```

- **`DELETE`**:
  Para deletar dados vamos utilizar a instrução DELETE.

  Lembrar sempre de utilizar o **WHERE** caso contrario, deletaremos todos os dados da coluna. A quantidade de dados removidos depende do **WHERE**;

```sql
DELETE FROM <table_name> WHERE <query>;

DELETE FROM users WHERE nome = 'JHON DOE';
```

---

##### QUERIES COM OPERADORES:

A maioria das queries em um banco de dados são de consulta e as consultas é o a operação com mais variações.

Para receber detalhados resultados, precisamos aprender todo o poder do
**SELECT** em conjunto de operadores, desta maneira criaremos filtros avançados e conseguiremos atingir o resultado desejado de uma consulta facilmente.

Estes são os operadores mais comuns:

- **OPERADORES DE COMPRAÇÃO** (>, <, >=, <=, =): estes operadores vão filtrar dados baseados nas comparações.

```sql
SELECT * FROM employees.titles WHERE emp_np >= 11500;
```

- **OPERADORES LÓGICOS** (AND, OR NOT): Combinados com a cláusula WHERE estes operadores exercem condições para especificar uma busca:

```sql
SELECT * FROM employees.salaries WHERE salary BETWEEN 150000 AND 160000 AND from_date < '2000-01-01';
```

- **BETWEEN**: Seleção entre um intervalo.

```sql

-- SELECT * FROM <table_name> WHERE <column_name> BETWEEN <query>;

SELECT * FROM employees.salaries WHERE salary BETWEEN 150000 AND 160000;
```

- **LIKE**: Seleção por meio de algum padrão. Necessário utilizar `%` para delimitar a sub-string desejada;

```sql
SELECT * FROM employees.employees WHERE first_name LIKE '%Par%' AND gender = 'M';
```

- **IN**: Utilizado para especificar múltiplos valores em um intervalo selecionado (restrição de valores) na condição da busca.

```sql
-- SELECT * FROM <table_name> WHERE <column_name> IN (<query_interval>)

SELECT * FROM employees.dept_emp WHERE dept_no IN ("d005", "d006", "d007") LIMIT 100;
```

- **DISTINCT**: Seleciona e retorna apenas as variações de valores entre uma busca.

```sql
SELECT DISTINCT title FROM employees.titles;
```

- **ORDER BY**: ordena o resultado de uma query de forma crescente(ASC) ou decrescente(DESC) o [padrão para o retorno de uma consulta é ASC]:

```SQL
SELECT * FROM employees.salaries WHERE salary BETWEEN 150000 AND 160000 AND from_date < '2000-01-01' ORDER BY salary ASC;
```

- **LIMIT**: Limita o retorno das consultas otimizando o tempo desta busca.

```SQL
SELECT * FROM employees.salaries WHERE salary BETWEEN 140000 AND 160000 ORDER BY salary ASC LIMIT 100;
```

---

##### QUERIES COM FUNÇÕES:

Funções são blocos de códigos reaproveitáveis e assim como no código podemos utilizar funções nas buscas em SQL para extrair resultados que demandam muita especificações com operadores.

Temos diversas no SQL variando entre **`strings`**, **`numericas`** e **`datas`**, que vão nos ajudar muito nas nossas consultas e aqui estão as mais comuns:

- **MAX**: Retorna o maior valor de uma coluna selecionada;

```SQL
-- SELECT MAX (<column_name>) FROM <table_name>;

-- SELECT * FROM employees.salaries ORDER BY salary DESC LIMIT 1; ;

SELECT MAX(salary) as max_salary FROM employees.salaries ;
```

- **MIN**: Retorna o menor valor de uma coluna selecionada;

```SQL
-- SELECT MIN (<column_name>) FROM <table_name>;

--SELECT * FROM employees.salaries ORDER BY salary ASC LIMIT 1;

SELECT MIN (salary) as minimal_salary FROM employees.salaries ;
```

- **COUNT**: Retorna o numero de valores que combinam com uma query;

```sql

-- SELECT COUNT(<column_name>) FROM <table_name> WHERE <query>;

SELECT COUNT (*) as total_persons FROM employees.salaries WHERE salary >= 145000;

SELECT COUNT(*) AS register_total_number FROM employees.departments;
```

- **AVG**: Retorna a média entre os valores de uma determinada coluna;

```sql

-- SELECT AVG(<Ccolumn_name>) FROM <table_name>;

SELECT AVG (salary) as media_salario FROM employees.salaries;

```

- **SUM**: Retorna a soma de todos os valores de uma coluna;

```sql
-- SELECT SUM(<column_name>) FROM <table_name> <query>

SELECT SUM(salary) AS sum_of_salaries FROM employees.salaries WHERE salary > 100000;

```

---

#### CONSTRAINS

São regras que determinam como os campos serão preenchidos.

As constraints são adicionadas na criação da tabela geralmente, porém podemos alterar tabelas para adicioná-las nos ajudando a organizar e padronizar nosso projeto.

- **NOT NULL**: A constraint **NOT NULL** força um valor de uma coluna específica a não ser nulo;

```sql
CREATE TABLE pessoas (nome VARCHAR(100) NOT NULL);
```

- **UNIQUE**: A constraint **UNIQUE** garante que todos os valores de uma coluna não serão repetidos.

```sql
ALTER TABLE pessoas ADD COLUMN(email VARCHAR(100) UNIQUE);
```

- **PRIMARY KEY**: A constraint **PRIMARY KEY** só pode ser adicionada em uma única coluna da tabela e serve como identificador único do registro na tabela, geralmente é o **`ID`**.

```sql
CREATE TABLE products (id INT NOT NULL, nome VARCHAR(150),sku VARCHAR(50),PRIMARY KEY (id));
```

- **AUTO INCREMENT**: A constraint **AUTO_INCREMENT** serve para adicionar a quantidade de um em todo registro adicionado é muito utilizada na coluna id, já que ela é única e também chave primária.

```SQL
ALTER TABLE constraints.products MODIFY id INT NOT NULL AUTO_INCREMENT;
```

- **FOREGN KEY**: A **FOREIGN KEY** indica uma ligação de uma tabela a outra a partir de seu identificador. Na tabela que recebe a foregn key este identificado indica a ligação entre as tabelas.

```sql

CREATE TABLE constraints.pessoas (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
nome VARCHAR(150) NOT NULL,
idade INT);

CREATE TABLE constraints.enderecos (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  rua VARCHAR(150) NOT NULL,
  numero CHAR (10),
  pessoa_id INT NOT NULL,
  FOREIGN KEY (pessoa_id) REFERENCES pessoas(id)
);


INSERT INTO constraints.pessoas (nome, idade) VALUES ('JOAOZAINHO', 30);

INSERT INTO constraints.enderecos (rua, numero, pessoa_id) VALUES ('Rua dos bobos', '0', 1);

```

- **INDEX**: Adicionar um índice a uma coluna faz a consulta que envolva a mesma
  se tornar mais rápida. Sem o índice a consulta começa da primeira a última coluna até encontrar que você precisa, com o índice as demais serão ignoradas.

Para a remoção do index o processo é semelhante bastando referenciar o nome do index criado e a respectiva tabela.

```SQL

-- CREATE INDEX <index_name> ON <table_name> (<table_column>);

SELECT * FROM employees.employees WHERE first_name = 'John'; -- 4.096ms

CREATE INDEX employee_first_name ON employees.employees (first_name);

SELECT * FROM employees.employees WHERE first_name = 'John'; -- 0.071ms

-- DROP INDEX <index_name> ON <table_name> (<table_column>);

DROP INDEX employee_first_name ON employees.employees (first_name);
```
