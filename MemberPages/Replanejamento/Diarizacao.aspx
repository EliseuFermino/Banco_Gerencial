<%@ Page Title="Diariazação" Language="VB" AutoEventWireup="false" CodeFile="Diarizacao.aspx.vb" Inherits="MemberPages_Planejamento_Diarizacao" MasterPageFile="~/MemberPages/SiteMetas.master" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc4" %>
<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc5" %>

<%@ Register src="../../Controles/wucListaPosicao.ascx" tagname="wucListaPosicao" tagprefix="uc6" %>

<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc1" %>

<%@ Register src="../../Controles/wucListaGrupo_Subgrupo.ascx" tagname="wucListaGrupo_Subgrupo" tagprefix="uc2" %>

<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc3" %>

<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc7" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

     #moldura {
            width:1024px; 
            margin: 0 auto ;                      
        }

        .style1
        {
            width: 1000px;
        }
        .style2
        {
            width: 91px;
        }
        .style3
        {
            width: 53px;
        }
        .style4
        {
            width: 87px;
        }
        .style6
        {
            width: 84px;
        }
        .style7
        {
            width: 51px;
        }
        .style8
        {
            width: 50px;
        }
        .style9
        {
            width: 81px;
        }
        .style10
        {
            width: 1px;
        }
        .style12
        {
            width: 44px;
        }
        .style13
        {
            color: #FFFFFF;
        }
        .style14
        {
            width: 53px;
            color: #FFFFFF;
        }
        .style15
        {
            width: 50px;
            color: #FFFFFF;
        }
        .style16
        {
            width: 51px;
            color: #FFFFFF;
        }
        .style17
        {
            width: 81px;
            color: #FFFFFF;
        }
        .style18
        {
            width: 44px;
            color: #FFFFFF;
        }
        .style20
        {
            width: 571px;
            height: 44px;
        }
        .style22
        {
            color: #0000FF;
            font-weight: bold;
        }
        .style23
        {
            color: #006600;
        }
        .style24
        {
            width: 51px;
            color: #006600;
        }
        .style25
        {
            width: 217px;
        }
        .style32
        {
            width: 89px;
            color: #FFFFFF;
        }
        .style33
        {
            width: 89px;
        }
        .style41
        {
            width: 100%;
            border-left: 1px solid #808080;
            border-right-style: solid;
            border-right-width: 1px;
            border-top: 1px solid #808080;
            border-bottom-style: solid;
            border-bottom-width: 1px;
            background-color: #FFFFCC;
        }
        .style42
        {
            font-size: small;
        }
        .style43
        {
            color: #FF0000;
        }
        .style44
        {
            font-size: small;
            font-weight: bold;
        }
        .style46
        {
            color: #FFFFFF;
            font-weight: bold;
            font-size: large;
        }
        .style47
        {
            font-size: small;
            font-family: Arial;
            color: #000000;
        }
        .style48
        {
            color: #000000;
        }
        .style49
        {
            width: 543px;
        }
        .style52
        {
            width: 78px;
        }
        .style54
        {
            width: 85px;
        }
        .style55
        {
            width: 217px;
            height: 37px;
        }
        .style56
        {
        }
    .style57
    {
        width: 100%;
    }
    .style58
    {
        color: #FFFFFF;
        font-weight: bold;
    }
        .style59
        {
            width: 220px;
        }
        .style62
        {
            height: 31px;
        }
        .style63
        {
            height: 41px;
        }
        .style64
        {
            height: 36px;
        }
        .style65
        {
            height: 28px;
        }
        .auto-style3 {
            width: 92px;
        }
        .auto-style7 {
            width: 85px;
            vertical-align: central;
        }
        .auto-style8 {
            width: 74px;
            color: #FFFFFF;
        }
        .auto-style9 {
            width: 74px;
        }
        .auto-style10 {
            width: 71px;
            color: #FFFFFF;
        }
        .auto-style11 {
            width: 71px;
        }
        .auto-style12 {
            width: 75px;
        }
        .auto-style13 {
            width: 168px;
        }
        .auto-style14 {
            width: 598px;
        }
        .auto-style15 {
            width: 22px;
        }
        .auto-style16 {
            width: 148px;
        }
        .auto-style17 {
            width: 169px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 
    <div id="moldura">


    
    <div>
    
        <table class="style1">
            <tr>
                <td class="style52">
                    <uc4:wucAno ID="cboAno" runat="server"  AutoPostBack="false"/>
                </td>
                <td class="auto-style13">
                    <uc7:wuciListaMes ID="cboMes" runat="server" AutoPostBack="false" />
                </td>
                <td class="auto-style14">
                    <uc3:wucListaLojasComCorporacao ID="cboFilial" runat="server" AutoPostBack="false"  />
                </td>
                <td class="style49">
                    
                    <asp:Button ID="btnAtualizar" runat="server" Text="Atualizar" />
                </td>
            </tr>
            </table>
    
    </div>

        <asp:Panel ID="Panel1" runat="server"></asp:Panel>
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td class="auto-style12" 
                
                style="border-style: solid solid solid none; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#6B696B">
                <asp:Label ID="lbl_TituloAno4" runat="server" style="color: #FFFFFF" 
                    Text="Label"></asp:Label>
            </td>
            <td class="style2" style="border: 1px solid #808080" bgcolor="#6B696B">
                &nbsp;<span class="style13">Período</span>&nbsp;</td>
            <td class="auto-style10" 
                
                style="border-style: solid solid solid none; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#6B696B">
                %</td>
            <td class="auto-style7" 
                
                style="border-style: solid solid solid none; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#6B696B">
                <asp:Label ID="lbl_TituloAno2" runat="server" style="color: #FFFFFF" 
                    Text="Label"></asp:Label>
            </td>
            <td class="auto-style8" 
                
                style="border-style: solid solid solid none; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#6B696B">
                %</td>
            <td style="border-style: solid; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#006600" class="style17">
                Meta</td>
            <td class="auto-style15">
                &nbsp;</td>
            <td rowspan="12" style="vertical-align: top">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="dsResumo" AutoGenerateColumns="False" KeyFieldName="nomeFilialLista" Width="430px">
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MetaRevista" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDiarizacao" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="dif" SummaryType="Sum" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Filial" FieldName="nomeFilialLista" VisibleIndex="0" Width="250px">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Meta Revista" FieldName="MetaRevista" VisibleIndex="1" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#009900">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Diarização" FieldName="vlrDiarizacao" ReadOnly="True" VisibleIndex="2" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Diferença" FieldName="dif" VisibleIndex="3" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="#996633">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#996633">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings ShowFooter="True" ShowTitlePanel="True" VerticalScrollBarMode="Auto" VerticalScrollableHeight="195" />
                    <SettingsText Title="Resumo da Diarização" />
                    <Styles>
                        <Header HorizontalAlign="Center">
                        </Header>
                        <AlternatingRow BackColor="#EEEEEE">
                        </AlternatingRow>
                        <FocusedRow BackColor="#FFFF99" ForeColor="Blue">
                        </FocusedRow>
                        <Footer Font-Bold="True">
                        </Footer>
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsResumo" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="Metas.usp_BuscarAnaliseDiarizacao" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                        <asp:SessionParameter Name="Tipo" SessionField="sTIPO" Type="Byte" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style12" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia1" runat="server" Font-Names="Arial" 
                    style="font-size: small" Text="01/01/2014"></asp:Label>
            </td>
            <td class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; background-color: #FFFFFF;">
                <asp:TextBox ID="txt_Dia1" runat="server" onfocus="this.select();" 
                    style="text-align:right; color: #0000FF;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="White">0</asp:TextBox>
            </td>
            <td align="right" class="auto-style11" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia12" runat="server" 
                    style="font-size: small; font-family: Arial" Text="12/01/2014"></asp:Label>
            </td>
            <td align="right" class="auto-style7" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:TextBox ID="txt_Dia12" runat="server" onfocus="this.select();" 
                    style="text-align:right; color: #0000FF;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="White">0</asp:TextBox>
            </td>
            <td align="right" class="auto-style9" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia23" runat="server" 
                    style="font-family: Arial; font-size: small" Text="23/01/2014"></asp:Label>
            </td>
            <td align="right" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                class="style9" bgcolor="White">
                <asp:TextBox ID="txt_Dia23" runat="server" onfocus="this.select();" 
                    style="text-align:right; color: #0000FF;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="White">0</asp:TextBox>
            </td>
            <td class="auto-style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" bgcolor="#DFEEFF" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_Dia2" runat="server" 
                    style="font-size: small; font-family: Arial" Text="02/01/2014"></asp:Label>
            </td>
            <td bgcolor="#DFEEFF" class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080">
                <asp:TextBox ID="txt_Dia2" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="#CCFFCC" ForeColor="Blue">0</asp:TextBox>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style11" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_Dia13" runat="server" 
                    style="font-size: small; font-family: Arial" Text="13/01/2014"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style7" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:TextBox ID="txt_Dia13" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="#CCFFCC" ForeColor="Blue">0</asp:TextBox>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style9" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_Dia24" runat="server" 
                    style="font-family: Arial; font-size: small" Text="24/01/2014"></asp:Label>
            </td>
            <td align="right" bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                class="style9">
                <asp:TextBox ID="txt_Dia24" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="#CCFFCC" ForeColor="Blue">0</asp:TextBox>
            </td>
            <td class="auto-style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="auto-style12" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia3" runat="server" 
                    style="font-family: Arial; font-size: small" Text="03/01/2014"></asp:Label>
            </td>
            <td class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; background-color: #FFFFFF;">
                <asp:TextBox ID="txt_Dia3" runat="server" onfocus="this.select();" 
                    style="text-align:right; color: #0000FF;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="White">0</asp:TextBox>
            </td>
            <td align="right" class="auto-style11" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia14" runat="server" 
                    style="font-size: small; font-family: Arial" Text="14/01/2014"></asp:Label>
            </td>
            <td align="right" class="auto-style7" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:TextBox ID="txt_Dia14" runat="server" onfocus="this.select();" 
                    style="text-align:right; color: #0000FF;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="White">0</asp:TextBox>
            </td>
            <td align="right" class="auto-style9" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia25" runat="server" 
                    style="font-family: Arial; font-size: small" Text="25/01/2014"></asp:Label>
            </td>
            <td align="right" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                class="style9">
                <asp:TextBox ID="txt_Dia25" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" ForeColor="Blue" BackColor="White">0</asp:TextBox>
            </td>
            <td class="auto-style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" bgcolor="#DFEEFF" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_Dia4" runat="server" 
                    style="font-family: Arial; font-size: small" Text="04/01/2014"></asp:Label>
            </td>
            <td bgcolor="#DFEEFF" class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080">
                <asp:TextBox ID="txt_Dia4" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="#CCFFCC" ForeColor="Blue">0</asp:TextBox>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style11" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_Dia15" runat="server" 
                    style="font-size: small; font-family: Arial" Text="15/01/2014"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style7" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:TextBox ID="txt_Dia15" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="#CCFFCC" ForeColor="Blue">0</asp:TextBox>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style9" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_Dia26" runat="server" 
                    style="font-family: Arial; font-size: small" Text="26/01/2014"></asp:Label>
            </td>
            <td align="right" bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                class="style9">
                <asp:TextBox ID="txt_Dia26" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="#CCFFCC" ForeColor="Blue">0</asp:TextBox>
            </td>
            <td class="auto-style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="auto-style12" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia5" runat="server" 
                    style="font-family: Arial; font-size: small" Text="05/01/2014"></asp:Label>
            </td>
            <td class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; background-color: #FFFFFF;">
                <asp:TextBox ID="txt_Dia5" runat="server" onfocus="this.select();" 
                    style="text-align:right; color: #0000FF;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="White">0</asp:TextBox>
            </td>
            <td align="right" class="auto-style11" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia16" runat="server" 
                    style="font-size: small; font-family: Arial" Text="16/01/2014"></asp:Label>
            </td>
            <td align="right" class="auto-style7" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:TextBox ID="txt_Dia16" runat="server" onfocus="this.select();" 
                    style="text-align:right; color: #0000FF;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="White">0</asp:TextBox>
            </td>
            <td align="right" class="auto-style9" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia27" runat="server" 
                    style="font-family: Arial; font-size: small" Text="27/01/2014"></asp:Label>
            </td>
            <td align="right" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                class="style9">
                <asp:TextBox ID="txt_Dia27" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" ForeColor="Blue" BackColor="White">0</asp:TextBox>
            </td>
            <td class="auto-style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" bgcolor="#DFEEFF" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_Dia6" runat="server" 
                    style="font-size: small; font-family: Arial" Text="06/01/2014"></asp:Label>
            </td>
            <td bgcolor="#DFEEFF" class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080">
                <asp:TextBox ID="txt_Dia6" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="#CCFFCC" ForeColor="Blue">0</asp:TextBox>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style11" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_Dia17" runat="server" 
                    style="font-size: small; font-family: Arial" Text="17/01/2014"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style7" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:TextBox ID="txt_Dia17" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="#CCFFCC" ForeColor="Blue">0</asp:TextBox>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style9" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_Dia28" runat="server" 
                    style="font-family: Arial; font-size: small" Text="28/01/2014"></asp:Label>
            </td>
            <td align="right" bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                class="style9">
                <asp:TextBox ID="txt_Dia28" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="#CCFFCC" ForeColor="Blue">0</asp:TextBox>
            </td>
            <td class="auto-style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="auto-style12" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia7" runat="server" 
                    style="font-family: Arial; font-size: small" Text="07/01/2014"></asp:Label>
            </td>
            <td class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; background-color: #FFFFFF;">
                <asp:TextBox ID="txt_Dia7" runat="server" onfocus="this.select();" 
                    style="text-align:right; color: #0000FF;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="White">0</asp:TextBox>
            </td>
            <td align="right" class="auto-style11" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia18" runat="server" 
                    style="font-size: small; font-family: Arial" Text="18/01/2014"></asp:Label>
            </td>
            <td align="right" class="auto-style7" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:TextBox ID="txt_Dia18" runat="server" onfocus="this.select();" 
                    style="text-align:right; color: #0000FF;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="White">0</asp:TextBox>
            </td>
            <td align="right" class="auto-style9" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia29" runat="server" 
                    style="font-family: Arial; font-size: small" Text="29/01/2014"></asp:Label>
            </td>
            <td align="right" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                class="style9">
                <asp:TextBox ID="txt_Dia29" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" ForeColor="Blue" BackColor="White">0</asp:TextBox>
            </td>
            <td class="auto-style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" bgcolor="#DFEEFF" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_Dia8" runat="server" 
                    style="font-family: Arial; font-size: small" Text="08/01/2014"></asp:Label>
            </td>
            <td bgcolor="#DFEEFF" class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080">
                <asp:TextBox ID="txt_Dia8" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="#CCFFCC" ForeColor="Blue">0</asp:TextBox>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style11" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_Dia19" runat="server" 
                    style="font-size: small; font-family: Arial" Text="19/01/2014"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style7" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:TextBox ID="txt_Dia19" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="#CCFFCC" ForeColor="Blue">0</asp:TextBox>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style9" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_Dia30" runat="server" 
                    style="font-family: Arial; font-size: small" Text="30/01/2014"></asp:Label>
            </td>
            <td align="right" bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                class="style9">
                <asp:TextBox ID="txt_Dia30" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="#CCFFCC" ForeColor="Blue">0</asp:TextBox>
            </td>
            <td class="auto-style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="auto-style12" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia9" runat="server" 
                    style="font-family: Arial; font-size: small" Text="09/01/2014"></asp:Label>
            </td>
            <td class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; background-color: #FFFFFF;">
                <asp:TextBox ID="txt_Dia9" runat="server" onfocus="this.select();" 
                    style="text-align:right; color: #0000FF;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="White">0</asp:TextBox>
            </td>
            <td align="right" class="auto-style11" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia20" runat="server" 
                    style="font-size: small; font-family: Arial" Text="20/01/2014"></asp:Label>
            </td>
            <td align="right" class="auto-style7" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:TextBox ID="txt_Dia20" runat="server" onfocus="this.select();" 
                    style="text-align:right; color: #0000FF;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="White">0</asp:TextBox>
            </td>
            <td align="right" class="auto-style9" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia31" runat="server" 
                    style="font-family: Arial; font-size: small" Text="31/01/2014"></asp:Label>
            </td>
            <td align="right" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                class="style9">
                <asp:TextBox ID="txt_Dia31" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" ForeColor="Blue" BackColor="White">0</asp:TextBox>
            </td>
            <td class="auto-style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" bgcolor="#DFEEFF" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_Dia10" runat="server" 
                    style="font-family: Arial; font-size: small" Text="10/01/2014"></asp:Label>
            </td>
            <td bgcolor="#DFEEFF" class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080">
                <asp:TextBox ID="txt_Dia10" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="#CCFFCC" ForeColor="Blue">0</asp:TextBox>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style11" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_Dia21" runat="server" 
                    style="font-size: small; font-family: Arial" Text="21/01/2014"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style7" 
                                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:TextBox ID="txt_Dia21" runat="server" onfocus="this.select();" 
                    style="text-align:right;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="#CCFFCC" ForeColor="Blue">0</asp:TextBox>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style9" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                &nbsp;</td>
            <td align="right" bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                class="style9">
                &nbsp;</td>
            <td class="auto-style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="auto-style12" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia11" runat="server" 
                    style="font-family: Arial; font-size: small" Text="11/01/2014"></asp:Label>
            </td>
            <td class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; background-color: #FFFFFF;">
                <asp:TextBox ID="txt_Dia11" runat="server" onfocus="this.select();" 
                    style="text-align:right; color: #0000FF;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="White">0</asp:TextBox>
            </td>
            <td align="right" class="auto-style11" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_Dia22" runat="server" 
                    style="font-size: small; font-family: Arial" Text="22/01/2014"></asp:Label>
            </td>
            <td align="right" class="auto-style7" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:TextBox ID="txt_Dia22" runat="server" onfocus="this.select();" 
                    style="text-align:right; color: #0000FF;" AutoPostBack="True" 
                    BorderStyle="None" Width="75px" BackColor="White">0</asp:TextBox>
            </td>
            <td align="right" class="auto-style9" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                &nbsp;</td>
            <td align="right" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                class="style9">
                &nbsp;</td>
            <td class="auto-style15">
                &nbsp;</td>
        </tr>
        </table>
    <div>
        <table class="style1">
            <tr>
                <td class="style56" align="left" valign="top">
                    <asp:Panel ID="Panel2" runat="server" 
                        Width="488px" Height="197px" BorderColor="#3366CC" BorderStyle="Solid" 
                        BorderWidth="1px">
                        <table cellspacing="1" class="style57">
                            <tr>
                                <td class="auto-style16">
                                    <uc1:wucBotaoAtualizar ID="btnSalvar" runat="server" />
                                </td>
                                <td class="auto-style17">
                                    Total:</td>
                                <td>
                                    <asp:Label ID="lblTotal" runat="server" style="font-family: Arial; font-size: large; font-weight: 700;" Text="0"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">&nbsp;</td>
                                <td class="auto-style17">Meta Revista Téorico:</td>
                                <td>
                                    <dx:ASPxTextBox ID="lblTotal_MetaRevista" runat="server" BackColor="#EFEEEF" DisplayFormatString="n0" Enabled="False" Font-Bold="True" Font-Size="Large" ForeColor="#009900" ReadOnly="True" Text="0" Width="100px">
                                        <Border BorderStyle="None" />
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<br />
&nbsp;<br />
                </td>
            </tr>
            </table>
    </div>
        </div>
</asp:Content>
