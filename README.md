# Biblioteca Digital — Sistema de Gestão de Livros
Sistema web desenvolvido em ASP.NET Web Forms e C# para apresentação e consulta de um catálogo de livros integrado a uma base de dados SQL Server.

## Funcionalidades
- Apresentação dinâmica dos livros
- Exibição da capa, título, autor, editora e ano de publicação
- Filtro de livros por autor
- Opção para visualizar todos os autores
- Contagem de livros apresentados
- Organização dos livros por título
- Integração com base de dados SQL Server

## Tecnologias
- C#
- ASP.NET Web Forms
- SQL Server
- ADO.NET / SqlDataSource
- HTML5
- CSS3
- JavaScript

## Principais conceitos aplicados
- ASP.NET Web Forms
- Programação orientada a eventos
- Formulários web
- Data Binding
- Repeater
- DropDownList
- SqlDataSource
- Consultas SQL
- INNER JOIN
- Filtros com parâmetros SQL
- Apresentação dinâmica de dados

## Configuração
Antes de executar o projeto, configure as connection strings no arquivo `Web.config` com os dados do seu ambiente SQL Server.

## Estrutura do projeto
```text
EstoqueLivros/
├── Properties/
├── css/
├── img/
├── js/
│
├── Livros.aspx
├── Livros.aspx.cs
├── Livros.aspx.designer.cs
├── EstoqueLivros.csproj
│
├── Web.Debug.config
├── Web.Release.config
├── Web.config
└── packages.config
