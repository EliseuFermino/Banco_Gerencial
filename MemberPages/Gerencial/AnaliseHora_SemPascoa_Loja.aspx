<%@ Page Title="Analise Vendas por Hora Sem Pascoa" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="AnaliseHora_SemPascoa_Loja.aspx.vb" Inherits="MemberPages_Gerencial_AnaliseHora_SemPascoa_Loja" %>

<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc1" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc2" %>

<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc5" %>

<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc6" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">

        .FormataPadrao {
            float: left;
            margin-left: 5px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno" class="FormataPadrao">
        <uc2:wucAno ID="cboAno" runat="server" />
    </div>

    <div id="divMes" class="FormataPadrao">
        <uc1:wuciListaMes ID="cboMes" runat="server" />
    </div>

    <div id="divFilial" class="FormataPadrao">
        <uc6:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
    </div>

    <div id="divBotaoAtualizar" class="FormataPadrao">
        <uc5:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
    </div>

    <div id="divContainer"  style="clear:both " class="FormataPadrao">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

        <div id="divG1" class="FormataPadrao">

            <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="dsVendaDia" 
                AutoGenerateColumns="False" EnableTheming="True" Theme="DevEx" 
                KeyFieldName="DiaReduzido" Width="350px">
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr1" 
                        SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2" 
                        SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr3" 
                        SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlr4" 
                        SummaryType="Custom" />
                </TotalSummary>
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Dia" FieldName="DiaReduzido" 
                        VisibleIndex="0" Width="60px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Desc" FieldName="DiaAbrev" 
                        VisibleIndex="1" Width="60px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2011" FieldName="vlr1" 
                        VisibleIndex="2" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2012" FieldName="vlr2" 
                        VisibleIndex="3" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="vlr. Dif." FieldName="vlr3" 
                        VisibleIndex="4" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="%" FieldName="vlr4" VisibleIndex="5" 
                        Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" />
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings ShowFooter="True" ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                    VerticalScrollableHeight="400" ShowFilterBar="Auto" 
                    ShowFilterRow="True" ShowFilterRowMenu="True" />
                <SettingsText Title="Análise Vendas Mesmos Dias" />
                <Styles>
	                <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                <Header Font-Bold="True" HorizontalAlign="Center">
                    </Header>
	                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                    <Footer Font-Bold="True">
                    </Footer>
                    <TitlePanel Font-Size="Medium">
                    </TitlePanel>
                </Styles>

            </dx:ASPxGridView>

            <asp:SqlDataSource ID="dsVendaDia" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                SelectCommand="DW_Buscar.uspVendaSemPascoa_porLoja" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                </SelectParameters>
            </asp:SqlDataSource>
            
        </div>

        <div id="divG2" class="FormataPadrao">

            <dx:ASPxGridView ID="gridLojaLoja" runat="server" AutoGenerateColumns="False" DataSourceID="dsLojaLoja" EnableTheming="True" KeyFieldName="Descricao" Theme="Default" Width="350px" >
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr1" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr3" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlr4" SummaryType="Custom" />
                </TotalSummary>
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Filial" FieldName="Descricao" VisibleIndex="1" Width="150px">
                        <Settings AllowAutoFilter="False" />
                        <CellStyle Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2011" FieldName="vlr1" VisibleIndex="2" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>

                        <Settings AutoFilterCondition="NotEqual" />

                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2012" FieldName="vlr2" VisibleIndex="3" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="vlr. Dif." FieldName="vlr3" VisibleIndex="4" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="%" FieldName="vlr4" VisibleIndex="5" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" />
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings ShowFilterBar="Auto" ShowFilterRow="True" ShowFilterRowMenu="True" ShowTitlePanel="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="426" />
                <SettingsText Title="Análise Vendas Mesmos Dias - Por Seção" />
                <Styles>
                    <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                    </FocusedRow>
                    <Header Font-Bold="True" HorizontalAlign="Center">
                    </Header>
                    <AlternatingRow BackColor="#EEEEEE">
                    </AlternatingRow>
                    <Footer Font-Bold="True">
                    </Footer>
                    <TitlePanel Font-Size="Medium">
                    </TitlePanel>
                </Styles>
            </dx:ASPxGridView>

            <asp:SqlDataSource ID="dsLojaLoja" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                SelectCommand="DW_Buscar.VendaPorSecao" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="ano" SessionField="sANO" Type="Int16" />
                    <asp:SessionParameter Name="mes" SessionField="sMES" Type="Byte" />
                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    </div>

</asp:Content>

