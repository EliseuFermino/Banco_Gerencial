<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Desp_Mes_a_Mes.aspx.vb" Inherits="MemberPages_Despesas_Desp_Mes_a_Mes" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divSecao {            
            float: left;
            margin-left: 10px;
        }

        #divFilial {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        #divSize {            
            float: left;           
        }

        #divGrupo_Subgrupo { 
            clear:both;
            float: left;
            margin-left: 5px;                    
        }

        #divTipos {   
            clear: both;          
            float: left;
            margin-left: 5px;                    
        }

        #divMeses {                    
            float: left;
            margin-left: 5px;                    
        }

        

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            padding-right: 5px;
            width: 100%;
           
        }

        /* ------ CLASSES ------ */
        
        .Despesa_CheckBox {
            float: left;
            margin-right: 5px;
            margin-left: 5px;
        }

        .Despesa_Box {
            border: 1px solid silver ;
            height: 35px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>
        
    <div id="divSecao">
        <uc1:wucListaSecao runat="server" ID="cboSecao" Visible="false"  />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>


    <div id="divGrupo_Subgrupo" class="Despesa_Box" runat="server"  >

        <div id="divGrupo" class="Despesa_CheckBox">
            <dx:ASPxRadioButton ID="rndGrupo" runat="server" Text="Grupo" GroupName="gGroup" Theme="MaterialCompactOrange">
            </dx:ASPxRadioButton>
        </div>

        <div id="divSubgrupo" class="Despesa_CheckBox">
            <dx:ASPxRadioButton ID="rndSubgrupo" runat="server" Checked="True" Text="Subgrupo" GroupName="gGroup" Theme="MaterialCompactOrange">
                <ClientSideEvents CheckedChanged="function(s, e) {
}" />
            </dx:ASPxRadioButton>
        </div>

    </div> 


    <div id="divTipos" class="Despesa_Box" >

        <div id="divOriginal" class="Despesa_CheckBox" > 
            <dx:ASPxCheckBox ID="chkOriginal" runat="server" Theme="MaterialCompactOrange" Text="Meta Original" AutoPostBack="false" Checked="false" ForeColor="Orange"  ></dx:ASPxCheckBox>
        </div>

        <div id="divRevista" class="Despesa_CheckBox">
            <dx:ASPxCheckBox ID="chkRevista" runat="server" Theme="MaterialCompactOrange" Text="Meta Revista" AutoPostBack="false" Checked="true"  ForeColor="Green" ></dx:ASPxCheckBox>
        </div>

        <div id="divRealizado" class="Despesa_CheckBox">
            <dx:ASPxCheckBox ID="chkRealizado" runat="server" Theme="MaterialCompactOrange" Text="Realizado" AutoPostBack="false" Checked="true" ForeColor="Blue"  ></dx:ASPxCheckBox>
        </div>

    </div>

    <div id="divMeses"  class="Despesa_Box">

        <div id="divMes01" class="Despesa_CheckBox" > 
            <dx:ASPxCheckBox ID="chkMes01" runat="server" Theme="MaterialCompact" Text="Jan" AutoPostBack="false" Checked="true" ></dx:ASPxCheckBox>
        </div>

        <div id="div1" class="Despesa_CheckBox" > 
            <dx:ASPxCheckBox ID="chkMes02" runat="server" Theme="MaterialCompact" Text="Fev" AutoPostBack="false" Checked="true" ></dx:ASPxCheckBox>
        </div>

        <div id="div2" class="Despesa_CheckBox" > 
            <dx:ASPxCheckBox ID="chkMes03" runat="server" Theme="MaterialCompact" Text="Mar" AutoPostBack="false" Checked="true" ></dx:ASPxCheckBox>
        </div>

        <div id="div3" class="Despesa_CheckBox" > 
            <dx:ASPxCheckBox ID="chkMes04" runat="server" Theme="MaterialCompact" Text="Abr" AutoPostBack="false" Checked="true" ></dx:ASPxCheckBox>
        </div>

        <div id="div4" class="Despesa_CheckBox" > 
            <dx:ASPxCheckBox ID="chkMes05" runat="server" Theme="MaterialCompact" Text="Mai" AutoPostBack="false" Checked="true" ></dx:ASPxCheckBox>
        </div>

        <div id="div5" class="Despesa_CheckBox" > 
            <dx:ASPxCheckBox ID="chkMes06" runat="server" Theme="MaterialCompact" Text="Jun" AutoPostBack="false" Checked="true" ></dx:ASPxCheckBox>
        </div>

        <div id="div6" class="Despesa_CheckBox" > 
            <dx:ASPxCheckBox ID="chkMes07" runat="server" Theme="MaterialCompact" Text="Jul" AutoPostBack="false" Checked="true" ></dx:ASPxCheckBox>
        </div>

        <div id="div7" class="Despesa_CheckBox" > 
            <dx:ASPxCheckBox ID="chkMes08" runat="server" Theme="MaterialCompact" Text="Ago" AutoPostBack="false" Checked="true" ></dx:ASPxCheckBox>
        </div>

        <div id="div8" class="Despesa_CheckBox" > 
            <dx:ASPxCheckBox ID="chkMes09" runat="server" Theme="MaterialCompact" Text="Set" AutoPostBack="false" Checked="true" ></dx:ASPxCheckBox>
        </div>

        <div id="div9" class="Despesa_CheckBox" > 
            <dx:ASPxCheckBox ID="chkMes10" runat="server" Theme="MaterialCompact" Text="Out" AutoPostBack="false" Checked="true" ></dx:ASPxCheckBox>
        </div>

        <div id="div10" class="Despesa_CheckBox" > 
            <dx:ASPxCheckBox ID="chkMes11" runat="server" Theme="MaterialCompact" Text="Nov" AutoPostBack="false" Checked="true" ></dx:ASPxCheckBox>
        </div>

        <div id="div11" class="Despesa_CheckBox" > 
            <dx:ASPxCheckBox ID="chkMes12" runat="server" Theme="MaterialCompact" Text="Dez" AutoPostBack="false" Checked="true" ></dx:ASPxCheckBox>
        </div>

        <div id="div12" class="Despesa_CheckBox" > 
            <dx:ASPxCheckBox ID="chkAno" runat="server" Theme="MaterialCompact" Text="Ano" AutoPostBack="false" Checked="true" ></dx:ASPxCheckBox>
        </div>

    </div>


    




    <div id="divDados">
        

        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>

                    <asp:Label ID="lblInfo" runat="server" Text="Label" Visible="False"></asp:Label>

                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados"  AutoGenerateColumns="False" KeyFieldName="Ano" Width="100%" Theme="SoftOrange" ClientInstanceName="grid">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m1" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m2" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m3" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m4" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m5" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m6" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m7" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m8" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m9" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m10" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m11" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m12" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m99" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m1" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m2" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m3" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m4" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m5" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m6" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m7" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m8" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m9" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m10" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m11" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m12" SummaryType="Custom" />                          
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m99" SummaryType="Custom" />



                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m1" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m2" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m3" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m4" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m5" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m6" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m7" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m8" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m9" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m10" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m11" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m12" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m99" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m1" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m2" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m3" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m4" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m5" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m6" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m7" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m8" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m9" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m10" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m11" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m12" SummaryType="Custom" />                          
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m99" SummaryType="Custom" />



                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m1" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m2" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m3" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m4" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m5" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m6" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m7" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m8" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m9" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m10" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m11" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m12" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m99" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m1" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m2" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m3" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m4" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m5" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m6" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m7" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m8" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m9" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m10" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m11" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m12" SummaryType="Custom" />                          
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m99" SummaryType="Custom" />

                        </TotalSummary>

                         <GroupSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m1" ShowInGroupFooterColumn="vlrRealizado_m1" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m2" ShowInGroupFooterColumn="vlrRealizado_m2" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m3" ShowInGroupFooterColumn="vlrRealizado_m3" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m4" ShowInGroupFooterColumn="vlrRealizado_m4" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m5" ShowInGroupFooterColumn="vlrRealizado_m5" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m6" ShowInGroupFooterColumn="vlrRealizado_m6" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m7" ShowInGroupFooterColumn="vlrRealizado_m7" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m8" ShowInGroupFooterColumn="vlrRealizado_m8" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m9" ShowInGroupFooterColumn="vlrRealizado_m9" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m10" ShowInGroupFooterColumn="vlrRealizado_m10" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m11" ShowInGroupFooterColumn="vlrRealizado_m11" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m12" ShowInGroupFooterColumn="vlrRealizado_m12" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealizado_m99" ShowInGroupFooterColumn="vlrRealizado_m99" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m1" ShowInGroupFooterColumn="vlrRevista_m1" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m2" ShowInGroupFooterColumn="vlrRevista_m2" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m3" ShowInGroupFooterColumn="vlrRevista_m3" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m4" ShowInGroupFooterColumn="vlrRevista_m4" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m5" ShowInGroupFooterColumn="vlrRevista_m5" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m6" ShowInGroupFooterColumn="vlrRevista_m6" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m7" ShowInGroupFooterColumn="vlrRevista_m7" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m8" ShowInGroupFooterColumn="vlrRevista_m8" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m9" ShowInGroupFooterColumn="vlrRevista_m9" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m10" ShowInGroupFooterColumn="vlrRevista_m10" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m11" ShowInGroupFooterColumn="vlrRevista_m11" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m12" ShowInGroupFooterColumn="vlrRevista_m12" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRevista_m99" ShowInGroupFooterColumn="vlrRevista_m99" SummaryType="Sum" />

                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m1" ShowInGroupFooterColumn="percRealizado_m1" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m2" ShowInGroupFooterColumn="percRealizado_m2" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m3" ShowInGroupFooterColumn="percRealizado_m3" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m4" ShowInGroupFooterColumn="percRealizado_m4" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m5" ShowInGroupFooterColumn="percRealizado_m5" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m6" ShowInGroupFooterColumn="percRealizado_m6" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m7" ShowInGroupFooterColumn="percRealizado_m7" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m8" ShowInGroupFooterColumn="percRealizado_m8" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m9" ShowInGroupFooterColumn="percRealizado_m9" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m10" ShowInGroupFooterColumn="percRealizado_m10" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m11" ShowInGroupFooterColumn="percRealizado_m11" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m12" ShowInGroupFooterColumn="percRealizado_m12" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealizado_m99" ShowInGroupFooterColumn="percRealizado_m99" SummaryType="Custom" />

                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m1" ShowInGroupFooterColumn="percRevista_m1" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m2" ShowInGroupFooterColumn="percRevista_m2" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m3" ShowInGroupFooterColumn="percRevista_m3" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m4" ShowInGroupFooterColumn="percRevista_m4" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m5" ShowInGroupFooterColumn="percRevista_m5" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m6" ShowInGroupFooterColumn="percRevista_m6" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m7" ShowInGroupFooterColumn="percRevista_m7" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m8" ShowInGroupFooterColumn="percRevista_m8" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m9" ShowInGroupFooterColumn="percRevista_m9" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m10" ShowInGroupFooterColumn="percRevista_m10" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m11" ShowInGroupFooterColumn="percRevista_m11" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m12" ShowInGroupFooterColumn="percRevista_m12" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRevista_m99" ShowInGroupFooterColumn="percRevista_m99" SummaryType="Custom" />




                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m1" ShowInGroupFooterColumn="vlrOriginal_m1" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m2" ShowInGroupFooterColumn="vlrOriginal_m2" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m3" ShowInGroupFooterColumn="vlrOriginal_m3" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m4" ShowInGroupFooterColumn="vlrOriginal_m4" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m5" ShowInGroupFooterColumn="vlrOriginal_m5" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m6" ShowInGroupFooterColumn="vlrOriginal_m6" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m7" ShowInGroupFooterColumn="vlrOriginal_m7" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m8" ShowInGroupFooterColumn="vlrOriginal_m8" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m9" ShowInGroupFooterColumn="vlrOriginal_m9" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m10" ShowInGroupFooterColumn="vlrOriginal_m10" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m11" ShowInGroupFooterColumn="vlrOriginal_m11" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m12" ShowInGroupFooterColumn="vlrOriginal_m12" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOriginal_m99" ShowInGroupFooterColumn="vlrOriginal_m99" SummaryType="Sum" />

                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m1" ShowInGroupFooterColumn="percOriginal_m1" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m2" ShowInGroupFooterColumn="percOriginal_m2" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m3" ShowInGroupFooterColumn="percOriginal_m3" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m4" ShowInGroupFooterColumn="percOriginal_m4" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m5" ShowInGroupFooterColumn="percOriginal_m5" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m6" ShowInGroupFooterColumn="percOriginal_m6" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m7" ShowInGroupFooterColumn="percOriginal_m7" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m8" ShowInGroupFooterColumn="percOriginal_m8" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m9" ShowInGroupFooterColumn="percOriginal_m9" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m10" ShowInGroupFooterColumn="percOriginal_m10" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m11" ShowInGroupFooterColumn="percOriginal_m11" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m12" ShowInGroupFooterColumn="percOriginal_m12" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOriginal_m99" ShowInGroupFooterColumn="percOriginal_m99" SummaryType="Custom" />

                            
                        </GroupSummary>


                        <SettingsText Title="DESPESA MÊS A MÊS" />
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="idSubgrupo" ShowInCustomizationForm="True" VisibleIndex="2" ReadOnly="True" FixedStyle="Left" Width="40px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="DescDespesa" ShowInCustomizationForm="True" VisibleIndex="3" FixedStyle="Left" Width="200px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Janeiro" ShowInCustomizationForm="True" VisibleIndex="5" Name="band_Mes_01">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA1_m1" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA2_m1" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA2_m1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA1_m1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Realizado" ShowInCustomizationForm="True" VisibleIndex="7" Name="bandRealizado_m1">
                                        <HeaderStyle BackColor="#0070C0" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrRealizado_m1" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percRealizado_m1" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Meta Revista" ShowInCustomizationForm="True" VisibleIndex="6" Name="bandRevista_m1">
                                        <HeaderStyle BackColor="Green" ForeColor="White" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percRevista_m1" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" ForeColor="White" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrRevista_m1" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" ForeColor="White" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Meta Original" ShowInCustomizationForm="True" VisibleIndex="5" Name="bandOriginal_m1">
                                        <HeaderStyle BackColor="Orange" ForeColor="White" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrOriginal_m1" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" ForeColor="White" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percOriginal_m1" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" ForeColor="White" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Fevereiro" ShowInCustomizationForm="True" VisibleIndex="6" Name="band_Mes_02">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m2" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m2" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m2" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m2" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA1_m2" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA2_m2" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA2_m2" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA1_m2" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Meta Revista" ShowInCustomizationForm="True" VisibleIndex="12" Name="bandRevista_m2">
                                        <HeaderStyle BackColor="Green" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRevista_m2" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRevista_m2" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Realizado" ShowInCustomizationForm="True" VisibleIndex="13" Name="bandRealizado_m2">
                                        <HeaderStyle BackColor="#0070C0" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealizado_m2" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRealizado_m2" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Meta Original" Name="bandOriginal_m2" ShowInCustomizationForm="True" VisibleIndex="11">
                                        <HeaderStyle BackColor="Orange" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrOriginal_m2" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percOriginal_m2" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Março" ShowInCustomizationForm="True" VisibleIndex="7" Name="band_Mes_03">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m3" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m3" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m3" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m3" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA1_m3" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA2_m3" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA2_m3" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA1_m3" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Meta Revista" ShowInCustomizationForm="True" VisibleIndex="12" Name="bandRevista_m3">
                                        <HeaderStyle BackColor="Green" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRevista_m3" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRevista_m3" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Realizado" ShowInCustomizationForm="True" VisibleIndex="13" Name="bandRealizado_m3">
                                        <HeaderStyle BackColor="#0070C0" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealizado_m3" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRealizado_m3" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Meta Original" Name="bandOriginal_m3" ShowInCustomizationForm="True" VisibleIndex="11">
                                        <HeaderStyle BackColor="Orange" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrOriginal_m3" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percOriginal_m3" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Abril" ShowInCustomizationForm="True" VisibleIndex="12" Name="band_Mes_04">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m4" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m4" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m4" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m4" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA1_m4" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA2_m4" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA2_m4" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA1_m4" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Meta Revista" ShowInCustomizationForm="True" VisibleIndex="12" Name="bandRevista_m4">
                                        <HeaderStyle BackColor="Green" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRevista_m4" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRevista_m4" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Realizado" ShowInCustomizationForm="True" VisibleIndex="13" Name="bandRealizado_m4">
                                        <HeaderStyle BackColor="#0070C0" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealizado_m4" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRealizado_m4" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Meta Original" Name="bandOriginal_m4" ShowInCustomizationForm="True" VisibleIndex="11">
                                        <HeaderStyle BackColor="Orange" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrOriginal_m4" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percOriginal_m4" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Quadrimestre" ShowInCustomizationForm="True" Visible="False" VisibleIndex="21">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevista_m14" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevista_m14" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m14" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m14" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m14" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m14" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizado_m14" ShowInCustomizationForm="True" VisibleIndex="6">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizado_m14" ShowInCustomizationForm="True" VisibleIndex="7" Width="65px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Junho" ShowInCustomizationForm="True" VisibleIndex="40" Name="band_Mes_06">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m6" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m6" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m6" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m6" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA1_m6" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA2_m6" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA2_m6" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA1_m6" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Meta Revista" ShowInCustomizationForm="True" VisibleIndex="12" Name="bandRevista_m6">
                                        <HeaderStyle BackColor="Green" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRevista_m6" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRevista_m6" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Realizado" ShowInCustomizationForm="True" VisibleIndex="13" Name="bandRealizado_m6">
                                        <HeaderStyle BackColor="#0070C0" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealizado_m6" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRealizado_m6" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Meta Original" Name="bandOriginal_m6" ShowInCustomizationForm="True" VisibleIndex="11">
                                        <HeaderStyle BackColor="Orange" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrOriginal_m6" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percOriginal_m6" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Julho" ShowInCustomizationForm="True" VisibleIndex="50" Name="band_Mes_07">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m7" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m7" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m7" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m7" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA1_m7" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA2_m7" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA2_m7" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA1_m7" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Meta Revista" ShowInCustomizationForm="True" VisibleIndex="12" Name="bandRevista_m7">
                                        <HeaderStyle BackColor="Green" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRevista_m7" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRevista_m7" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Realizado" ShowInCustomizationForm="True" VisibleIndex="13" Name="bandRealizado_m7">
                                        <HeaderStyle BackColor="#0070C0" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealizado_m7" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRealizado_m7" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Meta Original" Name="bandOriginal_m7" ShowInCustomizationForm="True" VisibleIndex="11">
                                        <HeaderStyle BackColor="Orange" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrOriginal_m7" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percOriginal_m7" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Agosto" ShowInCustomizationForm="True" VisibleIndex="59" Name="band_Mes_08">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m8" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m8" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m8" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m8" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA1_m8" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA2_m8" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA2_m8" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA1_m8" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Meta Revista" ShowInCustomizationForm="True" VisibleIndex="12" Name="bandRevista_m8">
                                        <HeaderStyle BackColor="Green" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRevista_m8" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRevista_m8" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Realizado" ShowInCustomizationForm="True" VisibleIndex="13" Name="bandRealizado_m8">
                                        <HeaderStyle BackColor="#0070C0" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealizado_m8" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRealizado_m8" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Meta Original" Name="bandOriginal_m8" ShowInCustomizationForm="True" VisibleIndex="11">
                                        <HeaderStyle BackColor="Orange" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrOriginal_m8" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percOriginal_m8" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Setembro" ShowInCustomizationForm="True" VisibleIndex="69" Name="band_Mes_09">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m9" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m9" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m9" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m9" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA1_m9" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA2_m9" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA2_m9" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA1_m9" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Meta Revista" ShowInCustomizationForm="True" VisibleIndex="12" Name="bandRevista_m9">
                                        <HeaderStyle BackColor="Green" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRevista_m9" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRevista_m9" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Realizado" ShowInCustomizationForm="True" VisibleIndex="13" Name="bandRealizado_m9">
                                        <HeaderStyle BackColor="#0070C0" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealizado_m9" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRealizado_m9" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Meta Original" Name="bandOriginal_m9" ShowInCustomizationForm="True" VisibleIndex="11">
                                        <HeaderStyle BackColor="Orange" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrOriginal_m9" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percOriginal_m9" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Outubro" ShowInCustomizationForm="True" VisibleIndex="86" Name="band_Mes_10">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m10" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m10" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m10" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m10" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA1_m10" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA2_m10" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA2_m10" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA1_m10" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Meta Revista" ShowInCustomizationForm="True" VisibleIndex="12" Name="bandRevista_m10">
                                        <HeaderStyle BackColor="Green" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRevista_m10" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRevista_m10" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Realizado" ShowInCustomizationForm="True" VisibleIndex="13" Name="bandRealizado_m10">
                                        <HeaderStyle BackColor="#0070C0" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealizado_m10" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRealizado_m10" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Meta Original" Name="bandOriginal_m10" ShowInCustomizationForm="True" VisibleIndex="11">
                                        <HeaderStyle BackColor="Orange" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrOriginal_m10" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percOriginal_m10" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Novembro" ShowInCustomizationForm="True" VisibleIndex="95" Name="band_Mes_11">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m11" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m11" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m11" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m11" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA1_m11" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA2_m11" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA2_m11" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA1_m11" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Meta Revista" ShowInCustomizationForm="True" VisibleIndex="12" Name="bandRevista_m11">
                                        <HeaderStyle BackColor="Green" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRevista_m11" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRevista_m11" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Realizado" ShowInCustomizationForm="True" VisibleIndex="13" Name="bandRealizado_m11">
                                        <HeaderStyle BackColor="#0070C0" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealizado_m11" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRealizado_m11" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Meta Original" Name="bandOriginal_m11" ShowInCustomizationForm="True" VisibleIndex="11">
                                        <HeaderStyle BackColor="Orange" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrOriginal_m11" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percOriginal_m11" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Dezembro" ShowInCustomizationForm="True" VisibleIndex="105" Name="band_Mes_12">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m12" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m12" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m12" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m12" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA1_m12" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA2_m12" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA2_m12" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA1_m12" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Meta Revista" ShowInCustomizationForm="True" VisibleIndex="12" Name="bandRevista_m12">
                                        <HeaderStyle BackColor="Green" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRevista_m12" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRevista_m12" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Realizado" ShowInCustomizationForm="True" VisibleIndex="13" Name="bandRealizado_m12">
                                        <HeaderStyle BackColor="#0070C0" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealizado_m12" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRealizado_m12" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Meta Original" Name="bandOriginal_m12" ShowInCustomizationForm="True" VisibleIndex="11">
                                        <HeaderStyle BackColor="Orange" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrOriginal_m12" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percOriginal_m12" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="3º Quadrimestre" ShowInCustomizationForm="True" Visible="False" VisibleIndex="113">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevista_m34" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevista_m34" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m34" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m34" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m34" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m34" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizado_m34" ShowInCustomizationForm="True" VisibleIndex="6">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizado_m34" ShowInCustomizationForm="True" VisibleIndex="7">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Ano" ShowInCustomizationForm="True" VisibleIndex="4" FixedStyle="Left" Name="band_Ano">
                                <HeaderStyle BackColor="Gray" ForeColor="White" />
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m99" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m99" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m99" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m99" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Realizado" ShowInCustomizationForm="True" VisibleIndex="9" Name="bandRealizado_m99">
                                        <HeaderStyle BackColor="#0070C0" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealizado_m99" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRealizado_m99" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Meta Revista" ShowInCustomizationForm="True" VisibleIndex="8" Name="bandRevista_m99">
                                        <HeaderStyle BackColor="Green" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRevista_m99" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRevista_m99" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Meta Original" Name="bandOriginal_m99" ShowInCustomizationForm="True" VisibleIndex="7">
                                        <HeaderStyle BackColor="Orange" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrOriginal_m99" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percOriginal_m99" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="1º Semestre" ShowInCustomizationForm="True" Visible="False" VisibleIndex="130">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevista_m16" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevista_m16" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m16" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m16" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m16" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m16" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizado_m16" ShowInCustomizationForm="True" VisibleIndex="6">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizado_m16" ShowInCustomizationForm="True" VisibleIndex="7">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="2º Semestre" ShowInCustomizationForm="True" Visible="False" VisibleIndex="140">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevista_m26" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevista_m26" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m26" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m26" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m26" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m26" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizado_m26" ShowInCustomizationForm="True" VisibleIndex="6">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizado_m26" ShowInCustomizationForm="True" VisibleIndex="7">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Maio" ShowInCustomizationForm="True" VisibleIndex="39" Name="band_Mes_05">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m5" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m5" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m5" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m5" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA1_m5" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevistaAA2_m5" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA2_m5" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevistaAA1_m5" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Meta Revista" ShowInCustomizationForm="True" VisibleIndex="12" Name="bandRevista_m5">
                                        <HeaderStyle BackColor="Green" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRevista_m5" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRevista_m5" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Green" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Realizado" ShowInCustomizationForm="True" VisibleIndex="13" Name="bandRealizado_m5">
                                        <HeaderStyle BackColor="#0070C0" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealizado_m5" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percRealizado_m5" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0070C0" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Meta Original" Name="bandOriginal_m5" ShowInCustomizationForm="True" VisibleIndex="11">
                                        <HeaderStyle BackColor="Orange" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrOriginal_m5" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percOriginal_m5" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Orange" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="2º Quadrimestre" ShowInCustomizationForm="True" Visible="False" VisibleIndex="68">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRevista_m24" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRevista_m24" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA2_m24" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA2_m24" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizadoAA1_m24" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizadoAA1_m24" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealizado_m24" ShowInCustomizationForm="True" VisibleIndex="6">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percRealizado_m24" ShowInCustomizationForm="True" VisibleIndex="7" Width="65px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn FieldName="GrupoDesc" GroupIndex="0" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="idGrupo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" AllowGroup="False" />
                        <ClientSideEvents BeginCallback="function(s, e) {
}" />
                        <SettingsPager PageSize="25">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowGroupFooter="VisibleAlways" />
                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                        <SettingsSearchPanel Visible="True" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F3F3F3">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True" BackColor="#CCFFCC">
                            </Footer>
                            <GroupFooter Font-Bold="True">
                            </GroupFooter>
                        </Styles>
                    </dx:ASPxGridView>                    
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="DW.usp_BuscarDespesas_Mes_a_Mes" SelectCommandType="StoredProcedure" EnableCaching="true">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                            
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />		    
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:HiddenField ID="HF_VendaRevista_1" runat="server"  />

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Database: gerDespesas" Anotacao2="Stored Procedure: DW.usp_BuscarDespesas_Mes_a_Mes" Visible="true"  />
</asp:Content>
