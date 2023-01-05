<%@ Page Title="Consulta Meta de Venda por Seção Original" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Consulta12Meses_MetaSubgrupo_TodasLojas.aspx.vb" Inherits="Consulta12Meses_MetSubgrupo_TodasLojas" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc2" %>
<%@ Register src="../../../Controles/wucListaGrupo_Subgrupo.ascx" tagname="wucListaGrupo_Subgrupo" tagprefix="uc4" %>

<%@ Register src="../../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc1" %>

<%@ Register src="../../../Controles/wucListaPosicao.ascx" tagname="wucListaPosicao" tagprefix="uc5" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
 
        <style type ="text/css" >

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            width: 100%;
        }

    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  
    <table cellspacing="1" >
        <tr>
            <td >
                <uc2:wucAno ID="cboAno" runat="server" />
            </td>

            <td style="width: 301px" >
                <uc4:wucListaGrupo_Subgrupo ID="cboGrupo" runat="server" />
            </td>
            <td >                
                <dxe:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dxe:ASPxButton>

            </td>
            <td >
                <uc5:wucListaPosicao ID="cboPosicao" runat="server" AutoPostBack ="false" />
            </td>
            <td>
                <uc1:wucSize runat="server" ID="cboSize" />

            </td>
            <td>
                <uc1:wucBotaoExcel ID="btnExcel" runat="server" />
            </td>
        </tr>
    </table>
        

    <%-------------------------------------------------------------------------------------------------------------------------------------------------%>

        <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                    
           <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="Default" DataSourceID="SqlDataSource1" Width="100%" KeyFieldName="idGrupo">
        <TotalSummary>
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vOri_01" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vOri_02" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vOri_03" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vOri_04" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vOri_05" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vOri_06" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vOri_07" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vOri_08" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vOri_09" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vOri_10" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vOri_11" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vOri_12" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vOri_99" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vRea_99" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vRea_AA" SummaryType="Custom" />

            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pOri_01" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pOri_02" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pOri_03" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pOri_04" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pOri_05" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pOri_06" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pOri_07" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pOri_08" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pOri_09" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pOri_10" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pOri_11" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pOri_12" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pOri_99" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pRea_99" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pRea_AA" SummaryType="Custom" />

            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perCrescAA" SummaryType="Custom" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perCrescAT" SummaryType="Custom" />
        </TotalSummary>
        <Columns>
            <dxwgv:GridViewDataTextColumn Caption="Cod" VisibleIndex="0" Width="40px" FieldName="idGrupo" FixedStyle="Left">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Descrição do Grupo" VisibleIndex="1" Width="150px" FieldName="descConta" FixedStyle="Left">
                <CellStyle Wrap="False">
                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </CellStyle>
                <FooterCellStyle>
                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </FooterCellStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewBandColumn Caption="Janeiro" VisibleIndex="6">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vOri_01" ToolTip="Valor da meta" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="pOri_01" ToolTip="%" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                        <FooterCellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Fevereiro" VisibleIndex="7">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vOri_02" ToolTip="Valor da meta" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="pOri_02" ToolTip="%" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                        <FooterCellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Março" VisibleIndex="8">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vOri_03" ToolTip="Valor da meta" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="pOri_03" ToolTip="%" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                        <FooterCellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Abril" VisibleIndex="9">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vOri_04" ToolTip="Valor da meta" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="pOri_04" ToolTip="%" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                        <FooterCellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Maio" VisibleIndex="10">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vOri_05" ToolTip="Valor da meta" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="pOri_05" ToolTip="%" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                        <FooterCellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Junho" VisibleIndex="13">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vOri_06" ToolTip="Valor da meta" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="pOri_06" ToolTip="%" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                        <FooterCellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Julho" VisibleIndex="16">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vOri_07" ToolTip="Valor da meta" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="pOri_07" ToolTip="%" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                        <FooterCellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Agosto" VisibleIndex="19">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vOri_08" ToolTip="Valor da meta" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="pOri_08" ToolTip="%" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                        <FooterCellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Setembro" VisibleIndex="22">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vOri_09" ToolTip="Valor da meta" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="pOri_09" ToolTip="%" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                        <FooterCellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Outubro" VisibleIndex="25">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vOri_10" ToolTip="Valor da meta" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="pOri_10" ToolTip="%" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                        <FooterCellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Novembro" VisibleIndex="28">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vOri_11" ToolTip="Valor da meta" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="pOri_11" ToolTip="%" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                        <FooterCellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Dezembro" VisibleIndex="31">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vOri_12" ToolTip="Valor da meta" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="pOri_12" ToolTip="%" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                        <FooterCellStyle>
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Ano" VisibleIndex="4" Name="bandOrcamento" FixedStyle="Left">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vOri_99" ToolTip="Valor da meta" VisibleIndex="0" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                        <CellStyle ForeColor="#009900">
                        </CellStyle>
                        <FooterCellStyle ForeColor="#009900">
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="pOri_99" ToolTip="%" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                        <CellStyle ForeColor="#009900">
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                        </CellStyle>
                        <FooterCellStyle ForeColor="#009900">
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
                <HeaderStyle BackColor="#009900" ForeColor="White" />
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Realizado" VisibleIndex="3" Name="bandRealizado" FixedStyle="Left">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vRea_99" ToolTip="Valor da meta" VisibleIndex="0" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <HeaderStyle BackColor="Blue" ForeColor="White" />
                        <CellStyle ForeColor="Blue">
                        </CellStyle>
                        <FooterCellStyle ForeColor="Blue">
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="pRea_99" ToolTip="%" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <HeaderStyle BackColor="Blue" ForeColor="White" />
                        <CellStyle ForeColor="Blue">
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                        <FooterCellStyle ForeColor="Blue">
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
                <HeaderStyle BackColor="Blue" ForeColor="White" />
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="RealizadoAA" FixedStyle="Left" Name="bandRealizadoAA" VisibleIndex="2">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vRea_AA" VisibleIndex="0" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <HeaderStyle BackColor="#9B4E00" ForeColor="White" />
                        <CellStyle ForeColor="#9B4E00">
                        </CellStyle>
                        <FooterCellStyle ForeColor="#9B4E00">
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="pRea_AA" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <HeaderStyle BackColor="#9B4E00" ForeColor="White" />
                        <CellStyle ForeColor="#9B4E00">
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                        <FooterCellStyle ForeColor="#9B4E00">
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
                <HeaderStyle BackColor="#9B4E00" ForeColor="White" />
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Crescimento" FixedStyle="Left" Name="bandCrescimento" VisibleIndex="5">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="perCrescAA" VisibleIndex="0" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <HeaderStyle BackColor="#0066FF" ForeColor="White" />
                        <CellStyle ForeColor="#0066FF">
                        </CellStyle>
                        <FooterCellStyle ForeColor="#0066FF">
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="perCrescAT" VisibleIndex="1" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                        <CellStyle ForeColor="#009900">
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                        </CellStyle>
                        <FooterCellStyle ForeColor="#009900">
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                        </FooterCellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings HorizontalScrollBarMode="Visible" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowFooter="True" />
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <AlternatingRow BackColor="#F0F0F0">
            </AlternatingRow>
            <FocusedRow BackColor="Yellow" Font-Bold="True" ForeColor="#3366FF">
            </FocusedRow>
            <Footer Font-Bold="True">
            </Footer>
        </Styles>
    </dxwgv:ASPxGridView>

    
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerOrcamentoConnectionString %>" 
        SelectCommand="uspConsulta12Meses_Subgrupo_Filial_Todas" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="Ano" SessionField="sANO" Type="Int16" />            
            <asp:SessionParameter Name="idSubgrupo" SessionField="sSUBGRUPO" Type="Int16" />
            <asp:SessionParameter Name="idPosicao" SessionField="sPOSICAO" Type="Byte" />
        </SelectParameters>
    </asp:SqlDataSource>



                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


</asp:Content>

