<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaDiaIniFin.ascx.vb" Inherits="Controles_wucListaDiaIniFin" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>




<style type="text/css">

    #divDescPeriodoDE {
        float:left;
        padding-right: 4px;        
    }

    #divDiaInicial {
        float:left;
    }

    #divDiaFinal {
        float:left;
        margin-left: 20px;
        margin-top: -14px;     
    }

    #divDescPeriodoE {
        float:left;
        padding-left: 4px;
        padding-right: 4px;        
        width: 20px;       
        font-size:medium;    
    }

    #divMesmosDias {
        float:left;
        padding-left: 4px
    }

    #divMesAnterior {
        float:left;
        padding-left: 15px
    }

    #div_wucListaDiaIniFin {       
        height: 21px;      
        padding-bottom: 1px;
        padding-right: 3px;
        padding-left: 2px;
    }

</style>

<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>--%>
    
        <div id="div_wucListaDiaIniFin">

            <div id="divDiaInicial">    
            <dx:ASPxDateEdit ID="cboDiaInicial" runat="server" Theme="Mulberry" AutoPostBack="false" 
                Width="115px" AllowUserInput="False" Caption="Período de">
                <CalendarProperties ClearButtonText="Limpar" TodayButtonText="Hoje">
                </CalendarProperties>
            </dx:ASPxDateEdit>
        </div>

            <div id="divDescPeriodoE" runat="server">
           &nbsp; à
        </div>
            &nbsp;
            <div id="divDiaFinal">
            <dx:ASPxDateEdit ID="cboDiaFinal" runat="server" Theme="Mulberry"  AutoPostBack="false"
                Width="115px" AllowUserInput="False">
                <CalendarProperties ClearButtonText="Limpar" TodayButtonText="Hoje">
                </CalendarProperties>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:ASPxDateEdit>
        </div> 
    
            <div id="divMesAnterior">
            <dx:ASPxCheckBox ID="chkMesAnterior" runat="server" Visible ="False" Theme ="DevEx" ForeColor ="#006600" Text ="Mês Anterior" ToolTip="Quando esta opção estiver selecionada o programa compara os Mês Anterior, por exemplo: 01/10/2017 a 15/10/17 x 01/09/2017 a 15/09/2017." CheckState="Unchecked" ClientInstanceName="chkMesAnterior"  >
                <ClientSideEvents CheckedChanged="function(s, e) {

	        if (chkMesAnterior.GetChecked(true)) {
		        chkMesmosDias.SetVisible(false);
	        }

	        if (chkMesAnterior.GetChecked(false)) {
		        chkMesmosDias.SetVisible(true);
	        } 

	        cbPanel.PerformCallback();
        }" />
            </dx:ASPxCheckBox>
        </div>

            <div id="divMesmosDias">
                <dx:ASPxCheckBox ID="chkMesmosDias" runat="server" Visible ="False" Theme ="DevEx" ForeColor ="Blue" Text ="Mesmos Dias" AutoPostBack="false"  
                    ToolTip="Quando esta opção estiver selecionada o programa compara os mesmos dias da semana, Segunda com Segunda, Terça com Terça, Quarta com Quarta e assim por diante." CheckState="Unchecked" ClientInstanceName="chkMesmosDias" >                
                </dx:ASPxCheckBox>
            </div>

            <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red" Font-Size="Large" Visible="false" ></asp:Label>

        </div>

<%--    </ContentTemplate>
</asp:UpdatePanel>--%>


