<%@ Page Title="Cadastro de Metas de Venda - Orçamento" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="frmCadVendaPosto_Comb.aspx.vb" Inherits="MemberPages_Planejamento_Vendas_frmCadVendaPosto_Comb" Culture="pt-BR" uiCulture="pt-BR" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register src="../../../Controles/wucListaSecao.ascx" tagname="wucListaSecao" tagprefix="uc3" %>

<%@ Register src="../../../Controles/wucListaPosicao.ascx" tagname="wucListaPosicao" tagprefix="uc4" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc2" %>
<%@ Register src="../../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc5" %>


<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
        <style type="text/css">       
        
        

        #divAno {
            float: left;
            margin-left: 2px;
        }

        #divMes {
            float: left;
            margin-left: 2px;
        }

        #divFilial {
            float: left;
            margin-left: 2px;
        }

        #divSecao {
            float: left;
            margin-left: 2px;
            width: 200px;
        }

        #divAnalise {
            clear: both;
            Float: left;
            margin-left: 2px;                  
        }

        #divDados {
            clear: both;
            Float: left;
            margin-left: 2px;            
        }

        #divCalendario {
            clear: both;
            Float: left;
            margin-left: 2px;            
        }

        #divBotaoAtualizar {
            float: left;
            padding-left: 10px;
            margin-left: 10px;
        }

  
         /*velho*/   
             
        .style8
        {
            width: 282px;
        }
        .style9
        {
            width: 900px;
            border-collapse: collapse;
        }       

        .style38
        {
            width: 54px;
            text-align: center;
            color: #FFFFFF;
        }
        .style31
        {
            width: 68px;
            color: #FFFFFF;
        }
        .style16
        {
            width: 53px;
            text-align: center;
            color: #FFFFFF;
        }
        .style26
        {
            width: 70px;
            text-align: center;
            color: #FFFFFF;
        }
        .style27
        {
            width: 54px;
            color: #FFFFFF;
        }
        .style40    /*Exclua-me depois*/
        {
            width: 1px;
        }
        .style41
        {
            width: 69px;
            color: #FFFFFF;
        }
        .style50
        {
            width: 51px;
            color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .style46
        {
            width: 5px;     /*Exclua-me depois*/
        }
        .style13
        {
            width: 75px;
            color: #FFFFFF;
            background-color: #3399FF;
        }
        .style28
        {
            width: 53px;
            color: #FFFFFF;
            background-color: #3399FF;
        }
        .style49    /*Exclua-me depois*/
        {
            width: 8px;
        }
        .style34
        {
            width: 198px;
        }
        
        
        /***** LEGENDAS ********
         TB = TextBox         
         B = Branco
         V = Verde
         C = Cinza
         ***********************/  
        .style37    /*Formatação para os TextBox - Fundo BRANCO*/
        {
            width: 69px;
            text-align:right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif; font-size: small;
        }
       .Padrao_V {
            width: 69px;
            text-align:right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #CCFFCC;
            font-family: Arial, Helvetica, sans-serif; font-size: small;
        }     
       .Padrao_C {
            width: 69px;
            text-align:right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #CCCCCC;
            font-family: Arial, Helvetica, sans-serif; font-size: small;
        }          
        .Divisoria {
            width: 1px;            
        }            
        .TB_Vlr_B {
            width: 65px;
            text-align:right;
            color: #0000FF;                 
        }
         .TB_Perc_B {
            width: 50px;
            text-align:right;
            color: #0000FF;                 
        }
       .TB_Vlr_V {
            width: 65px;
            text-align:right;
            color: #0000FF;
            background-color: #CCFFCC;                  
        } 
         .TB_Perc_V {
            width: 50px;
            text-align:right;
            color: #0000FF;  
            background-color: #CCFFCC;                           
        }                       
        .VendaAno_B {
            color:#006600; 
            width: 70px;                       
        }
        .PartVendaAno_B {
            color:#006600; 
            width: 50px;                       
        } 
       .DescMes_B
        {
            color: #000000;
            background-color:#FFFFFF;
            border: 1px solid #808080;
            padding-left: 4px; 
        }
        .DescMes_V
        {
            color: #000000;
            background-color:#CCFFCC;
            border: 1px solid #808080;
            padding-left: 4px; 
        }    
        .Cabecalho_Vlr
        {            
            color: #FFFFFF;
            text-align: center;
            background-color: #000099;
            border: 1px solid #808080;            
        }           
        .Cabecalho_V
        {            
            color: #FFFFFF;
            text-align: center;
            background-color: #009900;
            border: 1px solid #808080;            
        }           
         
        .style19    /*Excluir Depois*/
        {
            width: 54px;
        }
        .style32
        {
            width: 68px;
        }
        .style36
        {
            width: 53px;
        }
        .style39
        {
            width: 70px;
        }
        .style51
        {
            width: 51px;
        }
        .style33
        {
            width: 75px;
        }
        .style52
        {
            color: #000000;
        }
        .style53    /*Excluir Depois*/
        {
            color: #000000;
            border: 1px solid #808080;
        }
 
        .style54
        {
            width: 100%;
        }      
        .style56
        {
            width: 280px;
        }
        .style58
        {
            width: 100%;
            border: 1px solid #C7DFFF;
        }
        .style59
        {
            width: 490px;
        }
        .style60
        {
            width: 452px;
        }
        .style61
        {
            width: 10px;
        }
        
  /*-------- POSTO NOVO table --------------------------------------------*/

            #customers {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 800px;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }

            #customers td, #customers th {
              border: 1px solid #ddd;
              padding: 8px;
              font-size:large;
            }

            #customers tr:nth-child(odd){background-color: #e9e5e5;}

            #customers th {
              padding-top: 10px;
              padding-bottom: 10px;
              text-align: center;
              background-color:gray ;
              color: white;
            }

            .txt_Font {
                font-size: large;
            }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
       
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>


        <div id="divAno">
            <uc1:wucAno ID="cboAno" runat="server" AutoPostBack="true" />
        </div>

        <div id="divMes">
            <uc1:wuciListaMes runat="server" ID="cboMes" AutoPostBack="True" LabelDescMes="Mês: " />
        </div>

        <div id="divFilial">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial"  AutoPostBack="true"/>
        </div>



        <div id="divDados">
            <%--<dx:ASPxCallbackPanel ID="cbPanelDados" runat="server" Width="1200px" ClientInstanceName="cbPanelDados">
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both"> --%>


                        <table id="customers">
                            <tr>
                                <th>Mes</th>
                                <th>
                                    <asp:Label ID="lbl_Caption_Hist_AA2" runat="server" Font-Bold="False" Text="Label"></asp:Label>
                                </th>
                                <th>
                                    <asp:Label ID="lbl_Caption_Hist_AA1" runat="server" Font-Bold="False" Text="Label"></asp:Label>
                                </th>                               
                                <th style="width:110px; background-color:#006600;">
                                    <asp:Label ID="lbl_Caption_vlrMeta" runat="server" Font-Bold="False" Text="Label"></asp:Label>
                                </th>
                                <th style="width:70px; background-color:#006600;" >
                                    <asp:Label ID="lbl_Caption_Cresc_Meta" runat="server" Font-Bold="False" Text="Label"></asp:Label>
                                </th>                            
                                <th style="width:70px; " >
                                    <asp:Label ID="lbl_Caption_Cresc_Hist_AA1" runat="server" Font-Bold="False" Text="Label"></asp:Label>
                                </th>
                            </tr>

                            <tr>
                                <td>01-Gasolina Comum</td> 
                                <td align="right"><asp:Label ID="lbl_Hist_AA2_01" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>     
                                <td align="right"><asp:Label ID="lbl_Hist_AA1_01" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>                              
                                <td align="right"><dxe:ASPxTextBox ID="txt_Meta_01" Text="0,00" BackColor="#efeeef" runat="server" AutoPostBack="True"  CssClass="txt_Font" ForeColor="#336600" Width=100px HorizontalAlign="Right" Native="true" Border-BorderStyle="None" DisplayFormatString="{0:n0}">
                                                                   <Border BorderStyle="None"></Border></dxe:ASPxTextBox></td> 
                                <td align="right"><dxe:ASPxTextBox ID="txt_Perc_Meta_01" Text="0,00" BackColor="#efeeef" runat="server" AutoPostBack="True"  CssClass="txt_Font" ForeColor="#336600" Width="80px" HorizontalAlign="Right" Native="true" Border-BorderStyle="None" DisplayFormatString="{0:n2}">
                                                                    <Border BorderStyle="None"></Border></dxe:ASPxTextBox></td>                            
                                 <td align="right"><asp:Label ID="Label11" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>                       
                            </tr>

                             <tr>
                                <td>02-Gasolina Aditivada</td>  
                                <td align="right"><asp:Label ID="lbl_Hist_AA2_02" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>     
                                <td align="right"><asp:Label ID="lbl_Hist_AA1_02" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>                                   
                                <td align="right"><dxe:ASPxTextBox ID="txt_Meta_02" Text="0,00" BackColor="#e9e5e5" runat="server" AutoPostBack="True"  CssClass="txt_Font" ForeColor="#336600" Width="100px" HorizontalAlign="Right" Native="true" Border-BorderStyle="None" DisplayFormatString="{0:n0}">
                                                                    <Border BorderStyle="None"></Border></dxe:ASPxTextBox></td> 
                                <td align="right"><dxe:ASPxTextBox ID="txt_Perc_Meta_02" Text="0,00" BackColor="#e9e5e5" runat="server" AutoPostBack="True"  CssClass="txt_Font" ForeColor="#336600" Width="90px" HorizontalAlign="Right" Native="true" Border-BorderStyle="None" DisplayFormatString="{0:n2}">
                                                                    <Border BorderStyle="None"></Border></dxe:ASPxTextBox></td>                                
                                <td align="right"><asp:Label ID="Label12" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>                               
                            </tr>

                            <tr>
                                <td>01-Alcool Comum</td> 
                                <td align="right"><asp:Label ID="lbl_Hist_AA2_03" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>     
                                <td align="right"><asp:Label ID="lbl_Hist_AA1_03" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>                              
                                <td align="right"><dxe:ASPxTextBox ID="txt_Meta_03" Text="0,00" BackColor="#efeeef" runat="server" AutoPostBack="True"  CssClass="txt_Font" ForeColor="#336600" Width="100px" HorizontalAlign="Right" Native="true" Border-BorderStyle="None" DisplayFormatString="{0:n0}">
                                                                   <Border BorderStyle="None"></Border></dxe:ASPxTextBox></td> 
                                <td align="right"><dxe:ASPxTextBox ID="txt_Perc_Meta_03" Text="0,00" BackColor="#efeeef" runat="server" AutoPostBack="True"  CssClass="txt_Font" ForeColor="#336600" Width="80px" HorizontalAlign="Right" Native="true" Border-BorderStyle="None" DisplayFormatString="{0:n2}">
                                                                    <Border BorderStyle="None"></Border></dxe:ASPxTextBox></td>                            
                                 <td align="right"><asp:Label ID="Label13" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>                                                      
                            </tr>

                            <tr>
                                <td>01-Diesel S10</td> 
                                <td align="right"><asp:Label ID="lbl_Hist_AA2_04" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>     
                                <td align="right"><asp:Label ID="lbl_Hist_AA1_04" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>                                   
                                <td align="right"><dxe:ASPxTextBox ID="txt_Meta_04" Text="0,00" BackColor="#e9e5e5" runat="server" AutoPostBack="True"  CssClass="txt_Font" ForeColor="#336600" Width="100px" HorizontalAlign="Right" Native="true" Border-BorderStyle="None" DisplayFormatString="{0:n0}">
                                                                    <Border BorderStyle="None"></Border></dxe:ASPxTextBox></td> 
                                <td align="right"><dxe:ASPxTextBox ID="txt_Perc_Meta_04" Text="0,00" BackColor="#e9e5e5" runat="server" AutoPostBack="True"  CssClass="txt_Font" ForeColor="#336600" Width="90px" HorizontalAlign="Right" Native="true" Border-BorderStyle="None" DisplayFormatString="{0:n2}">
                                                                    <Border BorderStyle="None"></Border></dxe:ASPxTextBox></td>                                
                                <td align="right"><asp:Label ID="Label14" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>                               
                            </tr>

                            <tr>
                                <td>02-Diesel S500</td> 
                                <td align="right"><asp:Label ID="lbl_Hist_AA2_05" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>     
                                <td align="right"><asp:Label ID="lbl_Hist_AA1_05" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>                              
                                <td align="right"><dxe:ASPxTextBox ID="txt_Meta_05" Text="0,00" BackColor="#efeeef" runat="server" AutoPostBack="True"  CssClass="txt_Font" ForeColor="#336600" Width="100px" HorizontalAlign="Right" Native="true" Border-BorderStyle="None" DisplayFormatString="{0:n0}">
                                                                   <Border BorderStyle="None"></Border></dxe:ASPxTextBox></td> 
                                <td align="right"><dxe:ASPxTextBox ID="txt_Perc_Meta_05" Text="0,00" BackColor="#efeeef" runat="server" AutoPostBack="True"  CssClass="txt_Font" ForeColor="#336600" Width="80px" HorizontalAlign="Right" Native="true" Border-BorderStyle="None" DisplayFormatString="{0:n2}">
                                                                    <Border BorderStyle="None"></Border></dxe:ASPxTextBox></td>                            
                                 <td align="right"><asp:Label ID="Label15" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>                                                      
                            </tr>
                            <tr>
                                <td></td> 
                                <td style="text-align:right; background-color:#d7d1d1"><asp:Label ID="lbl_Hist2_Total" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>     
                                <td style="text-align:right; background-color:#d7d1d1">
                                    <dxe:ASPxTextBox ID="lbl_Hist1_Total" runat="server" BackColor="#d7d1d1" CssClass="txt_Font"  HorizontalAlign="Right" Native="True" Text="0,00" Width="100px" ReadOnly="True">
                                        <Border BorderStyle="None" />
                                    </dxe:ASPxTextBox>
                                </td>                              
                                <td style="text-align:right; background-color:#d7d1d1">
                                    <dxe:ASPxTextBox ID="lbl_Meta_Total" runat="server" BackColor="#D7D1D1" CssClass="txt_Font" HorizontalAlign="Right" Native="True" ReadOnly="True" Text="0,00" Width="100px">
                                        <Border BorderStyle="None" />
                                    </dxe:ASPxTextBox>
                                </td> 
                                <td style="text-align:right; background-color:#d7d1d1"><asp:Label ID="lbl_Perc_Crescimento_Meta" Text="0,00" runat="server" BorderStyle="None" Width="80px"></asp:Label></td>                            
                                <td style="text-align:right; background-color:#d7d1d1"><asp:Label ID="Label18" Text="0,00" runat="server" BorderStyle="None" Width="65px"></asp:Label></td>                                                      
                            </tr>

                        </table>

 <%-------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>                        
                                                
                        <table class="style9">
                            <tr>
                                <td>
                   </td>
                 </tr>
                        </table>

                        <table class="style54">
                            <tr>
                                <td style="width:251px"><uc4:wucListaPosicao ID="cboPosicao" runat="server" /></td>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnSalvar1" runat="server" Text="Salvar" />
                                </td>
                                <td><asp:Label ID="lblDepto" runat="server" Text="?" BackColor="#FFFF99" ForeColor="#0066FF" Visible="False"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="4">

                                    <asp:Label ID="lblError" runat="server" BackColor="Yellow" Text="Label"></asp:Label>

                                </td>
                            </tr>
                        </table>

                    </ContentTemplate>
                </asp:UpdatePanel>         

                    <%--</dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>--%>
        </div>

        <div id="divAnalise">
                                    <dx:ASPxGridView ID="gridAnalise" runat="server" DataSourceID="dsAnaliseMeta" AutoGenerateColumns="False">
                                        <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA2" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA1" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA2_AA1" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA1_Real" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescMeta" SummaryType="Custom" />
                                        </TotalSummary>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="0" SortIndex="0" SortOrder="Ascending">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrVendaAA2" VisibleIndex="1" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrVendaAA1" VisibleIndex="2" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrVenda" ReadOnly="True" VisibleIndex="4" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrMeta" ReadOnly="True" VisibleIndex="6" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#336600" ForeColor="White" />
                                                <CellStyle ForeColor="#336600">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#336600">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percCrescAA2_AA1" ReadOnly="True" VisibleIndex="3" Caption="% Cresc">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percCrescAA1_Real" ReadOnly="True" VisibleIndex="5">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percCrescMeta" ReadOnly="True" VisibleIndex="7">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Settings ShowFooter="True" ShowTitlePanel="True" />
                                        <SettingsText Title="Análise de Venda Mensal da Loja" />
                                        <Styles>
                                            <Header HorizontalAlign="Center">
                                            </Header>
                                            <AlternatingRow BackColor="#EAEAEA">
                                            </AlternatingRow>
                                            <Footer Font-Bold="True">
                                            </Footer>
                                            <TitlePanel Font-Size="X-Large">
                                            </TitlePanel>
                                        </Styles>
                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="dsAnaliseMeta" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Metas.uspPlanejamento_AnaliseMetaVendaMes" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                            <asp:SessionParameter Name="idPosicao" SessionField="sPOSICAO" Type="Byte" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
        </div>

 
</asp:Content>

