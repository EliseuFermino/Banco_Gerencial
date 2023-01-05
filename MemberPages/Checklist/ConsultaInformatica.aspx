<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ConsultaInformatica.aspx.vb" Inherits="MemberPages_Checklist_ConsultaInformatica" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>

<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaDia.ascx" TagPrefix="uc1" TagName="wucListaDia" %>








<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divPeriodo {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        }    
        
        #divFez {            
            float: left;
            margin-left: 20px;
            margin-top: 5px;
        }              

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
             margin-top: 1px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divSize {            
            float: left;           
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divPeriodo">        
        <uc1:wucListaDia runat="server" ID="cboPeriodo" />
    </div>

    <div id="divFez">
        <asp:DropDownList ID="cboFez" runat="server">
            <asp:ListItem Selected="True" Value="2">Fez check-list da informática</asp:ListItem>
            <asp:ListItem Value="1">Não fez check-list da informática</asp:ListItem>
        </asp:DropDownList>
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>



    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>

                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" Width="400px">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Descricao" ShowInCustomizationForm="True" VisibleIndex="0" Width="175px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Matricula" ShowInCustomizationForm="True" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Hora" ShowInCustomizationForm="True" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Descricao1" ShowInCustomizationForm="True" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
                        <SettingsText EmptyDataRow="Nenhum check-list foi feito nesse dia." />
                        <Styles>
                            <AlternatingRow BackColor="#EFEFEF">
                            </AlternatingRow>
                        </Styles>
                    </dx:ASPxGridView>
                  
                 <%--Arraste seu controle aqui --%>                         
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="dbo.uspBuscarPergunta_Informatica" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Dia" SessionField="sDIA_INICIAL" Type="DateTime" />
                            <asp:SessionParameter Name="idFez" SessionField="sFEZ" Type="Byte" />                            
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>


