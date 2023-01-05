<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="telaCategoriaDet.aspx.vb" Inherits="MemberPages_Despesas_Cadastro_telaCategoriaDet" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >
       
        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        #divSize {            
            float: left;           
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>

    <div id="divDados">
 
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="idDet" Width="1000px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrNR1" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewBandColumn Caption="DESPESA MES A MES" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="ID" FieldName="idDet" ReadOnly="True" ToolTip="Código da despesa na planilha DESPESA MES A MES" VisibleIndex="0" Width="40px">
                                        <Settings AutoFilterCondition="Contains" />
                                        <HeaderStyle Font-Bold="True" />
                                        <CellStyle Font-Bold="False" ForeColor="Blue">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="1" Width="200px">
                                        <Settings AutoFilterCondition="Contains" />
                                        <HeaderStyle Font-Bold="True" />
                                        <CellStyle Font-Bold="False" ForeColor="Blue" Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Grupo" VisibleIndex="3">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="ID" FieldName="idGrupo" ToolTip="Código do Grupo de Despesa" VisibleIndex="0" Width="40px">
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descrição" FieldName="GrupoDesc" VisibleIndex="1" Width="200px">
                                        <Settings AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Sub-Grupo" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="ID" FieldName="idSubgrupo" VisibleIndex="0" Width="40px">
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descrição" FieldName="SubGrupoDesc" VisibleIndex="1" Width="200px">
                                        <Settings AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn FieldName="Memo" VisibleIndex="7" Width="200px">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle Wrap="True">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="idResFin" VisibleIndex="8" Width="40px" Caption="id Res Fin" ToolTip="Se a despesa esta no Resultado Financeiro">
                                <Settings AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F3F3F3">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>                    
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="Cadastros.uspBuscarCadastroCategoriaDet" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>

     
    </div>


</asp:Content>

