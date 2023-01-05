<%@ Page Title="Consulta Nivel Rateio" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ConsultaNivelRateio.aspx.vb" Inherits="MemberPages_CentroCusto_Cadastro_ConsultaNivelRateio" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divLegenda1 {
            clear:both;
            float: left;
            margin-left: 2px;
            margin-top: 3px;
        }

        #divCboRateioNivel {            
            float: left;
            margin-left: 2px;
        }

        #divDados {
            clear:both;
            float: left;
            margin-left: 2px;
            margin-top: 3px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div id="divLegenda1">
                <asp:Label ID="lblLegenda1" runat="server" Text="Nivel de Rateio:"></asp:Label>
            </div>

            <div id="divCboRateioNivel">
                <asp:DropDownList ID="cboRateioLista" runat="server" DataSourceID="SqlDataSource1" DataTextField="descNivelRateio" DataValueField="idNivelRateio" AutoPostBack="True"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="Cad.uspLista_CentroCusto_NivelRateio" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </div>

            <div id="divDados">
                <asp:GridView ID="grid" runat="server" DataSourceID="dsGrid" AutoGenerateColumns="False" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="CENTRODECUSTO" HeaderText="ID" SortExpression="CENTRODECUSTO" />
                        <asp:BoundField DataField="descCentroCusto" HeaderText="Descrição" SortExpression="descCentroCusto" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsGrid" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="Cad.uspBuscarCentroCustoPorNivelRateio" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cboRateioLista" Name="idNivelRateio" PropertyName="SelectedValue" Type="Byte" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

