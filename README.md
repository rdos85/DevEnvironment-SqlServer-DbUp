# DevEnvironment-SqlServer-DbUp

Exemplo de ambiente de DEV usando SqlServer (docker) + DbUp (execução de scripts). 

## Antes de iniciar

Instale o docker na máquina.

## Como funciona

Existem 3 arquivos ps1 (powershell) que permitem a rápida criação/destruição de um ambiente SqlServer local. Um dos ps1 dispara a execução dos scripts que estiverem no diretório 'Scripts'.  

Por padrão, o banco SqlServer que é criado utiliza a seguinte connectionString (que pode ser usada nas aplicações): 

```text
Server=::1,1433;User Id=SA;Password=SqlServer2019!;Database=master;
```

## Uso comum

Para a maioria dos cenários, bastará adicionar ao diretório "Scripts" os scripts (arquivos .sql) que você deseja que sejam executados na criação do banco (Create tables, cargas iniciais etc.).  
Em seguida, executar via PowerShell os 2 arquivos: 

```powershell
.\create-sqlserver.ps1
.\apply-sqlserver.ps1
```

Caso queria alterar alguma configuração, basta alterar os arquivos conforme a sua necessidade.  

## Arquivos

### create-sqlserver.ps1

Arquivo responsável por criar o container SqlServer 2019 que está configurado em dockercompose-sqlserver.yml.  
O nome que é usado no docker é local-sqlserver. Caso queira trocar, lembre-se de alterar também no arquivo destroy-sqlserver.ps1.  
Exemplo:  

```text
docker compose -f .\dockercompose-sqlserver.yml -p nome-que-voce-preferir up -d
```

### apply-scripts.ps1

Arquivo responsável por executar os scripts da pasta "Scripts". Os scripts serão executados usando a ferramenta dbup-cli.  
As configurações que o dbup usará para fazer conexão com banco estão no arquivo dbup.yml.  

### destroy-sqlserver.ps1

Arquivo respnsável por destruir o container SqlServer.  

### dockercompose-sqlserver.yml

Arquivo dockercompose responsável pelas especificações do SqlServer, como usuário, senha, porta etc.  

Valores padrões:  
Username: sa  
Password: SqlServer2019!  

### dbup.yml

Arquivo de configurações usado pelo DbUp. Contém a connection string que é usada para acessar o banco e o diretório onde estão os scripts.  