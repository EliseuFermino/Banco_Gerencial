<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ListaDeConcorrentes.aspx.vb" Inherits="MemberPages_Concorrrentes_ListaDeConcorrentes" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



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

    <div id="divDados">
        
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="CNPJ_Principal" Width="1000px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrNR1" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Ranking" VisibleIndex="0" Width="60px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CNPJ_Principal" VisibleIndex="1" Width="100px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="nomeFantasia" VisibleIndex="2" Width="250px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="TotalDeLojas" VisibleIndex="3" Width="90px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Stituacao" ReadOnly="True" VisibleIndex="4" Width="150px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrOri" VisibleIndex="5" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager PageSize="20">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" ShowTitlePanel="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Auto" />
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
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerConcorConnectionString %>" SelectCommand="SELECT * FROM [vw_Ranking_por_CNPJ_Principal]">
                    </asp:SqlDataSource>

    </div>


</asp:Content>

