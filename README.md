# Testes Arena22 Web


## Configurando Ambiente de Automação


#### 1) Clone este projeto executando em seu terminal: git clone https://github.com/Steicy-Alves-Arena/Arena22

#### 2) Instale o Ruby com versão >= 2.4.0
```shell script
    - Instruções para Baixar o Ruby: https://www.ruby-lang.org/pt/downloads/
        Instruções para Instalar o Ruby: https://www.ruby-lang.org/pt/documentation/installation/
        Instalador para Windows: https://rubyinstaller.org/
```

#### 3) Instale a GEM do Bundler para gestão das GEMs
```shell script
    Execute no terminal: gem install bundler
    Informações sobre o uso do Bundler: https://bundler.io/
```

#### 4) Instale todas as gems usadas no projeto
```shell script
    #Após a execução do comando abaixo todas as GEMs utilizadas no projeto serão instaladas 
    Na pasta raiz do projeto execute: bundler install
```

#### 5) Caso necessite verificar as configurações de ambiente do Ruby
```shell script
    Execute no terminal: gem env
```

#### 6) Instale os drivers do chrome(chromedriver) e do firefox(geckodriver):
```shell script
    Link para Baixar o ChromeDriver para GoogleChrome: http://chromedriver.storage.googleapis.com/index.html
    Link para Baixar o Geckodriver para Firefox: https://github.com/mozilla/geckodriver/releases

    - Instruções para instalação do Chromedriver e Geckodriver no Windows, Linux ou Mac: ​​
    ​
        1) Faça o download do Chromedriver e Geckodriver (conforme seu SO);
        2) Descompacte;
        #Apenas para Windows
        3) Acesse a pasta onde descompactou o binário e mova o executável para a pasta Windows;
        #Apenas para Linux ou Mac
        3) Acesse a pasta onde descompactou o binário e execute os comandos:

            Para ChromeDriver:
            chmod +x chromedriver​
            sudo mv chromedriver /usr/local/bin

            Para GeckoDriver:
            chmod +x geckodriver
            sudo mv geckodriver /usr/local/bin
```


## Execução dos Cenários de Teste

```shell script
Para executar os testes, acesse a pasta raiz do projeto e execute no terminal:
    - Para executar todos os cenários de teste: cucumber

    #A tag do cenário pode ser encontrada dentro de features/specs/arquivo.feature desejado
    - Para executar um teste específico: cucumber -t @tag_do_cenario
```


## Mais Informações

```shell script
# Conheça e explore mais GEMs
GEMs Ruby: https://rubygems.org/

# Conheça mais sobre Ruby
Documentação Ruby: https://rubydoc.info/
```
