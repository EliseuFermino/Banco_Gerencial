<%@ Page Title="Analise de Despesas Com Indicadores" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="viewDespAnalitica.aspx.vb" Inherits="MemberPages_Despesas_viewDespAnalitica" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register Src="~/Controles/wucListaGrupo_Subgrupo.ascx" TagPrefix="uc1" TagName="wucListaGrupo_Subgrupo" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>






<%@ Register Src="~/Controles/wucListaGrupo_Subgrupo_work.ascx" TagPrefix="uc1" TagName="wucListaGrupo_Subgrupo_work" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>






<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">

        #divAno {
            float: left;
            margin-top: 2px;
            margin-left: 2px;
            border: 1px solid lightgray;
            height: 27px;
        }

        #divPeriodo {
            float: left;
            margin-top: 2px;
            margin-left: 10px;
            border: 1px solid lightgray;
        }

        #divGrupoSubgrupo{
            float: left;
            margin-top: 2px;
            margin-left: 10px;
            border: 1px solid lightgray;
            height: 27px;
        }

        #divAtualizar {
            float: left;            
            margin-left: 10px;           
        }

        #divDados {
            clear:both;
            float: left;
            padding-left: 5px;
            width: 99%;
            padding-top: 5px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" AutoPostBack="false" />
    </div>
    
    <div id="divPeriodo">
        <uc1:wuciListaMes runat="server" ID="cboMes" AutoPostBack="false" />
    </div>

    <div id="divAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divDados">

   

    <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName ="cbPanel" Theme ="Metropolis" >
        <PanelCollection>
                <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                    <dxwgv:ASPxGridView runat="server" AutoGenerateColumns="False" DataSourceID="dsDespesaTodasFiliais" Width="100%" ID="grid">
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="VALOR" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="listaGrupo" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Grupo de Despesa" FixedStyle="Left" Width="200px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="ListaSubgrupo" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Subgrupo de Despesa" FixedStyle="Left" Width="200px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="FilialDesc" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Filial" FixedStyle="Left" Width="150px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Dia" ShowInCustomizationForm="True" VisibleIndex="10">
                            <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy} ">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="AGENDA" ShowInCustomizationForm="True" VisibleIndex="11">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="FONTE" ShowInCustomizationForm="True" VisibleIndex="12" Width="150px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="VALOR" ShowInCustomizationForm="True" VisibleIndex="13" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                            <FooterCellStyle Font-Bold="True">
                            </FooterCellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="DESCRICAO" ShowInCustomizationForm="True" VisibleIndex="14" Caption="Descrição / Produto" Width="250px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="NOTA" ShowInCustomizationForm="True" VisibleIndex="15">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="OBSERVACOES" ShowInCustomizationForm="True" VisibleIndex="16" Caption="Observações" Width="150px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="CCUSTO" ShowInCustomizationForm="True" VisibleIndex="20" Caption="Centro de Custo" Width="200px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="idDepto" ShowInCustomizationForm="True" VisibleIndex="21">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="idSecao" ShowInCustomizationForm="True" VisibleIndex="22">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="DescPessoaAdmin" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Gestor da Conta" Width="100px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
</Columns>

                        <SettingsBehavior ColumnResizeMode="Control" />
                        <SettingsPager PageSize="22">
                        </SettingsPager>

<Settings VerticalScrollableHeight="505" HorizontalScrollBarMode="Visible" VerticalScrollBarMode="Auto" ShowFilterBar="Visible" ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True"></Settings>

<Styles>
<Header HorizontalAlign="Center"></Header>

<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>

<FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"></FocusedRow>

<HeaderPanel HorizontalAlign="Center"></HeaderPanel>
</Styles>
</dxwgv:ASPxGridView>
                    
                    <asp:SqlDataSource ID="dsDespesaTodasFiliais" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="usp_BuscarDespesaAnalitica_TodasLojas" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />                            
                        </SelectParameters>    
                    </asp:SqlDataSource>
                    
                </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>

         </div>

</asp:Content>

