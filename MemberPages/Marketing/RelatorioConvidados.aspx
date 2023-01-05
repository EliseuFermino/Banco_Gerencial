<%@ Page Title="Relatório de Convidados" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="RelatorioConvidados.aspx.vb" Inherits="MemberPages_Marketing_RelatorioConvidados" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

        <style type="text/css">

        #divAno {
            float: left;           
            margin-left : 10px;
            margin-top : 2px;
        }
        
        #divLista {
            clear:both;
            float: left;
            border: 1px solid gray;             
            padding: 3px;
            margin-left: 5px;
            margin-top: 5px;
        }

        #divExcel {
           
            float: left;                     
            
            margin-left: 10px;
          
        }

        #divTipoLegenda {            
            float: left;           
            margin-left: 5px;
            margin-top: 4px;
        }

        #divTipo {           
            float: left;           
            margin-left: 5px;
            margin-top: 4px;
        }

         .watermarked {
            color:lightgray
            

        }

    </style>

  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

  
        <div id="divAno">
            <uc1:wucAno runat="server" ID="cboAno" />
        </div>

        <div id="divTipoLegenda">
            Categoria: 
        </div>

        <div id="divTipo">
            <dx:ASPxComboBox ID="cboTipo" runat="server" DataSourceID="dsTipo" TextField="descTipo" ValueField="idTipo"  Width="100px" AutoPostBack="True">
            </dx:ASPxComboBox>
            <asp:SqlDataSource ID="dsTipo" runat="server" ConnectionString="<%$ ConnectionStrings:gerMarketingConnectionString %>" SelectCommand="uspBuscarTipoTodos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
         </div>   
            
               <div id="divExcel">
        <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="grid" GuiaNome="Lista de Convidados" />
    </div>                          

      
    <div id="divLista">
        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsLista" KeyFieldName="nomeConvidado" Width="1000px">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total de Convidados: {0:n0}" FieldName="nomeConvidado" ShowInColumn="Nome do Convidado" SummaryType="Count" />
            </TotalSummary>
            <GroupSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total de Convidados: {0:n0}" FieldName="Tipo" SummaryType="Count" />
            </GroupSummary>
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowClearFilterButton="True"/>
                <dx:GridViewDataTextColumn Caption="Ano" FieldName="Ano" VisibleIndex="1" Width="50px">
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ID" FieldName="ID" VisibleIndex="2" Width="50px" CellStyle-Font-Bold ="true" >
                    <Settings AllowAutoFilter="True" />

<CellStyle Font-Bold="True"></CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="CNPJ do Fornecedor" FieldName="CPF_CGC" VisibleIndex="3" Width="130px">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nome do Fornecedor" FieldName="DescFornecedor" ReadOnly="True" VisibleIndex="5" Width="150px">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nome do Convidado" FieldName="nomeConvidado" VisibleIndex="6" Width="200px">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Acompanhante" ReadOnly="True" VisibleIndex="8" Width="100px">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="10" Width="90px" Caption="Quem Incluiu?">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle HorizontalAlign="Center" Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DataInclusao" VisibleIndex="11" Width="100px" Caption="Data Inclusão">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="HoraInclusao" VisibleIndex="12" Caption="Hora Inclusão" Width="100px">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tipo" FieldName="descTipo" VisibleIndex="2" Width="100px">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cargo" FieldName="Cargo" VisibleIndex="7" Width="100px">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nome Fantasia" FieldName="DescFantasia" VisibleIndex="4" Width="200px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Responsável" FieldName="nomeDistribuidor" VisibleIndex="9" Width="150px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior ColumnResizeMode="Control" />
            <SettingsPager PageSize="18">
                <Summary AllPagesText="Convidado: {0} - {1} ({2} convidados)" Text="Convidado {0} of {1} ({2} convidados)" />
                <PageSizeItemSettings Caption="Convidados:">
                </PageSizeItemSettings>
            </SettingsPager>
            <Settings ShowTitlePanel="True" VerticalScrollBarMode="Auto" ShowFilterRow="True" ShowFooter="True" VerticalScrollableHeight="400" ShowGroupPanel="True" />
            <SettingsText Title="Lista de Convidados " EmptyDataRow="Não há nenhum convidado informado ainda." GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#F2F2F2">
                </AlternatingRow>
                <Footer Font-Bold="True">
                </Footer>
                <TitlePanel Font-Bold="True" Font-Size="X-Large">
                </TitlePanel>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsLista" runat="server" ConnectionString="<%$ ConnectionStrings:gerMarketingConnectionString %>" SelectCommand="usp_BuscarListaConvidadosPorTipo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                <asp:ControlParameter ControlID="cboTipo" DefaultValue="1" Name="idTipo" PropertyName="Value" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>


    </div>





</asp:Content>

