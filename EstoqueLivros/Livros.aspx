<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Livros.aspx.cs" Inherits="EstoqueLivros.Livros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8" />
    <title>Biblioteca Digital</title>
    <link href="css/livros.css" rel="stylesheet" />

</head>

<body>

<form id="form1" runat="server">

        <!--HTML -->
    <header class="header">
            <div class="logo-icon">
                <img src="/img/logo.png" alt="Biblioteca Digital" />
            </div>
            <h1>Biblioteca Digital</h1> 
    </header>

    <main class="container">


        <!-- DDL -->
        <section class="filter-area">
            <div class="filter-title">
                Busca Por Autor
            </div>
            
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="author-select" DataSourceID="Autores" 
                DataTextField="NomeAutor" DataValueField="IdAutor" AutoPostBack="true">
            </asp:DropDownList>
        </section>


        <!-- CABEÇALHO-->
        <div class="section-header">
            <div class="section-title">Livros</div>

            <div class="book-count">
                <asp:Label ID="lblTotal" runat="server"> </asp:Label>
            </div>
        </div>

        <!-- LIVROS -->
<asp:Repeater
    ID="RepeaterLivros"
    runat="server"
    DataSourceID="Livros">

    <HeaderTemplate>
        <div class="books-grid">
    </HeaderTemplate>

    <ItemTemplate>

        <article class="book-card">

            <div class="book-cover">
                <img src='<%# ResolveUrl("~/" + Eval("Capa").ToString()) %>'alt='<%# Eval("Titulo_Livro") %>' />
            </div>

            <div class="book-title">
                <%# Eval("Titulo_Livro") %>
            </div>

            <div class="book-author">
                <%# Eval("NomeAutor") %>
            </div>

            <div class="book-info">
                <%# Eval("Editora") %>
                <br />
                <%# Eval("Ano") %>
            </div>

        </article>

    </ItemTemplate>

    <FooterTemplate>
        </div>
    </FooterTemplate>

</asp:Repeater>

        <asp:SqlDataSource ID="estoquelivros" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotecaConnectionString2 %>" ProviderName="<%$ ConnectionStrings:BibliotecaConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [Livros]"></asp:SqlDataSource>

    </main>


    <!-- SQL - AUTORES -->
    <asp:SqlDataSource
        ID="Autores" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotecaConnectionString %>"
        SelectCommand="
            SELECT 0 AS IdAutor,
                'Todos' AS NomeAutor
            UNION ALL
            SELECT
                IdAutor,
                NomeAutor
            FROM Autores
            ORDER BY
                IdAutor">
    </asp:SqlDataSource>


    <!--SQL - LIVROS -->
  <asp:SqlDataSource
    ID="Livros"
    runat="server"
    ConnectionString="<%$ ConnectionStrings:BibliotecaConnectionString %>"
    SelectCommand="
        SELECT
            L.IdAutor,
            A.NomeAutor,
            L.Titulo_Livro,
            L.Ano,
            L.Editora,
            L.Capa
        FROM Livros AS L
        INNER JOIN Autores AS A
            ON L.IdAutor = A.IdAutor
        WHERE
            @IdAutor = 0
            OR L.IdAutor = @IdAutor
        ORDER BY L.Titulo_Livro">

    <SelectParameters>

        <asp:ControlParameter
            Name="IdAutor"
            ControlID="DropDownList1"
            PropertyName="SelectedValue"
            Type="Int32"
            DefaultValue="0" />

    </SelectParameters>

</asp:SqlDataSource>
</form>

<script src="js/livros.js"></script>

</body>
</html>