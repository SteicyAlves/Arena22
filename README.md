# Testes Arena22 Web


## Configurando Ambiente de Automação


#### 1) Clone este projeto executando em seu terminal: git clone https://github.com/Steicy-Alves-Arena/Arena22

#### 2) Instale o Ruby com versão >= 2.5.0
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

#### 6) Instale os drivers do chrome, firefox, internet explorer e o Cucumber Standalone JSON Formatter:
```shell script
    Link para Baixar o ChromeDriver para GoogleChrome: http://chromedriver.storage.googleapis.com/index.html
    Link para Baixar o Geckodriver para Firefox: https://github.com/mozilla/geckodriver/releases
    Link para Baixar o IE Driver para Internet Explorer: https://www.selenium.dev/downloads/
    Link para Baixar o Cucumber Standalone JSON Formatter: https://github.com/cucumber/cucumber/releases/tag/cucumber-json-formatter%2Fv6.0.0

    - Instruções para instalação no Windows, Linux ou Mac: ​​
    ​
        1) Faça o download do ChromeDriver, GeckoDriver, IE Driver e Cucumber Standalone JSON Formatter (conforme seu SO);
        2) Descompacte;
        #Apenas para Windows
        3) Acesse a pasta onde descompactou o binário e mova os executáveis para a pasta Windows;
        #Apenas para Linux ou Mac
        3) Acesse a pasta onde descompactou o binário e execute os comandos:

            Para ChromeDriver:
            chmod +x chromedriver​
            sudo mv chromedriver /usr/local/bin

            Para GeckoDriver:
            chmod +x geckodriver
            sudo mv geckodriver /usr/local/bin

            Para Cucumber Standalone JSON Formatter:
            Renomeie o cucumber-json-formatter-linux-amd64 (ou outra versão de CPU) para cucumber-json-formatter
            chmod +x cucumber-json-formatter
            sudo mv cucumber-json-formatter /usr/local/bin
            Para verificar se tudo ocorreu com sucesso: cucumber-json-formatter --help
```

## Configuração de Ambientes

```shell script
Para configurar os ambientes onde os testes serão rodados, altere o nome da pasta 'example' em 'tests\features\support\config\example' para 'environment'.
    - Após isso, você obterá o seguinte caminho: 'tests\features\support\config\environment'

Para cada arquivo de 'environment', preencha as informações solicitadas com os dados do ambiente.
    - Caso haja dúvidas sobre os dados que devem ser preenchidos, acesse o arquivo 'envexample.yaml' dentro de 'environment', para ser norteado sobre o que preencher.
```

## Execução dos Cenários de Teste

```shell script
Para executar os testes, acesse a pasta raiz do projeto e execute no terminal:
    - Para executar todos os cenários de teste: cucumber

    #A tag do cenário pode ser encontrada dentro de features/specs/arquivo.feature desejado
    - Para executar um teste específico: cucumber -t '@tag_do_cenario'
```


## Mais Informações

```shell script
# Conheça e explore mais GEMs
GEMs Ruby: https://rubygems.org/

# Conheça mais sobre Ruby
Documentação Ruby: https://rubydoc.info/
```
