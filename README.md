<h1>Arquitetura do projeto</h1>

Configurando sua máquina
-------------------------
Necessário instalar:
-----------------------

*	Robot Framework: O Robot Framework é um framework genérico de automação de código aberto. Pode ser usado para automação de teste (Web, Mobile e API), e automação de processo robótico (RPA).
*	Python 3: linguagem de programação utilizada nos testes.
* Chromedriver: Uma ferramenta de código aberto que possibilita a comunicação do selenium com o Google Chrome.
* JDK: O Java Development Kit (JDK) é um dos três principais pacotes de tecnologia usados na programação Java, juntamente com a JVM (Java Virtual Machine) e o JRE (Java Runtime Environment).
*	Cmder for Windows: Sistema que trás as funcionalidades bash (Terminal) para o Windows.


Configurando o ambiente de automação de testes
------------------------------------------------------------

Para que sua automação possa ser realizada é necessário instalar alguns recursos, conforme será descrito abaixo:

Windows
--------

<h3>1. Instalando o Console do Cmder</h3>

*	Baixe em: <https://github.com/cmderdev/cmder/releases/download/v1.3.14/cmder.zip> .
*	Descompactar na pasta C:\Cmder.
*	Selecione o cmder.exe e arrastar até sua barra de ferramentas do Windows para criar um atalho.
*	Executar o cmder.exe.

<h3>2. Instalando o Python 3</h3>

*	Baixe em: <https://www.python.org/downloads/>.
*	Executar o arquivo baixado e seguir as instruções clicando em ‘next’.
* 	Selecionar os 3 checkbox exibidos e continuar a dar ‘next’ até o ‘finish’.
*	No Console do Cmder, digite o comando python --version , se a instalação estiver correta aparecerá a versão instalada.

<h3>3. Instalando o Chromedriver</h3>

*	Baixe em: <https://chromedriver.chromium.org/downloads> .
*	Descompactar na pasta Scripts dentro da pasta de instalação do Python.

<h3>4. Instalando o JDK</h3>

*	Baixe em: <https://www.oracle.com/br/java/technologies/javase/javase-jdk8-downloads.html>.
*	Executar o arquivo baixado e seguir as instruções clicando em ‘next’.
*	No Console do Cmder, digite o comando java - version, se a instalação estiver correta aparecerá a versão instalada.

<h3>4. Instalando o Robot Framework</h3>

*	Após a instalação do Python, dentro do Cmder digite: 
````bash
sudo pip3 install robotframework==4.1.1 \
&& sudo pip3 install robotframework-seleniumlibrary==5.1.3 \
&& sudo pip3 install robotframework-faker==5.0.0 \
````
*	No Console do Cmder, digite o comando robot --version, se a instalação estiver correta aparecerá a versão instalada.

E pronto, ambiente configurado.


Automação de Testes
--------------------

Para a automação de testes, utilizaremos o Robot Framework.

<h3>Aprendendo a usar a pasta resources</h3>

*	A pasta resources contém os métodos usados e caminhos seguidos com base em cada keyword utilizada.
*	O arquivo base.robot é onde a maioria das configurações são mantidas.
*	Os códigos e fluxos estão sendo alocados conforme a tela que o fluxo está utilizando (caso seja uma task, as keywords irão dentro do tasks_keywords.robot)

<h3>Utilizando Tags</h3>

Utilizamos a tag para diferenciar os cenários por grupos, funcionalidades ou etapas de testes. As tags são inseridas na linha abaixo do nome da keyword.
No terminal, quando quisermos rodar os cenários que estão nomeados com tags, basta utilizarmos o seguinte comando:

````bash
robot -d -i tag
````

Esse comando rodará todos os cenários que tiverem a tag.

Executando os testes automatizados
-----------------------------------

Para executar o testes automatizados usaremos alguns comandos a partir da pasta raiz do nosso projeto.

*	Para execução de todos os cenários implementados utilizamos o seguinte código:
````bash
robot ./tests/
````

*	Para execução de todos os cenários e gerar um report com screenshots, utilizamos o seguinte código:
````bash
robot -d ./logs ./tests/
````

Na pasta ./logs do projeto é gerado um arquivo HTML com o report dos cenários de testes.

Basta abrir no seu navegador e visualizar o resultado.
