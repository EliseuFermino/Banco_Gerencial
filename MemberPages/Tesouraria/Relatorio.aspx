<%@ Page Title="Relatório de Contas" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Relatorio.aspx.vb" Inherits="MemberPages_Tesouraria_Relatorio" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>



<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wuciListaDia.ascx" TagPrefix="uc1" TagName="wuciListaDia" %>
<%@ Register Src="~/Controles/wucListaDia.ascx" TagPrefix="uc1" TagName="wucListaDia" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divFilial {
            float: left;
            margin-left: 2px
        }

        #divDia {
            float: left;
            margin-left: 15px;
           
        }

        #divExcel {
        float: left;
        margin-left: 10px
        }

        #divDados {
            clear: both ;
             float: left;
             margin-left: 2px;
             margin-top: 2px
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divDia">
  
        <uc1:wucListaDia runat="server" ID="cboDia" />
    </div>

    <div id="divExcel">
        <uc1:wucBotaoExcel runat="server" id="btnExcel" CallGridViewID ="grid" />
    </div>

    <div id="divDados">
        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="CPF" Width="1020px">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CPF" ReadOnly="True" VisibleIndex="2">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NomeCompleto" FixedStyle="Left" VisibleIndex="0" Width="250px">
                    <CellStyle BackColor="#FFFFCC" Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PIS" VisibleIndex="3">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CarteiraDeTrabalho" VisibleIndex="4" Caption="Carteira de Trabalho Com Serie">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DataNascimento" VisibleIndex="5">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="LocalNascimento" VisibleIndex="6">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UFNascimento" VisibleIndex="7">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EstadoCivil" VisibleIndex="8">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NomeDoConjuge" VisibleIndex="9">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NomeDoPai" VisibleIndex="10">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NomeDaMae" VisibleIndex="11">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Sexo" VisibleIndex="12" Width="40px">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NumeroDoRG" VisibleIndex="13" Caption="Numero do RG/CNH/CTPS">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OrgaoEmissorRG" VisibleIndex="14" Caption="Orgao Emissor RG/CNH/CTPS">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UFRG" VisibleIndex="15" Caption="UF do RG/CNH/CTPS" Width="50px">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DOC" VisibleIndex="16" Caption="DOC (Data de Emissão) RG/CNH/CTPS">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Ocupacao" VisibleIndex="17" Caption="Ocupação">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DataDeAdmissao" VisibleIndex="18">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Endereco" VisibleIndex="19" Caption="Endereço (Rua, Av, Etc)">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Bairro" VisibleIndex="20">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cidade" VisibleIndex="21">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UF" VisibleIndex="22" Width="30px">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CEP" VisibleIndex="23">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DDD" VisibleIndex="24">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Telefone" VisibleIndex="25">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="26">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GrauDeInstrucao" VisibleIndex="27" Caption="Grau de Instrução">
                    <CellStyle Wrap="False" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Renda" VisibleIndex="28" Caption="Renda Valor">
                    <PropertiesTextEdit DisplayFormatString="{0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CtaDestinoBanco" VisibleIndex="29">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ctaDestinoAgencia" VisibleIndex="30">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ctaDestinoDV" VisibleIndex="32">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NomeReduzido" VisibleIndex="1">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior ColumnResizeMode="Control" />
            <SettingsPager PageSize="20">
            </SettingsPager>
            <Settings HorizontalScrollBarMode="Visible" ShowFilterRow="True" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#F0F0F0">
                </AlternatingRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerTesourariaConnectionString %>" SelectCommand="usp_GerarExcel" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                <asp:SessionParameter Name="Dia" SessionField="sDIA" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>

