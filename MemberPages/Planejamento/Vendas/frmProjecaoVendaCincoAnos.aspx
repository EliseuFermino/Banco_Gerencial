<%@ Page Title="Projecao de Vendas - 5 Anos" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="frmProjecaoVendaCincoAnos.aspx.vb" Inherits="MemberPages_Planejamento_Vendas_frmProjecaoVendaCincoAnos" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
       
   <div id="divBotaoExcel" style="float:left; padding-top:5px; padding-left:5px; padding-bottom:5px">
       <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="ASPxGridView1"/>
   </div>

   <div id="divBotaoAtualizar" style="float:left; padding-top:5px; padding-left:5px">
       <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme ="Metropolis" Height="32px"></dx:ASPxButton>
   </div>

     
    <div id="divDados" style="padding:5px">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" Width="1550px" KeyFieldName="idFilial">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Ano_M2" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Ano_M1" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Ano_0" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Ano_1" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Ano_2" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Ano_3" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Ano_4" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Ano_5" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Ano_6" SummaryType="Sum" />

                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percM1" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc0" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc1" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc2" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc3" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc4" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc5" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc6" SummaryType="Custom" />
            </TotalSummary>
            <Columns>
                <dx:GridViewDataTextColumn Caption="Filial" FieldName="DescFilial" VisibleIndex="0" Width="150px">
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="2014" FieldName="Ano_0" ReadOnly="True" VisibleIndex="4" Width="100px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle ForeColor="#009900">
                    </CellStyle>
                    <FooterCellStyle ForeColor="#009900">
                    </FooterCellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="2015" FieldName="Ano_1" ReadOnly="True" VisibleIndex="6" Width="100px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="perc1" ReadOnly="True" VisibleIndex="7" Width="50px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="2016" FieldName="Ano_2" ReadOnly="True" VisibleIndex="8" Width="100px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="perc2" ReadOnly="True" VisibleIndex="9" Width="50px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="2017" FieldName="Ano_3" ReadOnly="True" VisibleIndex="10" Width="100px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="perc3" ReadOnly="True" VisibleIndex="11" Width="50px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="2018" FieldName="Ano_4" ReadOnly="True" VisibleIndex="12" Width="100px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="perc4" ReadOnly="True" VisibleIndex="13" Width="50px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="2019" FieldName="Ano_5" ReadOnly="True" VisibleIndex="14" Width="100px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="perc5" ReadOnly="True" VisibleIndex="15" Width="50px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="2020" FieldName="Ano_6" ReadOnly="True" VisibleIndex="16" Width="100px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="perc6" ReadOnly="True" VisibleIndex="17" Width="50px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="2013" FieldName="Ano_M1" VisibleIndex="2" Width="100px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle ForeColor="Blue">
                    </CellStyle>
                    <FooterCellStyle ForeColor="Blue">
                    </FooterCellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="perc0" VisibleIndex="5" Width="50px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="2012" FieldName="Ano_M2" VisibleIndex="1" Width="100px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle ForeColor="Blue">
                    </CellStyle>
                    <FooterCellStyle ForeColor="Blue">
                    </FooterCellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Perc" FieldName="percM1" VisibleIndex="3" Width="50px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="600" VerticalScrollBarMode="Visible" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#F0F0F0">
                </AlternatingRow>
                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF" Font-Bold="True">
                </FocusedRow>
                <Footer Font-Bold="True">
                </Footer>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="Metas.usp_BuscarProjecaoVenda5Anos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </div>

<%--    <dx:ASPxButton ID="BotaoExcel" runat="server" Text="Excel"></dx:ASPxButton>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1"></dx:ASPxGridViewExporter>--%>

</asp:Content>

