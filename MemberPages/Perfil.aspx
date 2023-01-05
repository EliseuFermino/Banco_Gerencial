<%@ Page Title="Ranking Anual" Language="VB" MasterPageFile= "~/MemberPages/Site.master"  AutoEventWireup="false" CodeFile="Perfil.aspx.vb" Inherits="MemberPages_RankingAno" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>



<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxp" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <table cellspacing="1" class="style1">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="Panel1" runat="server" Width="400px">
                                <table cellspacing="1" class="style9">
                                    <tr>
                                        <td>
                                            <uc1:wucAno runat="server" ID="cboAno" /> 
                                        </td>
                                        <td>
                                            <uc1:wuciListaMes runat="server" ID="cboMes" />
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                        AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/stylesHeader.css" 
                        CssPostfix="Office2003_Blue" DataSourceID="dsSuper" 
                        Width="1200px" KeyFieldName="idFilial">
                                <SettingsBehavior AllowFocusedRow="True" />
                                <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/stylesHeader.css" 
                            CssPostfix="Office2003_Blue">
                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                    </Header>
                                    <AlternatingRow BackColor="#EAF5FF">
                                    </AlternatingRow>
                                    <LoadingPanel ImageSpacing="10px">
                                    </LoadingPanel>
                                </Styles>
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                    <CollapsedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                Width="11px" />
                                    <ExpandedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" 
                                Width="11px" />
                                    <DetailCollapsedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                Width="11px" />
                                    <DetailExpandedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" 
                                Width="11px" />
                                    <FilterRowButton Height="13px" Width="13px" />
                                </Images>
                                <SettingsText EmptyDataRow="As informações para o Perfil deste período não foram atualizadas." 
                                    Title="Vendas por Hora - Empresa" />
                                <Columns>                                
                             <%--Descrição da Filial--%>
                                    <dxwgv:GridViewDataTextColumn Caption="Descrição da Filial" FieldName="DescFilial" 
                                         VisibleIndex="0" Width="110px">
                                        <HeaderStyle HorizontalAlign="Center" BackColor="#F0F0F0"/>
                                    </dxwgv:GridViewDataTextColumn>
                                    
                            <%--Faturamento--%>
                                    <dxwgv:GridViewDataTextColumn FieldName="Faturamento" VisibleIndex="1" 
                                        Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" BackColor="#009900" ForeColor="White"/>
                                        <CellStyle ForeColor="#009900">
                                            <BorderLeft BorderColor="#6699FF" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                   
                            <%--Eletro. Venda--%>
                                    <dxwgv:GridViewDataTextColumn FieldName="vlrVendaEletro" 
                                        VisibleIndex="3" Caption="Eletro. Venda" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="True" BackColor="#C6FFC6" ForeColor="#009900"/>
                                    </dxwgv:GridViewDataTextColumn>
                                    
                            <%--Nº. de Check-out--%>
                                    <dxwgv:GridViewDataTextColumn FieldName="numCheckOut" 
                                        VisibleIndex="4" Caption="Nº. de Check-out" Width="50px">
                                        <HeaderStyle HorizontalAlign="Center" Wrap="True" BackColor="#D5E2FF" ForeColor="#2D96FF"/>
                                        <CellStyle HorizontalAlign="Center">
                                            <BorderLeft BorderColor="#6699FF" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    
                            <%--Venda Total Check-out--%>
                                    <dxwgv:GridViewDataTextColumn FieldName="vlrVendaCheckOut" 
                                        VisibleIndex="5" Caption="Venda Total Check-out" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="True" BackColor="#71B8FF" ForeColor="White"/>
                                    </dxwgv:GridViewDataTextColumn>
                                    
                            <%--Venda Total Check-out Sem Eletro --%>
                                     <dxwgv:GridViewDataTextColumn FieldName="vlrVendaCheckOutSemEletro" 
                                        VisibleIndex="5" Caption="Venda Total Check-out Sem Eletro" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="True" BackColor="Orange" ForeColor="White"/>
                                        <CellStyle ForeColor="#0066FF"></CellStyle>                                        
                                    </dxwgv:GridViewDataTextColumn>
                                    
                            <%--Metro² Total--%>
                                    <dxwgv:GridViewDataTextColumn FieldName="MetroQuadrado" 
                                        VisibleIndex="6" Caption="Metro² Total" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="True"  BackColor="#D5E2FF" ForeColor="#2D96FF"/>
                                        <CellStyle HorizontalAlign="Right">
                                            <BorderLeft BorderColor="#6699FF" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    
                             <%--Venda Total por Metro²--%>
                                    <dxwgv:GridViewDataTextColumn FieldName="vlrVendaMetroQuadrado" 
                                        VisibleIndex="7" Caption="Venda Total por Metro²" Width="55px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="True" BackColor="#71B8FF" ForeColor="White"/> 
                                    </dxwgv:GridViewDataTextColumn>
                                    
                              <%--Venda Total por Metro² - Sem Eletro--%>
                                    <dxwgv:GridViewDataTextColumn FieldName="vlrVendaMetroQuadradoSemEletro" 
                                VisibleIndex="7" Caption="Venda Total por Metro² - Sem Eletro" Width="75px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="True" BackColor="Orange" ForeColor="White"/>
                                        <CellStyle ForeColor="#0066FF"></CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    
                              <%--Total de Func.--%>
                                    <dxwgv:GridViewDataTextColumn FieldName="numFuncionarios" 
                                        VisibleIndex="8" Caption="Total de Func. " Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="True"  BackColor="#D5E2FF" ForeColor="#2D96FF"/>
                                        <CellStyle HorizontalAlign="Right">
                                            <BorderLeft BorderColor="#6699FF" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    
                              <%--Venda por Func. Total--%>
                                    <dxwgv:GridViewDataTextColumn FieldName="vlrVendaFuncionarios" 
                                        VisibleIndex="9" Caption="Venda por Func. Total" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="True" BackColor="#71B8FF" ForeColor="White"/>
                                    </dxwgv:GridViewDataTextColumn>
                                    
                             <%--Venda por Func. Sem Eletro--%>
                                    <dxwgv:GridViewDataTextColumn FieldName="vlrVendaFuncionariosSemEletro" 
                                        VisibleIndex="9" Caption="Venda por Func. Sem Eletro" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="True" BackColor="Orange" ForeColor="White"/>
                                        <CellStyle ForeColor="#0066FF"></CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    
                             <%--Total de Clientes--%>
                                    <dxwgv:GridViewDataTextColumn FieldName="numClientes" 
                                        VisibleIndex="10" Caption="Total de Clientes" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="True"  BackColor="#D5E2FF" ForeColor="#2D96FF"/>
                                        <CellStyle HorizontalAlign="Right">
                                            <BorderLeft BorderColor="#6699FF" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    
                             <%--Ticket Médio Total--%>
                                    <dxwgv:GridViewDataTextColumn FieldName="vlrVendaClientes" 
                                        VisibleIndex="11" Caption="Ticket Médio Total" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="True" BackColor="#71B8FF" ForeColor="White"/>
                                        <CellStyle HorizontalAlign="Right">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    
                             <%--Ticket Médio Total Sem Eletro--%>
                                    <dxwgv:GridViewDataTextColumn FieldName="vlrVendaClientesSemEletro" 
                                        VisibleIndex="11" Caption="Ticket Médio Total Sem Eletro" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="True" BackColor="Orange" ForeColor="White"/>
                                        <CellStyle HorizontalAlign="Right">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    
                                    
                                    
                                    <dxwgv:GridViewDataTextColumn FieldName="numTicket" 
                                VisibleIndex="12" Visible="False">
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="vlrVendaTicket" 
                                VisibleIndex="13" Visible="False">
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <Settings ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="450" ShowTitlePanel="True" />
                                <StylesEditors>
                                    <ProgressBar Height="25px">
                                    </ProgressBar>
                                </StylesEditors>
                            </dxwgv:ASPxGridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource ID="dsSuper" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>"                    
                        
                        
                        SelectCommand="SELECT idFilial, DescFilial, vlrVenda, numCheckOutEletro, vlrVendaEletro, numCheckOut, vlrVendaCheckOut, MetroQuadrado, vlrVendaMetroQuadrado, numFuncionarios, vlrVendaFuncionarios, numClientes, vlrVendaClientes, TipoFilial, Faturamento, TipoClassificacao, vlrVendaCheckOutSemEletro, vlrVendaMetroQuadradoSemEletro, vlrVendaFuncionariosSemEletro, vlrVendaClientesSemEletro  FROM tblPerfil WHERE (Ano = @Ano) AND (Mes = @Mes)  ORDER BY TipoClassificacao, idFilial">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <dxwgv:ASPxGridViewExporter ID="ExporterExcel1" runat="server" 
                        GridViewID="ASPxGridView1">
                    </dxwgv:ASPxGridViewExporter>
                </td>
            </tr>
        </table>
        <table cellspacing="1" class="style9">
            <tr>
                <td align="left">
                <dxe:ASPxButton ID="btnExportar" runat="server" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    Text="Exportar para Excel" Width="150px">
                </dxe:ASPxButton>
                </td>
            </tr>
        </table>
        <br />
    </p>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="HeadContent">

    <style type="text/css">
        .style4
        {
            width: 208px;
        }
        .style9
        {
            width: 100%;
        }
    </style>

    </asp:Content>


