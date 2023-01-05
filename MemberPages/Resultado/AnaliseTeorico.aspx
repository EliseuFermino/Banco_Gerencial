<%@ Page Title="Analise Teorico" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseTeorico.aspx.vb" Inherits="MemberPages_Resultado_AnaliseTeorico" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>





<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {float: left;}
        #divMes {float: left;}
        #divOpcaoAno {float: left; margin-left:10px; margin-top: 4px}
        #divOpcaoMes {float: left; margin-left:10px; margin-top: 4px}
        #divBotaoAtualizar {float: left; margin-left:15px; margin-top: 2px}
        #divDados {clear:left; margin-left: 2px; padding-top: 2px}
        #divTextoZoom {float: left; margin-left:20px; margin-top: 5px;}
        #divSize {float: left; margin-left: 5px; margin-top: 4px;}
        #divExcel {float: left; margin-left:15px; margin-top: 2px}
        #divTextoOpcao {float: left; margin-left:20px; margin-top: 5px;}
        #divOpcao {float: left; margin-left: 5px; margin-top: 4px;}

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" AutoPostBack="False" />
    </div>

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" AutoPostBack="False" />
    </div>

    <div id="divOpcaoAno">
        <dx:ASPxRadioButton ID="rndAno" runat="server" Checked="true" GroupName="Opt" Text ="Ano Anterior"></dx:ASPxRadioButton>
    </div>

    <div id="divOpcaoMes">
        <dx:ASPxRadioButton ID="rndMes" runat="server" Checked="False" GroupName="Opt" Text="Mês Anterior"></dx:ASPxRadioButton>
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme ="Metropolis" >
            <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divTextoZoom">
        Zoom
    </div>

    <div id="divSize">
        <asp:DropDownList ID="cboSize" runat="server" AutoPostBack="True">
            <asp:ListItem Value="80">80%</asp:ListItem>
            <asp:ListItem Value="90">90%</asp:ListItem>
            <asp:ListItem Value="100">100%</asp:ListItem>                  
            <asp:ListItem Value="110">110%</asp:ListItem>
            <asp:ListItem Value="120">120%</asp:ListItem>
            <asp:ListItem Value="130">130%</asp:ListItem>
            <asp:ListItem Value="140">140%</asp:ListItem>
            <asp:ListItem Value="150">150%</asp:ListItem>
            <asp:ListItem Value="160">160%</asp:ListItem>
            <asp:ListItem Value="170">170%</asp:ListItem>
            <asp:ListItem Value="180">180%</asp:ListItem>
            <asp:ListItem Value="190">190%</asp:ListItem>
            <asp:ListItem Value="200">200%</asp:ListItem>
            <asp:ListItem Value="220">220%</asp:ListItem>
        </asp:DropDownList>  
    </div>

    <div id="divExcel">
        <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="ASPxGridView1" />
    </div>

    <div id="divTextoOpcao">
        Visualizar
    </div>
    
    <div id="divOpcao">
        <asp:DropDownList ID="cboOpcao" runat="server" AutoPostBack="True">
            <asp:ListItem Value="1">Análise</asp:ListItem>
            <asp:ListItem Value="2">Performance</asp:ListItem>
            <asp:ListItem Value="3">Tudo</asp:ListItem>
        </asp:DropDownList>        
    </div>
    
    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="1000px" ClientInstanceName="cbPanel" Theme ="Metropolis">
            <PanelCollection>
                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="nomeFilialLista" Width="1000px">
                        <Columns>
                            <dx:GridViewBandColumn Caption="Comparativo Resultado Final" ShowInCustomizationForm="True" VisibleIndex="1" Name="bandPerformance">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Real 2017" FieldName="vlrG47AA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#CECECE" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percG47AA" ShowInCustomizationForm="True" VisibleIndex="1" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#CECECE" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2018" FieldName="vlrG47AT" ShowInCustomizationForm="True" VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#CECECE" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percG47AT" ShowInCustomizationForm="True" VisibleIndex="3" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#CECECE" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difG47" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#CECECE" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percDifG47" ShowInCustomizationForm="True" VisibleIndex="5" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#CECECE" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="#CECECE" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Filial" FieldName="nomeFilialLista" ShowInCustomizationForm="True" VisibleIndex="0" Width="200px" FixedStyle="Left">
                                <CellStyle Wrap="False">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Margem" FieldName="Margem" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Quebra" FieldName="Quebra" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Operação Comercial" FieldName="OperComl" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle Wrap="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Despesas" FieldName="Despesa" ShowInCustomizationForm="True" VisibleIndex="5" Width="70px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Pessoal" FieldName="Pessoal" ShowInCustomizationForm="True" VisibleIndex="6" Width="70px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Resultado Operacional" FieldName="ResOper" ShowInCustomizationForm="True" VisibleIndex="7" Width="75px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle Wrap="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Ultima Linha" FieldName="Ultima" ShowInCustomizationForm="True" VisibleIndex="8" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle Wrap="True" />
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Crescimento em %" ShowInCustomizationForm="True" VisibleIndex="9">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Despesa" FieldName="percCrescDespesa" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difCresc" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="percCrescVenda" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" HorizontalScrollBarMode="Auto" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F2F2F2">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF99" Font-Bold="True" ForeColor="#0066FF">
                            </FocusedRow>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="Resultados.uspBuscarAnaliseTeorico" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="Ano_MA" SessionField="sANO_MA" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

</asp:Content>

