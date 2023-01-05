<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Meta_Comercial_7.aspx.vb" Inherits="MemberPages_Planejamento_Comercial_Meta_Comercial_7" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wuciListaMesPeriodo.ascx" TagPrefix="uc1" TagName="wuciListaMesPeriodo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

        <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divMes {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoAtualizar {            
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
            margin-top: 2px;
        }

    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" />
    </div>


    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent>

                        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" Width="100%" AutoGenerateColumns="False">
                                                        

                            <Settings HorizontalScrollBarMode="Visible" />
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Ano" ShowInCustomizationForm="True" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Departmento" FieldName="descProdutoDeptoLista" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                                                        

                        </dx:ASPxGridView>


                      <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="Comercial.usp_Buscar_Meta_Comercial" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="Mes_Final" SessionField="sMES_FINAL" Type="Byte" />
                            <asp:SessionParameter Name="idTipoLista" SessionField="sTIPO_LISTA" Type="Byte" DefaultValue="0" />
                            <asp:SessionParameter Name="Matricula" SessionField="sMATRICULA" Type="String" DefaultValue="0" />                            
                        </SelectParameters>
                    </asp:SqlDataSource>


                    </dx:PanelContent>
                </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

</asp:Content>

