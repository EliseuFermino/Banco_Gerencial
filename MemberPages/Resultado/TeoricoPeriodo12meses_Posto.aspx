<%@ Page Title="Resultado por Período - Todos os Meses" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="TeoricoPeriodo12meses_Posto.aspx.vb" Inherits="MemberPages_Resultado_Teorico12Meses_Posto" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>

<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

     <style type="text/css" >
        html {            
            overflow-x:hidden ;
        }

        #Ano {
            clear: both;
            float: left;
        }

        #BotaoAtualizar {
            float: left;
            margin-left: 2px;
            margin-top: 2px;
        }

        #Tamanho {
            float: left;
            margin-left: 2px;
            margin-top: 2px;
        }

        #Grid {
            clear:both;
            float: left;
            padding-top: 2px;
            width: 100%;
            margin-right: 5px;
            padding-right: 3px;
        }       

        #Periodo {
            float: left;
            margin-left: 2px;
            width: 255px;
        }

       
        
        #MostrarCabecalho {
            float: left;
            margin-left: 10px;
            width: 155px;            
        }        
        
       #divSize {
            float: left;
            margin-left: 5px;
                        
        }                      

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 28px;
            margin-left: 1px;            
        }

         #divCheckGroup {
            clear: both;
            float: left;
            border: 1px dashed #C0C0C0;     
            margin-top: 2px;                          
         }

         #divCheckGroup1 {
            margin-left: 30px;
            float: left;
            border: 1px dashed #C0C0C0;     
            margin-top: 2px;                          
         }

         #divExibe_Periodo {
             clear: both;
             float: left;
             margin-top: 2px;
             border: 1px dashed #C0C0C0;   
         }

         .divCheck {
            float: left;
            width: 150px;
            margin-right: 10px;
         }

         #Filial {
             float: left;
             width: 470px;
           
             
         }

   </style>

     <script type="text/javascript">         
         function OnValueChanged(s, e) {
             var checkState = chkPercentual.GetCheckState();
             var checked = chkPercentual.GetChecked();
             checkStateLabel.SetText("CheckState = " + checkState);
             checkedLabel.SetText("Checked = " + checked);

             if (checkState == "Unchecked") { chkValor.SetEnabled(false); }
             else { chkValor.SetEnabled(true); }
         }

         function OnValueChanged_Valor(s, e) {
             var checkStateP = chkValor.GetCheckState();
             var checkedP = chkValor.GetChecked();
             checkStateLabel.SetText("CheckState = " + checkStateP);
             checkedLabel.SetText("Checked = " + checkedP);

             if (checkStateP == "Unchecked") { chkPercentual.SetEnabled(false); }
             else { chkPercentual.SetEnabled(true); }             
         }

     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
        <div id="Ano" >
            <uc1:wucAno ID="cboAno" runat="server" />
        </div>

        <div id="Filial"  >
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />           
        </div>

        <div id="BotaoAtualizar" >
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme ="Metropolis" AutoPostBack ="False" >
                <ClientSideEvents Click="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

        <div id="MostrarCabecalho">
            <dx:ASPxCheckBox ID="chkMostrarCabecalho" runat="server" 
                Checked="True" CheckState="Checked" Text="Mostrar cabeçalho" Theme="DevEx">
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>

        <div id="divSize">
            <uc1:wucSize runat="server" ID="cboSize" CallSize="100"  />
        </div>

        <div id="divCheckGroup">
            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkVerOriginal" runat="server" Text="Ver Meta Original" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="false" ForeColor="Orange">
                    
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkVerRevista" runat="server" Text="Ver Meta Revista" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="false" ForeColor="Green">
                    
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkVerRealizado" runat="server" Text="Ver Realizado" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="true" ForeColor="Blue">
                    
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkVerDiferencas" runat="server" Text="Ver Diferenças" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="false" ForeColor="Red">
                    
                </dx:ASPxCheckBox>
            </div>

        </div>

        <div id="divCheckGroup1">
            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkValor" runat="server" Text="Exibir Valor" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="true" ForeColor="Black" ClientInstanceName="chkValor">
                    <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" 
                                      ValueChanged="function(s, e) {OnValueChanged_Valor();}"/>
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkPercentual" runat="server" Text="Exibir Percentual" Theme ="DevEx" 
                    Checked="True" ForeColor="Black" CheckState="Checked" ClientInstanceName="chkPercentual">
                    <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" 
                                      ValueChanged="function(s, e) {OnValueChanged();}" />
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkCAI" runat="server" Text="Zerar CAI Ano Anterior " Theme ="DevEx" 
                    Checked="False" ForeColor="Red" CheckState="Unchecked" ClientInstanceName="chkPercentual" >
                    <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" 
                                      ValueChanged="function(s, e) {OnValueChanged();}" />
                </dx:ASPxCheckBox>
            </div>
            
        </div>


        <div id="divExibe_Periodo">
            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkPeriodo_1" runat="server" Text="1º Período" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="false" ForeColor="Black" Font-Bold="true">                    
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkPeriodo_2" runat="server" Text="2º Período" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="false" ForeColor="Black" Font-Bold="true">                    
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkPeriodo_3" runat="server" Text="3º Período" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="false" ForeColor="Black" Font-Bold="true">                    
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkPeriodo_4" runat="server" Text="4º Período" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="false" ForeColor="Black" Font-Bold="true">                    
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkTrimestres" runat="server" Text="Trimestres" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="true" ForeColor="Blue" Font-Bold="true">                    
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkPeriodo_5" runat="server" Text="Acumulado" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="true" ForeColor="DarkGreen" Font-Bold="true">                    
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkPeriodo_6" runat="server" Text="Ano" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="false" ForeColor="Black" Font-Bold="true">                    
                </dx:ASPxCheckBox>
            </div>

        </div>    


        <div id="Grid">
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" Theme ="Metropolis" ClientInstanceName="cbPanel" SettingsLoadingPanel-Text="Atualizando">
                <PanelCollection>
                    <dx:PanelContent>
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" 
                            DataSourceID="SqlDataSource1" AutoGenerateColumns="False" 
                            EnableTheming="True" Theme="SoftOrange" Width="100%" KeyFieldName="idGrupo">

                            <Toolbars>
                                <dx:GridViewToolbar EnableAdaptivity="true">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>

                            <TotalSummary>
                                <%--JANEIRO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m1_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m1_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m1_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m1_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m1_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m1_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m1_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m1_percMxR" SummaryType="Custom" /> 

                                <%--FEVEREIRO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m2_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m2_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m2_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m2_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m2_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m2_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m2_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m2_percMxR" SummaryType="Custom" />

                                <%--MARÇO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m3_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m3_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m3_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m3_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m3_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m3_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m3_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m3_percMxR" SummaryType="Custom" />

                                 <%--1º PERIODO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p1_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p1_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p1_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p1_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p1_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p1_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p1_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p1_percMxR" SummaryType="Custom" />

                                <%--ABRIL --%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m4_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m4_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m4_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m4_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m4_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m4_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m4_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m4_percMxR" SummaryType="Custom" />                               

                                <%--MAIO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m5_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m5_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m5_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m5_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m5_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m5_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m5_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m5_percMxR" SummaryType="Custom" />

                                <%--JUNHO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m6_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m6_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m6_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m6_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m6_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m6_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m6_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m6_percMxR" SummaryType="Custom" />

                                <%--2º PERIODO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p2_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p2_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p2_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p2_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p2_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p2_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p2_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p2_percMxR" SummaryType="Custom" />

                                <%--JULHO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m7_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m7_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m7_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m7_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m7_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m7_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m7_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m7_percMxR" SummaryType="Custom" />

                                <%--AGOSTO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m8_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m8_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m8_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m8_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m8_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m8_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m8_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m8_percMxR" SummaryType="Custom" />                                

                                <%--SETEMBRO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m9_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m9_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m9_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m9_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m9_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m9_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m9_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m9_percMxR" SummaryType="Custom" />

                                <%--3º PERIODO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p3_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p3_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p3_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p3_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p3_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p3_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p3_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p3_percMxR" SummaryType="Custom" />

                                <%--OUTUBRO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m10_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m10_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m10_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m10_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m10_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m10_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m10_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m10_percMxR" SummaryType="Custom" />

                                <%--NOVEMBRO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m11_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m11_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m11_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m11_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m11_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m11_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m11_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m11_percMxR" SummaryType="Custom" />

                                <%--DEZEMBRO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m12_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m12_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m12_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m12_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m12_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m12_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m12_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="m12_percMxR" SummaryType="Custom" />

                                <%--4º PERIODO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p4_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p4_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p4_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p4_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p4_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p4_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="p4_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p4_percMxR" SummaryType="Custom" />

                                <%--ACUMULADO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ac_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ac_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ac_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ac_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ac_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ac_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ac_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ac_percMxR" SummaryType="Custom" />

                                <%--ACUMULADO AA--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="acAA_vlrRea" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="acAA_percRea" SummaryType="Custom" />

                                <%--ANO--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="an_vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="an_percOri" SummaryType="Custom" />                                       
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="an_vlrRev" SummaryType="Custom" />                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="an_percRev" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="an_vlrRea" SummaryType="Custom" />   
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="an_percRea" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="an_vlrMxR" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="an_percMxR" SummaryType="Custom" />

                                <dx:ASPxSummaryItem FieldName="descConta" SummaryType="Custom" />

                            </TotalSummary>
                            <Columns>
                                <dx:GridViewBandColumn Caption="Ano" VisibleIndex="12" Name="band_Ano">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Revista" FieldName="an_vlrRev" 
                                            VisibleIndex="2" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />                                           
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="an_percRev" VisibleIndex="3" 
                                            Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="an_vlrRea" 
                                            VisibleIndex="4" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="an_percRea" VisibleIndex="5" 
                                            Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="an_vlrMxR" 
                                            VisibleIndex="7" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="an_percMxR" 
                                            VisibleIndex="9" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Original" FieldName="an_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px" Visible="False">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="an_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px" Visible="False">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn> <%-- Ano  VisibleIndex="12"--%>

                                <dx:GridViewBandColumn Caption="Acumulado" VisibleIndex="11" Name="band_Acumulado">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Original" FieldName="ac_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="110px" Visible="False">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>   <%--vlrOri--%>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="ac_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px" Visible="False">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>   <%--percOri--%>
                                        <dx:GridViewDataTextColumn Caption="Revista" FieldName="ac_vlrRev" 
                                            VisibleIndex="2" Width="110px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />                                           
                                        </dx:GridViewDataTextColumn>   <%--vlrRev--%>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="ac_percRev" VisibleIndex="3" 
                                            Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                        </dx:GridViewDataTextColumn>   <%--percRev--%>
                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="ac_vlrRea" 
                                            VisibleIndex="4" Width="110px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                        </dx:GridViewDataTextColumn>   <%--vlrRea--%>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="ac_percRea" VisibleIndex="5" 
                                            Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                        </dx:GridViewDataTextColumn>   <%--percRea--%>

                                        <dx:GridViewDataTextColumn Caption="Ano Anterior" FieldName="acAA_vlrRea"  
                                            VisibleIndex="6" Width="110px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#0066cc" ForeColor="White"/>
                                        </dx:GridViewDataTextColumn>   <%--vlrRea AA--%>
                                        <dx:GridViewDataTextColumn Caption="% A.A." FieldName="acAA_percRea" VisibleIndex="7" 
                                            Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#0066cc" ForeColor="White"/>
                                        </dx:GridViewDataTextColumn>   <%--percRea AA--%>


                                        <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="ac_vlrMxR" 
                                            VisibleIndex="8" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>   <%--vlr_M x R--%>
                                        <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="ac_percMxR" 
                                            VisibleIndex="9" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>   <%--perc M x R--%>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn> <%-- Acumulado  VisibleIndex="11"--%>

                                <dx:GridViewBandColumn Caption="4º Quadrimestre" VisibleIndex="10" ToolTip="Acumulado do 4º Quadrimestre" Name="band_Trimestre_4">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="p4_vlrRev" 
                                                    VisibleIndex="2" Width="100px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="Green" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p4_percRev" VisibleIndex="3" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="Green" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="p4_vlrRea" 
                                                    VisibleIndex="4" Width="100px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p4_percRea" VisibleIndex="5" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="p4_vlrMxR" 
                                                    VisibleIndex="7" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="p4_percMxR" 
                                                    VisibleIndex="9" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="p4_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p4_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#333333" >
                                            <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </HeaderStyle>
                                        </dx:GridViewBandColumn><%--TRIMESTRE 4  VisibleIndex="10"--%>

                                <dx:GridViewBandColumn Caption="4º Quadrimestre" VisibleIndex="9" Name="band_Periodo_4">
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Outubro" VisibleIndex="1">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="m10_vlrRev" 
                                                    VisibleIndex="2" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m10_percRev" VisibleIndex="3" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="m10_vlrRea" 
                                                    VisibleIndex="4" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m10_percRea" VisibleIndex="5" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                   <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="m10_vlrMxR" 
                                                    VisibleIndex="7" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="m10_percMxR" 
                                                    VisibleIndex="9" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="m10_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m10_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#666666" >
                                            <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </HeaderStyle>
                                        </dx:GridViewBandColumn> <%--10 - Outubro--%>
                                        <dx:GridViewBandColumn Caption="Novembro" VisibleIndex="2">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="m11_vlrRev" 
                                                    VisibleIndex="2" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m11_percRev" VisibleIndex="3" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="m11_vlrRea" 
                                                    VisibleIndex="4" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m11_percRea" VisibleIndex="5" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="m11_vlrMxR" 
                                                    VisibleIndex="7" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="m11_percMxR" 
                                                    VisibleIndex="9" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="m11_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m11_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#666666" >
                                            <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </HeaderStyle>
                                        </dx:GridViewBandColumn> <%--11 - Novembro--%>
                                        <dx:GridViewBandColumn Caption="Dezembro" VisibleIndex="4">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="m12_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m12_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="m12_vlrRev" 
                                                    VisibleIndex="2" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m12_percRev" VisibleIndex="3" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="m12_vlrRea" 
                                                    VisibleIndex="4" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m12_percRea" VisibleIndex="5" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="m12_vlrMxR" 
                                                    VisibleIndex="6" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="m12_percMxR" 
                                                    VisibleIndex="7" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>

                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#666666" >
                                            <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </HeaderStyle>
                                        </dx:GridViewBandColumn> <%--12 - Dezembro--%>

                                        
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" BackColor="#666666" >
                                    <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </HeaderStyle>
                                </dx:GridViewBandColumn> <%-- 4º Periodo  VisibleIndex="9"--%>

                                <dx:GridViewBandColumn Caption="3º Trimestre" VisibleIndex="8" ToolTip="Acumulado do 3º período" Name="band_Trimestre_3">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="p3_vlrRev" 
                                                    VisibleIndex="2" Width="100px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="Green" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p3_percRev" VisibleIndex="3" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="Green" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="p3_vlrRea" 
                                                    VisibleIndex="4" Width="100px" >
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p3_percRea" VisibleIndex="5" 
                                                    Width="60px" >
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="p3_vlrMxR" 
                                                    VisibleIndex="7" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="p3_percMxR" 
                                                    VisibleIndex="9" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="p3_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p3_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewBandColumn> <%--TRIMESTRE 3  VisibleIndex="8"--%>

                                <dx:GridViewBandColumn Caption="3º Período" VisibleIndex="7" Name="band_Periodo_3">
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Julho" VisibleIndex="0">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="m7_vlrRev" 
                                                    VisibleIndex="2" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m7_percRev" VisibleIndex="3" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="m7_vlrRea" 
                                                    VisibleIndex="4" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m7_percRea" VisibleIndex="5" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="m7_vlrMxR" 
                                                    VisibleIndex="7" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="m7_percMxR" 
                                                    VisibleIndex="9" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="m7_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m7_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewBandColumn> <%--07 - Julho--%>
                                        <dx:GridViewBandColumn Caption="Agosto" VisibleIndex="1">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="m8_vlrRev" 
                                                    VisibleIndex="2" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m8_percRev" VisibleIndex="3" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="m8_vlrRea" 
                                                    VisibleIndex="4" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m8_percRea" VisibleIndex="5" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="m8_vlrMxR" 
                                                    VisibleIndex="7" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="m8_percMxR" 
                                                    VisibleIndex="9" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="m8_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m8_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewBandColumn> <%--08 - Agosto--%>
                                        <dx:GridViewBandColumn Caption="Setembro" VisibleIndex="2">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="m9_vlrRev" 
                                                    VisibleIndex="3" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m9_percRev" VisibleIndex="3" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="m9_vlrRea" 
                                                    VisibleIndex="4" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m9_percRea" VisibleIndex="5" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="m9_vlrMxR" 
                                                    VisibleIndex="7" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="m9_percMxR" 
                                                    VisibleIndex="9" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="m9_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m9_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewBandColumn> <%--09 - Setembro--%>                                        
                                        
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn> <%-- 3º Periodo  VisibleIndex="7"--%>

                                <dx:GridViewBandColumn Caption="2º Trimestre" VisibleIndex="6" ToolTip="Acumulado do 2º Período" Name="band_Trimestre_2">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="p2_vlrRev" 
                                                    VisibleIndex="2" Width="100px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p2_percRev" VisibleIndex="3" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="p2_vlrRea" 
                                                    VisibleIndex="4" Width="100px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p2_percRea" VisibleIndex="5" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="p2_vlrMxR" 
                                                    VisibleIndex="7" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="p2_percMxR" 
                                                    VisibleIndex="9" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="p2_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p2_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#333333" ForeColor="White" >
                                            <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </HeaderStyle>
                                        </dx:GridViewBandColumn> <%-- TRIMESTRE 2  VisibleIndex="6"--%>

                                <dx:GridViewBandColumn Caption="2º Período" VisibleIndex="5" Name="band_Periodo_2">
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Abril" VisibleIndex="0">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="m4_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m4_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="m4_vlrRev" 
                                                    VisibleIndex="2" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m4_percRev" VisibleIndex="3" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                   <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="m4_vlrRea" 
                                                    VisibleIndex="4" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                   <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m4_percRea" VisibleIndex="5" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="m4_vlrMxR" 
                                                    VisibleIndex="6" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="m4_percMxR" 
                                                    VisibleIndex="7" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>                                                
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#666666" >
                                            <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </HeaderStyle>
                                        </dx:GridViewBandColumn> <%--04 - Abril --%>
                                        <dx:GridViewBandColumn Caption="Maio" VisibleIndex="1">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="m5_vlrRev" 
                                                    VisibleIndex="2" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m5_percRev" VisibleIndex="3" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="m5_vlrRea" 
                                                    VisibleIndex="4" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m5_percRea" VisibleIndex="5" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="m5_vlrMxR" 
                                                    VisibleIndex="7" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="m5_percMxR" 
                                                    VisibleIndex="9" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="m5_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m5_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#666666" >
                                            <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </HeaderStyle>
                                        </dx:GridViewBandColumn> <%--05 - Maio--%>
                                        <dx:GridViewBandColumn Caption="Junho" VisibleIndex="1">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="m6_vlrRev" 
                                                    VisibleIndex="2" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m6_percRev" VisibleIndex="3" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="m6_vlrRea" 
                                                    VisibleIndex="4" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m6_percRea" VisibleIndex="5" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="m6_vlrMxR" 
                                                    VisibleIndex="7" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="m6_percMxR" 
                                                    VisibleIndex="9" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="m6_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m6_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#666666" >
                                            <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </HeaderStyle>
                                        </dx:GridViewBandColumn> <%--06 - Junho--%>
                                        
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" BackColor="#666666" >
                                    <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </HeaderStyle>
                                </dx:GridViewBandColumn> <%-- 2º Periodo  VisibleIndex="5"--%>

                                <dx:GridViewBandColumn Caption="1º Trimestre" VisibleIndex="4" ToolTip="Acumulado do 1º Período" Name="band_Trimestre_1">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="p1_vlrRev" 
                                                    VisibleIndex="2" Width="100px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p1_percRev" VisibleIndex="3" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="p1_vlrRea" 
                                                    VisibleIndex="4" Width="100px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p1_percRea" VisibleIndex="5" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="p1_vlrMxR" 
                                                    VisibleIndex="7" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="p1_percMxR" 
                                                    VisibleIndex="9" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="p1_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p1_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewBandColumn> <%-- TRIMESTRE 1   VisibleIndex="4" --%>

                                <dx:GridViewBandColumn Caption="1º Período" VisibleIndex="3" Name="band_Periodo_1">
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Janeiro" VisibleIndex="2">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="m1_vlrRev" 
                                                    VisibleIndex="1" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m1_percRev" VisibleIndex="2" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="m1_vlrRea" 
                                                    VisibleIndex="3" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m1_percRea" VisibleIndex="5" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="m1_vlrMxR" 
                                                    VisibleIndex="7" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="m1_percMxR" 
                                                    VisibleIndex="9" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="m1_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m1_percOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewBandColumn> <%--01 - Janeiro --%>
                                        <dx:GridViewBandColumn Caption="Fevereiro" VisibleIndex="4">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="m2_vlrRev" 
                                                    VisibleIndex="2" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m2_percRev" VisibleIndex="3" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="m2_vlrRea" 
                                                    VisibleIndex="4" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m2_percRea" VisibleIndex="5" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="m2_vlrMxR" 
                                                    VisibleIndex="7" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="m2_percMxR" 
                                                    VisibleIndex="9" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="m2_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m2_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewBandColumn> <%--02 - Fevereiro --%>
                                        <dx:GridViewBandColumn Caption="Março" VisibleIndex="6">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Revista" FieldName="m3_vlrRev" 
                                                    VisibleIndex="2" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m3_percRev" VisibleIndex="3" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" /> 
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="m3_vlrRea" 
                                                    VisibleIndex="4" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m3_percRea" VisibleIndex="5" 
                                                    Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White"/>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="m3_vlrMxR" 
                                                    VisibleIndex="7" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif. %" FieldName="m3_percMxR" 
                                                    VisibleIndex="9" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Original" FieldName="m3_vlrOri" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="m3_percOri" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Visible="False">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewBandColumn> <%--03 - Marco --%>
                                        
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn> <%-- 1º Periodo  VisibleIndex="3"--%>

                                <dx:GridViewDataTextColumn Caption="ID" FieldName="idGrupo" VisibleIndex="0" 
                                    Width="30px" FixedStyle="Left">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </dx:GridViewDataTextColumn> <%--ID  VisibleIndex="0" --%>

                                <dx:GridViewDataTextColumn Caption="Descrição" FieldName="descConta" 
                                    VisibleIndex="1" Width="150px" FixedStyle="Left">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn> <%--Descricao  VisibleIndex="1"--%>

                                <dx:GridViewDataTextColumn FieldName="Ordem" Visible="False" VisibleIndex="131">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Visible="False" Mode="ShowAllRecords">
                            </SettingsPager>
                             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                                ShowFooter="True" ShowHorizontalScrollBar="True" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <FocusedRow BackColor="#FF99FF" ForeColor="Blue">
                                </FocusedRow>
                                <Footer BackColor="#99FFCC" Font-Bold="True" ForeColor="Blue">
                                </Footer>
                            </Styles>
                        </dx:ASPxGridView>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                            SelectCommand="Resultados.uspBuscarTeorico12Meses_Posto" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

               <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="ASPxLabel" ClientInstanceName ="checkStateLabel" Visible="False">
            </dx:ASPxLabel>
            <br />
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="ASPxLabel" ClientInstanceName ="checkedLabel" Visible="False">
            </dx:ASPxLabel> 
        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Banco: gerBI" Anotacao2="Stored Procedure: Resultados.uspBuscarTeorico12Meses" />
</asp:Content>

