<%@ Page Title="Analise Vendas por Hora" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="AnaliseHoraJoanir.aspx.vb" Inherits="MemberPages_Gerencial_AnaliseHoraJoanir" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc1" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc2" %>
<%@ Register Src="~/Controles/wuc_KPI_Secao_Depto.ascx" TagPrefix="uc1" TagName="wuc_KPI_Secao_Depto" %>
<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc3" %>

<%@ Register src="../../Controles/wuciListaSemana.ascx" tagname="wuciListaSemana" tagprefix="uc4" %>

<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #sec_Grafico {
            clear: both;
            float: left;
            margin-bottom: 5px;
        }

        #sec_Header {
            margin-top: 5px;
            padding-top: 5px;
        }

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divMes {            
            float: left;
            margin-left: 10px;
        }

        #div_optEmpresa {
            float: left;
            margin-left: 10px;
        }

        #div_optFilial {
            float: left;
            margin-left: 10px;
        }

        #divFilial {            
            float: left;
            margin-left: 10px;
        }

        #divSemana {
            float: left;
            margin-left: 15px;
        }

        #divAtualizar {            
            float: left;
            margin-left: 15px;
        }

        #sec_Dados {
            clear:both;
            float: left;
            margin-top: 5px;
        }

        #divDados_1 {
            clear:both;
            float: left;
        }

        #divDados_2 {            
            float: left;
            margin-left: 15px;
        }

        #divDados_3 {
            clear:both;
            float: left;
            margin-top: 15px;
        }

        #divDados_4 {            
            float: left;
            margin-left: 15px;
            margin-top: 15px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <dx:ASPxTimer ID="ASPxTimer1" runat="server" Interval="180000">
            <ClientSideEvents Tick="function(s, e) {  
        cbPanel.PerformCallback();  
    }" />  
        </dx:ASPxTimer>   

    <section id="sec_Header">   

        <div id="divAno">
            <uc2:wucAno ID="cboAno" runat="server" />
        </div>

        <div id="divMes">
            <uc1:wuciListaMes ID="cboMes" runat="server" />
        </div>

        <div id="div_optEmpresa">
            <dx:ASPxRadioButton ID="rndEmpresa" runat="server" AutoPostBack="True" Checked="True" GroupName="grpCorpLojas" Text="Empresa" Theme="DevEx"></dx:ASPxRadioButton>
        </div>

        <div id="div_optFilial">
            <dx:ASPxRadioButton ID="rndFilial" runat="server" AutoPostBack="True" GroupName="grpCorpLojas" Text="Filial" Theme="DevEx"></dx:ASPxRadioButton>
        </div>

        <div id="divFilial">
            <uc3:wuciListaLojasComApoio ID="cboFilial" runat="server" Visible="False" />
        </div>

        <div id="divSemana">
             <uc4:wuciListaSemana ID="cboSemana" runat="server" />
        </div>
   
        <div id="divAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

    </section>

    <section id="sec_Dados">

         <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"   Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>                    

        <div id="divDados_1">

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
                            <dx:GridViewDataTextColumn Caption="Dia" FieldName="numDia" 
                                VisibleIndex="0" Width="60px" SortIndex="0" SortOrder="Ascending">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Desc" FieldName="DescDia" 
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
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        SelectCommand="[Vendas].uspAtualizarAnaliseHora" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="mes" SessionField="sMES" Type="Byte" />                          
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
            
        </div>


        <div id="divDados_2">

            <dx:ASPxPivotGrid ID="grid" runat="server" ClientIDMode="AutoID" 
                DataSourceID="dsDados" EnableTheming="True" Theme="DevEx" Width="700px">
                <Fields>
                    <dx:PivotGridField ID="fieldDayofWeek" Area="ColumnArea" AreaIndex="0" 
                        Caption="Dia da Semana" FieldName="Day_of_Week" 
                        Options-AllowExpand="False" AllowedAreas="ColumnArea" Options-AllowDrag="False" 
                        Options-AllowFilter="False" Options-AllowSort="False">
                        <ValueStyle BackColor="#999999" Font-Bold="True" ForeColor="White">
                        </ValueStyle>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fielddescHI" Area="RowArea" AreaIndex="0" 
                        Caption="Horas" FieldName="descHI" Options-AllowFilter="False" 
                        Options-AllowSort="True">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldData" AllowedAreas="ColumnArea" Area="ColumnArea" 
                        AreaIndex="2" Caption="Dia" FieldName="Data" Options-AllowExpand="False" 
                        Options-AllowFilter="False" Options-AllowSort="False" 
                        Options-AllowSortBySummary="True" SortMode="Value" SortOrder="Descending">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldAnoReduzido" AllowedAreas="ColumnArea" 
                        Area="ColumnArea" AreaIndex="3" Caption="Ano" FieldName="AnoReduzido" 
                        Options-AllowExpand="False" Options-AllowSort="True" SortMode="Value">
                        <ValueStyle Font-Bold="True">
                        </ValueStyle>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldperc" Area="DataArea" AreaIndex="0" 
                        CellFormat-FormatString="{0:n2}" CellFormat-FormatType="Numeric" 
                        FieldName="perc" Options-ShowCustomTotals="False" 
                        Options-ShowGrandTotal="False" Options-ShowTotals="False" 
                        TotalsVisibility="None" AllowedAreas="DataArea" Options-AllowDrag="False" 
                        Options-AllowExpand="False" Options-AllowFilter="False" 
                        Options-AllowSort="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldSemana" Area="ColumnArea" AreaIndex="1" 
                        FieldName="Semana" Options-AllowExpand="False" Options-AllowFilter="False" 
                        Options-AllowSort="False" AllowedAreas="ColumnArea" 
                        Options-AllowDrag="False">
                        <ValueStyle BackColor="#AEAEAE" ForeColor="White">
                        </ValueStyle>
                    </dx:PivotGridField>
                </Fields>
                <OptionsView ShowFilterHeaders="False" />
                <OptionsPager RowsPerPage="20">
                </OptionsPager>
                <OptionsLoadingPanel Text="Aguarde. Atualizando...&amp;hellip;">
                </OptionsLoadingPanel>
            </dx:ASPxPivotGrid>

            <asp:SqlDataSource ID="dsDados" runat="server" 
                ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                SelectCommand="Vendas.uspViewVendaHoras" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="mes" SessionField="sMES" Type="Byte" />
                    <asp:SessionParameter Name="diaSemana" SessionField="sDIASEMANA" Type="Byte" />
                </SelectParameters>
            </asp:SqlDataSource>
            
        </div>


        <div id="divDados_3">

            <dx:ASPxGridView ID="gridLojaLoja" runat="server" AutoGenerateColumns="False" DataSourceID="dsLojaLoja" EnableTheming="True" KeyFieldName="Descricao" Theme="Default" Width="350px">
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
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
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
                <Settings ShowFilterBar="Auto" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" ShowTitlePanel="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="449" />
                <SettingsText Title="Análise Vendas Mesmos Dias - Por Loja" />
                <Styles>
                    <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                    </FocusedRow>
                    <Header Font-Bold="True" HorizontalAlign="Center">
                    </Header>
                    <AlternatingRow BackColor="#EEEEEE">
                    </AlternatingRow>
                    <Footer Font-Bold="True">
                    </Footer>
                    <TitlePanel Font-Size="Medium" Font-Bold="True" ForeColor="Black">
                    </TitlePanel>
                </Styles>
            </dx:ASPxGridView>

            <asp:SqlDataSource ID="dsLojaLoja" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                    SelectCommand="DW_Buscar.uspVendaBDT" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="ano" SessionField="sANO" Type="Int16" />
                        <asp:SessionParameter Name="mes" SessionField="sMES" Type="Byte" />
                    </SelectParameters>
                </asp:SqlDataSource>
            
        </div>


        <div id="divDados_4">

            <dx:ASPxGridView ID="gridSecao" runat="server" AutoGenerateColumns="False" DataSourceID="dsSecao" EnableTheming="True" KeyFieldName="Descricao" Theme="Default" Width="450px">
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr1" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr3" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlr4" SummaryType="Custom" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Seção" FieldName="Descricao" VisibleIndex="1" Width="150px">
                            <Settings AllowAutoFilter="False" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2011" FieldName="vlr1" VisibleIndex="2" Width="115px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AutoFilterCondition="NotEqual" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2012" FieldName="vlr2" VisibleIndex="3" Width="115px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="vlr. Dif." FieldName="vlr3" VisibleIndex="4" Width="90px">
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
                    <Settings ShowFooter="False" ShowTitlePanel="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="500" />
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
                        <TitlePanel Font-Bold="True" Font-Size="Medium" ForeColor="Black">
                        </TitlePanel>
                    </Styles>
                </dx:ASPxGridView>

            <asp:SqlDataSource ID="dsSecao" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="DW_Buscar.VendaPorSecao" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="ano" SessionField="sANO" Type="Int16" />
                        <asp:SessionParameter Name="mes" SessionField="sMES" Type="Byte" />
                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                    </SelectParameters>
                </asp:SqlDataSource>
            
        </div>

                    <asp:Label ID="lblError" runat="server" Text="" Visibl="False"></asp:Label>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>


    </section>
    
     <section id="sec_Grafico" style="padding-top:10px">
        <uc1:wuc_KPI_Secao_Depto runat="server" ID="KPI" />
    </section>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Análise Vendas Mesmos Dias: gerManager.Vendas.uspBuscarVendasAnaliseHora <br /> Análise Vendas Mesmos Dias - Por Loja: DW_Condor_One.DW_Buscar.uspVendaBDT <br /> Análise Vendas Mesmos Dias - PorSeção: DW_Condor_One.DW_Buscar.VendaPorSecao" />

</asp:Content>

