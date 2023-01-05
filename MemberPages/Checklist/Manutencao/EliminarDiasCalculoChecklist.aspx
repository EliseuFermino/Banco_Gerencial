<%@ Page Title="Alterar Datas - Pontuação Checklist" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="EliminarDiasCalculoChecklist.aspx.vb" Inherits="MemberPages_Checklist_Manutencao_EliminarDiasCalculoChecklist" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register Src="~/Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link href="../../../css/bootstrap.min.css" rel="stylesheet" />

    <style type="text/css">

        .Aumentar_Espaco {
           margin-top: 10px
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <br />

    <div class="container-fluid">

        <div class="row">
            <div class="col-md-3 ">
            </div>
        </div>
   

        <div class="row ">
            
            <div class="col-md-1 ">
                Selecione um Dia: 
            </div>
            <div class="col-md-3 ">
                <dx:ASPxDateEdit ID="cboDia" runat="server" Theme="iOS" AutoPostBack="True"></dx:ASPxDateEdit>            
             </div>
        </div>

        <div class="row  Aumentar_Espaco center-text">
            <div class="col-md-1 ">
                <asp:Button ID="btn_Cadastrar_Dia" runat="server" Text="Cadastrar Dia" CssClass="btn btn-primary" />
            </div>

            <div class="col-md-1 ">
                <asp:Button ID="btn_Excluir" runat="server" Text="Excluir Dia"  CssClass="btn btn-danger" />
                
            </div>

            <div class="col-md-2 ">
                <asp:Button ID="btn_Recalcular" runat="server" Text="Recalcular Pontuação do Check-List"  CssClass="btn btn-success" />
            </div>

        </div>

        <br /><br />
        
        <br />

        
        <div style="border: 3px solid gray; margin: 5px; padding: 5px">

        
        <div class="row">

            <div class="col-md-2">
                <uc1:wucLista_Filial_Empresa runat="server" ID="cboFilial" />
            </div>           

        </div>

        <div class="row" style="margin-top: 10px">               

        </div>

        <div class="row">
            <div class="col-md-2">
               <asp:Button ID="btnExcluirFilial" runat="server" Text="Excluir Filial"  CssClass="btn btn-danger" />
            </div>

            <div class="col-md-4 ">
                <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="400px">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista" VisibleIndex="0" Width="250px">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Data" FieldName="DiaFeriado" VisibleIndex="1">
                        </dx:GridViewDataDateColumn>
                    </Columns>
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings VerticalScrollableHeight="300" VerticalScrollBarMode="Auto" />
                    <SettingsText EmptyDataRow="Nenhuma Data de Feriado Cadastrado" />
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="usp_BuscarDatasFeriados" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

        </div>
    
        </div>


    </div>


    

    <br />

    


</asp:Content>

