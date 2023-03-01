<%@ Page Title="Páscoa Inicial" Language="VB" MasterPageFile="~/MemberPages/mpCampanha_Pascoa.master" AutoEventWireup="false" CodeFile="PascoaParticipacao.aspx.vb" Inherits="MemberPages_Campanhas_Pascoa_PascoaParticipacao" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<%@ Register src="../../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc1" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">

     <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

         .myGrid {
            padding-top: 5px;
            padding-left: 4px;
         }

    </style>
    
    <link href="../../../css/bootstrap.css" rel="stylesheet" />

<section class="container-fluid">

    <div class="row">

        <div class="col-md-2">
            <dx:ASPxComboBox ID="cboCod" runat="server" AutoPostBack="True" EnableTheming="True" SelectedIndex="0" Theme="Default" ForeColor="#333333">
                <Items>
                    <dx:ListEditItem Selected="True" Text="Total Páscoa" Value="0" />
                    <dx:ListEditItem Text="Ovos" Value="2" />
                    <dx:ListEditItem Text="Caixa de Bombom" Value="1" />
                    <dx:ListEditItem Text="Coelhinho" Value="3" />
                    <dx:ListEditItem Text="Colomba" Value="4" />
                    <dx:ListEditItem Text="Bacalhau" Value="5" />
                    <dx:ListEditItem Text="Barras de Chocolate" Value="6" />
                </Items>
            </dx:ASPxComboBox>

        </div> <%--Item Pascoa--%>

        <div class="col-md-4">
            
        </div> 
        
    </div>

    <div class="row myGrid">    

        <dx:ASPxGridView ID="gridCrescPascoaDia" runat="server" AutoGenerateColumns="False" DataSourceID="dsAnaliseDia" EnableTheming="True" KeyFieldName="desc1" Theme="Default" Width="1600px">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAT" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaAA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaAT" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroAA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroAT" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAT" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="DifCrescReal" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVolume" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="DifCrescReal_Qtde" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPartPerc" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="DifCrescLucro" SummaryType="Custom" />
            </TotalSummary>
            <GroupSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" ShowInGroupFooterColumn="QtdeAA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAT" ShowInGroupFooterColumn="QtdeAT" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaAA" ShowInGroupFooterColumn="VendaAA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaAT" ShowInGroupFooterColumn="VendaAT" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroAA" ShowInGroupFooterColumn="LucroAA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroAT" ShowInGroupFooterColumn="LucroAT" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" ShowInGroupFooterColumn="percMargemAA" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" ShowInGroupFooterColumn="percMargemAT" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAA" ShowInGroupFooterColumn="percPartAA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAT" ShowInGroupFooterColumn="percPartAT" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="SemanaAcumAA" ShowInGroupFooterColumn="SemanaAcumAA" SummaryType="Average" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="SemanaAcumAT" ShowInGroupFooterColumn="SemanaAcumAT" SummaryType="Average" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difAcumulada" ShowInGroupFooterColumn="difAcumulada" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPartPerc" ShowInGroupFooterColumn="difPartPerc" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="DifCrescReal" ShowInGroupFooterColumn="DifCrescReal" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVolume" ShowInGroupFooterColumn="difVolume" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="DifCrescReal_Qtde" ShowInGroupFooterColumn="DifCrescReal_Qtde" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="DifCrescLucro" ShowInGroupFooterColumn="DifCrescLucro" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalAcumulado_QtdeAA" ShowInGroupFooterColumn="TotalAcumulado_QtdeAA" SummaryType="Max" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalAcumulado_QtdeAT" ShowInGroupFooterColumn="TotalAcumulado_QtdeAT" SummaryType="Max" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="SemanaAcumAA" ShowInGroupFooterColumn="PartAcumAA" SummaryType="Min" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="PartAcumAT" ShowInGroupFooterColumn="PartAcumAT" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalAcumulado_VendaAA" ShowInGroupFooterColumn="TotalAcumulado_VendaAA" SummaryType="Max" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalAcumulado_VendaAT" ShowInGroupFooterColumn="TotalAcumulado_VendaAT" SummaryType="Max" />
            </GroupSummary>
            <Columns>
                <dx:GridViewDataTextColumn Caption="Dia" FieldName="desc1" ReadOnly="True" VisibleIndex="0" Width="80px">
                    <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy} " EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cod" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idFilial" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Volume" VisibleIndex="3">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="2017" FieldName="QtdeAA" VisibleIndex="0" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                            <GroupFooterCellStyle>
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2018" FieldName="QtdeAT" VisibleIndex="2" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#009900" ForeColor="White" />
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#009900">
                            </FooterCellStyle>
                            <GroupFooterCellStyle ForeColor="#009900">
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Acum." FieldName="TotalAcumulado_QtdeAA" ToolTip="Acumula os valores diários" VisibleIndex="1" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True">
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                            <GroupFooterCellStyle Font-Bold="True">
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Acum." FieldName="TotalAcumulado_QtdeAT" ToolTip="Acumula os valores diários" VisibleIndex="3" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True" ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#009900">
                            </FooterCellStyle>
                            <GroupFooterCellStyle Font-Bold="True" ForeColor="#009900">
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="DifCrescReal_Qtde" UnboundType="Decimal" VisibleIndex="5" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderWidth="1px" />
                            </CellStyle>
                            <FooterCellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difVolume" UnboundType="Decimal" VisibleIndex="4" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                            <FooterCellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </FooterCellStyle>
                            <GroupFooterCellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="R$" VisibleIndex="4">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="2017" FieldName="VendaAA" VisibleIndex="0" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <GroupFooterCellStyle>
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Acum" FieldName="TotalAcumulado_VendaAA" VisibleIndex="1" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True">
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2018" FieldName="VendaAT" VisibleIndex="2" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#009900" ForeColor="White" />
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#009900">
                            </FooterCellStyle>
                            <GroupFooterCellStyle ForeColor="#009900">
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Acum" FieldName="TotalAcumulado_VendaAT" VisibleIndex="3" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True" ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#009900">
                            </FooterCellStyle>
                            <GroupFooterCellStyle ForeColor="#009900">
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="DifCrescReal" UnboundType="Decimal" VisibleIndex="4" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <FooterCellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </FooterCellStyle>
                            <GroupFooterCellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Lucro" VisibleIndex="6">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="2017" FieldName="LucroAA" VisibleIndex="0" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2018" FieldName="LucroAT" VisibleIndex="1" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#009900" ForeColor="White" />
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#009900">
                            </FooterCellStyle>
                            <GroupFooterCellStyle ForeColor="#009900">
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="DifCrescLucro" UnboundType="Decimal" VisibleIndex="2" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <FooterCellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </FooterCellStyle>
                            <GroupFooterCellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Margem em %" VisibleIndex="15">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="2017" FieldName="percMargemAA" ReadOnly="True" VisibleIndex="0" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2018" FieldName="percMargemAT" ReadOnly="True" VisibleIndex="1" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#009900" ForeColor="White" />
                            <FooterCellStyle ForeColor="#009900">
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </FooterCellStyle>
                            <GroupFooterCellStyle ForeColor="#009900">
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Participação %" VisibleIndex="17">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="2017" FieldName="percPartAA" ReadOnly="True" VisibleIndex="0" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2018" FieldName="percPartAT" ReadOnly="True" VisibleIndex="1" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#009900" ForeColor="White" />
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#009900">
                            </FooterCellStyle>
                            <GroupFooterCellStyle ForeColor="#009900">
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Dif." FieldName="difPartPerc" UnboundType="Decimal" VisibleIndex="2" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EnableFocusedStyle="False">
                            </PropertiesTextEdit>
                            <FooterCellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </FooterCellStyle>
                            <GroupFooterCellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Part. Acumulada" VisibleIndex="21" Visible="False">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="2017" FieldName="PartAcumAA" VisibleIndex="0" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2018" FieldName="PartAcumAT" VisibleIndex="1" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#009900" ForeColor="White" />
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#009900">
                            </FooterCellStyle>
                            <GroupFooterCellStyle ForeColor="#009900">
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Dif." FieldName="difAcumulada" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Part. Semana" VisibleIndex="19">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="2017" FieldName="SemanaAcumAA" VisibleIndex="0" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle BackColor="#FFFFCC">
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2018" FieldName="SemanaAcumAT" VisibleIndex="1" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#009900" ForeColor="White" />
                            <CellStyle BackColor="#FFFFCC" ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#009900">
                            </FooterCellStyle>
                            <GroupFooterCellStyle ForeColor="#009900">
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn FieldName="Semana" VisibleIndex="23" GroupIndex="0" SortIndex="0" SortOrder="Ascending" Width="200px">
                    <CellStyle Font-Bold="False" Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFooter="True" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="575" VerticalScrollBarMode="Auto" />
            <SettingsText Title="Crescimento da Páscoa por Semana" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <Footer Font-Bold="True">
                </Footer>
                <FocusedRow BackColor="#FFFF66" ForeColor="#0066FF" Font-Bold="True">
                </FocusedRow>
                <GroupRow Font-Bold="True">
                </GroupRow>
                <AlternatingRow BackColor="#EEEEEE">
                </AlternatingRow>
                <GroupFooter BackColor="#E2E2E2" Font-Bold="False" ForeColor="Blue">
                </GroupFooter>
                <TitlePanel Font-Size="X-Large">
                </TitlePanel>
            </Styles>
        </dx:ASPxGridView>
        <uc1:wucBotaoExcel ID="btnExcel" runat="server" CallGridViewID="gridCrescPascoaDia" />
        <asp:SqlDataSource ID="dsAnaliseDia" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                            SelectCommand="Gerencial.uspPascoaBuscaAcompanhamentoPorDia" 
                            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="Cod" SessionField="sCOD" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>  <%--Grid--%>             

</section>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Database: gerManager" Anotacao2="Stored: Gerencial.uspPascoaBuscaAcompanhamentoPorDia" />  
    
</asp:Content>

