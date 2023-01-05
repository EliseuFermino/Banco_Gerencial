<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseMetaVenda.aspx.vb" Inherits="MemberPages_Planejamento_Vendas_AnaliseMetaVenda" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>



<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type ="text/css" >
       
       
        #divAno {
            float: left; 
            margin-top: 3px;           
        }  

        #divExcel {
            float: left;  
            padding-left : 10px;   
            margin-top: 3px;         
        }  

        #cboSize {
            float: left;  
            padding-left : 10px;   
            margin-top: 3px;         
        } 

        #divAtualizar {
            float: left;  
            padding-left : 10px;    
            padding-top: 5px;      
        }  
          
        .myBorder {
            border: 1px solid #bdbbbb;
            height: 25px;
            margin-left: 1px;  
            margin-top: 2px;          
        }

       #divDados {
        clear: both;
        float: left;
        padding-top: 5px;
        margin-left: 2px;
        width: 100%;
       }       
       
        
       #divMesmasLojas  {
        clear: both;
        float: left;
        padding-top: 5px;
        margin-left: 2px;
       }   
       
       #divObs  {
        clear: both;
        float: left;
        padding-top: 5px;
        margin-left: 2px;
       }                                  
       
   </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

           
        <div id="divAno" >
            <uc1:wucAno runat="server" ID="cboAno"  AutoPostBack="false" />            
        </div>

        <div id="divAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme="Metropolis"></dx:ASPxButton>
        </div>

        <div id="divExcel">
            <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="grid" />
        </div>

        <div id="divSize">
            <uc1:wucSize runat="server" ID="cboSize" CallSize="100" />
        </div>


        <div id="divDados">

            <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" KeyFieldName="nomeFilial">
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA1" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA2" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA3" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaLojas" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaComercial" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaEstatistica" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaDefinitiva" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Diferenca" SummaryType="Sum" />

                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pC_3s2" SummaryType="Custom" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pC_2s1" SummaryType="Custom" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pC_MLs1" SummaryType="Custom" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pC_MEs1" SummaryType="Custom" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pC_MCs1" SummaryType="Custom" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pC_MDs1" SummaryType="Custom" />
                
                </TotalSummary>
                <SettingsResizing ColumnResizeMode="Control" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="nomeFilial" VisibleIndex="0" Caption="Filial" FixedStyle="Left" Width="150px">
                        <CellStyle Wrap="False">
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewBandColumn Caption="Realizado" VisibleIndex="1">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="2011" FieldName="vlrAA3" VisibleIndex="0" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="2012" FieldName="vlrAA2" VisibleIndex="1" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="pC_3s2" ReadOnly="True" ToolTip="Percentual de Crescimento 2012 sobre 2011" VisibleIndex="2" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="2013" FieldName="vlrAA1" VisibleIndex="3" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle ForeColor="Blue">
                                </CellStyle>
                                <FooterCellStyle ForeColor="Blue">
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="pC_2s1" ReadOnly="True" VisibleIndex="4" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:GridViewBandColumn>
                    <dx:GridViewBandColumn Caption="Metas" VisibleIndex="4">
                        <Columns>
                            <%--Loja--%>
                            <dx:GridViewDataTextColumn Caption="Lojas" FieldName="vlrMetaLojas" VisibleIndex="0" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                                <CellStyle ForeColor="#009900">
                                </CellStyle>
                                <FooterCellStyle ForeColor="#009900">
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="pC_MLs1" ReadOnly="True" ToolTip="Percentual de Crescimento da Meta da Loja sobre o Ano de2013" VisibleIndex="1" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2} " EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataCheckColumn VisibleIndex="2" Caption="Status" FieldName="idStatus" Width="45px" ToolTip="Indicador que indica se a Meta da Loja esta igual a Meta Definitiva. Se a Meta da Loja estiver diferente o Status ficar vermelho, se a Meta da Loja estiver igual a Meta Definitiva o status fica verde.">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                </PropertiesCheckEdit>
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataCheckColumn>

                            <%--Comercial--%>
                            <dx:GridViewDataTextColumn Caption="Comercial" FieldName="vlrMetaComercial" VisibleIndex="3" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                                <CellStyle ForeColor="#009900">
                                </CellStyle>
                                <FooterCellStyle ForeColor="#009900">
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="pC_MCs1" ReadOnly="True" VisibleIndex="4" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Controladoria" FieldName="vlrMetaEstatistica" ReadOnly="True" VisibleIndex="5" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="pC_MEs1" VisibleIndex="6" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <%--Gilberto--%>
                            <dx:GridViewDataTextColumn Caption="Dir. Operações" FieldName="vlrMetaGilberto" VisibleIndex="7" Width="100px" ToolTip="Meta do Diretor de Operações">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="pC_MGs1" ReadOnly="True" VisibleIndex="8" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <%--Definitiva--%>



                        </Columns>
                    </dx:GridViewBandColumn>
                    <dx:GridViewBandColumn Caption="Meta Definitiva" VisibleIndex="5">
                        <HeaderStyle BackColor="#CCFFCC" ForeColor="#009900" />
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Definitiva" FieldName="vlrMetaDefinitiva" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                </PropertiesTextEdit>
                                <HeaderStyle BackColor="#CCFFCC" ForeColor="#009900" />
                                <CellStyle ForeColor="#009900">
                                </CellStyle>
                                <FooterCellStyle BackColor="#CCFFCC" ForeColor="#009900">
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Diferença" FieldName="Diferenca" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle BackColor="#CCFFCC" ForeColor="#009900" />
                                <FooterCellStyle BackColor="#CCFFCC">
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="pC_MDs1" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle BackColor="#CCFFCC" ForeColor="#009900" />
                                <FooterCellStyle BackColor="#CCFFCC">
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:GridViewBandColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" />
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
                <Styles>
                    <Header HorizontalAlign="Center">
                    </Header>
                    <AlternatingRow BackColor="#E9E9E9">
                    </AlternatingRow>
                    <FocusedRow BackColor="#FFFF66" ForeColor="#3399FF" Font-Bold="True">
                    </FocusedRow>
                    <Footer Font-Bold="True">
                    </Footer>
                </Styles>
            </dx:ASPxGridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerOrcamentoConnectionString %>" SelectCommand="SELECT nomeFilial, vlrAA3, vlrAA2, pC_3s2, vlrAA1, pC_2s1, vlrMetaLojas, pC_MLs1, vlrMetaComercial, pC_MCs1, vlrMetaEstatistica, pC_MEs1, vlrMetaGilberto, pC_MGs1, vlrMetaDefinitiva, pC_MDs1, idStatus, Diferenca FROM Analises.tblAnaliseVendas  WHERE Ano=2023"></asp:SqlDataSource>
  
        </div>

        <div id="divMesmasLojas">
            <dx:ASPxGridView ID="GridMesmas" runat="server" DataSourceID="dsMesmasLojas" AutoGenerateColumns="False" Theme="MaterialCompact">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Mesmas Lojas" FieldName="myNome" VisibleIndex="0" Width="100px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2011" FieldName="vlrAA1" VisibleIndex="2">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2012" FieldName="vlrAA2" VisibleIndex="1">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2013" FieldName="vlrAT" VisibleIndex="3">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2014" FieldName="vlrMeta" VisibleIndex="4">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings ShowTitlePanel="True" />
                <SettingsText Title="Crescimento Mesmas Lojas" />
                <Styles>
                    <AlternatingRow BackColor="#E9E9E9">
                    </AlternatingRow>
                </Styles>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="dsMesmasLojas" runat="server" ConnectionString="<%$ ConnectionStrings:gerOrcamentoConnectionString %>" SelectCommand="usp_PGR179_BuscarDados" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>

        <br />

   
        

</asp:Content>

