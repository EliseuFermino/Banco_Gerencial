<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Viewer.aspx.vb" Inherits="MemberPages_CheckList_Viewer" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxGridView ID="imgGrid" runat="server" AutoGenerateColumns="False" 
            EnableTheming="True" Theme="DevEx">
            <Columns>
                <dx:GridViewDataImageColumn Caption="Foto" FieldName="imgFile" VisibleIndex="4">
                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top">
                    </CellStyle>
                </dx:GridViewDataImageColumn>
                <dx:GridViewDataTextColumn Caption="Grupo" FieldName="listaGrupo" 
                    GroupIndex="1" SortIndex="1" SortOrder="Ascending" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Sub-Grupo" FieldName="listaSubgrupo" 
                    GroupIndex="2" SortIndex="2" SortOrder="Ascending" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Pergunta" FieldName="descPergunta" 
                    VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Dia" FieldName="Dia" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Filial" FieldName="idFilial" GroupIndex="0" 
                    SortIndex="0" SortOrder="Ascending" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Parecer do Auditor" FieldName="Descricao" 
                    VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Hora" FieldName="Hora" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowGroupPanel="True" />
        </dx:ASPxGridView>
    
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:ImageField DataImageUrlField="imgFile">
            </asp:ImageField>
            <asp:BoundField DataField="idFilial" />
        </Columns>
    </asp:GridView>
    </form>
</body>
</html>
