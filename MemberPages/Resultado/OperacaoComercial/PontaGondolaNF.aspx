<%@ Page Title="Ponta de Gondola por NF" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="PontaGondolaNF.aspx.vb" Inherits="MemberPages_Resultado_OperacaoComercial_PontaGondolaNF" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>






<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type ="text/css" >
           
 
        #divAno {
            float: left;            
        }

        #divMes {
            float: left;
        }

        #divFilial {
            float: left;
            width: 330px;
            padding-left: 2px;
        }

        #divBotaoAtualizar {
            float: left;
            padding-left: 3px;
            padding-top: 2px;
        }

        #divCheckFixar {            
            float: left;            
        }

        #divBotaoAtualizar {
            float: left;
            padding-left: 3px;
            padding-top: 2px;
        }

        #divBotaoExcel {
            float: left;
            padding-left: 3px;
            padding-top: 2px;
        }

        #divAgendas {
            clear: both;
            float: left;
            padding-left: 3px;
            padding-top: 2px;
        }

        #divAg249 {
            float: left;           
        }

        #divAg500 {
            float: left;   
             padding-left: 7px;        
        }

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 25px;
            margin-left: 1px;  
            margin-top: 2px;          
        }

        #divGrid {
            clear: both;
            float: left; 
            margin-left: 2px;           
        }

        #divObservacao {
            clear: both;
            float: left;  
            font-style:italic;         
        }

        #divAberturaAno {
            clear: both;
            float: left;  
            padding: 20px 20px 20px 20px;       
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


        <div id="divAno" class="myBorder">
            <uc1:wucAno runat="server" ID="cboAno" />
        </div>

        <div id="divMes" class="myBorder">
            <uc1:wuciListaMes runat="server" ID="cboMes" />
        </div>   
        
        <div id="divFilial" class="myBorder">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>
        
        <div id="divCheckFixar" class="myBorder">
            <dx:ASPxCheckBox ID="chkFixar" runat="server" Text="Fixar Cabeçalho" Checked="True" CheckState="Checked">
                <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
            </dx:ASPxCheckBox>
        </div>     
        
        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme="Metropolis" AutoPostBack="False">
                <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
            </dx:ASPxButton>
        </div>  
        
        <div id="divBotaoExcel">
            <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" GuiaNome="Agenda 245" />
        </div>  

        <div id="divAgendas">

            <div id="divAg249">                
                <dx:ASPxRadioButton ID="rndAg249" Text="Ponta de Gondola" GroupName="Agendas"  AutoPostBack="false" runat="server" Visible="False"></dx:ASPxRadioButton>
            </div>

            <div id="divAg500">
                <dx:ASPxRadioButton ID="rndAg500" Text="Sell-Out" GroupName="Agendas" Checked="True" AutoPostBack="false" runat="server"></dx:ASPxRadioButton>                
            </div>

        </div>
        
        <div id="divGrid">
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="1000px" ClientInstanceName="cbPanel" Theme="Metropolis">
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">
                        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="DiaEmissao" Width="800px">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAgenda" SummaryType="Sum" />
                            </TotalSummary>
                            <GroupSummary>
                                <dx:ASPxSummaryItem DisplayFormat="Total de {0:n0}" FieldName="vlrAgenda" SummaryType="Sum" />
                            </GroupSummary>
                            <Columns>
                                <dx:GridViewDataDateColumn FieldName="DiaEmissao" ShowInCustomizationForm="True" VisibleIndex="2" ToolTip="Data da Emissão do acordo" Width="70px">
                                    <Settings AllowAutoFilter="False" AutoFilterCondition="Contains" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataDateColumn FieldName="DiaPagto" ShowInCustomizationForm="True" VisibleIndex="4" ToolTip="Data do Pagamento do acordo" Width="70px" Caption="Vencimento">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataDateColumn>
<dx:GridViewDataTextColumn FieldName="Situacao" ShowInCustomizationForm="True" Width="60px" Caption="Situção" VisibleIndex="5">
    <Settings AutoFilterCondition="Contains" />
    <CellStyle HorizontalAlign="Center">
    </CellStyle>
</dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="idForn" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Cod" ToolTip="Código do fornecedor" Width="70px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="numDoc" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Nº Acordo" ToolTip="Numero do Acordo da agenda 249" Width="70px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrAgenda" ShowInCustomizationForm="True" VisibleIndex="3" Caption="R$" ToolTip="Valor do acordo (agenda 249). O valor total é que vai para o Teórico." Width="60px">
                                    <Settings AllowAutoFilter="False" />
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="nomeFornecedor" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Fornecedor" ToolTip="Nome do fornecedor" Width="250px">
                                    <Settings AutoFilterCondition="BeginsWith" />
                                    
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle Wrap="False" ForeColor="Blue">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowGroupPanel="True" ShowFilterRow="True" />
                            <SettingsText EmptyDataRow="Não informações de Ponta de Gondola para este período e loja" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                            <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#EFEFEF">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFFCC" ForeColor="Blue">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="uspBuscarAgenda249NF" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter Name="idAgenda" SessionField="sAGENDA" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    <div id="divObservacao">
                        <asp:Label ID="lblDesc" runat="server" Text=""></asp:Label> 
                    </div> 

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

            
        </div>  
        
     
</asp:Content>

