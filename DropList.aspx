<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DropList.aspx.vb" Inherits="DropList" %>

<%@ Import Namespace ="System.Data" %>
<%@ Import Namespace ="System.Data.OleDb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dropdown List</title>

    <script language="VB" runat="server">
        
        Sub Page_Load(Source As Object, E As EventArgs)
            
            If Not Page.IsPostBack Then
                
                ' declara as variaveis usadas no codigo
                Dim strSQL As String
                Dim strConn As String
                Dim Conn As OleDbConnection
                Dim da As OleDbDataAdapter
                Dim ds As DataSet
                
                ' Define a string com o comando SQL e string de conexao usando um provedor OLEDB
                strSQL = "Select * FROM Products"
                strConn = "PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA SOURCE=C:\gerencial_hp_2012_2018\App_Data\TNwind_old.mdb"
                
                ' Abre a conexao com a fonte de dados
                Conn = New OleDbConnection(strConn)
                Conn.Open()
                
                    
                Try
                    ' cria o objeto Data Adapter
                    da = New OleDbDataAdapter(strSQL, Conn)
                    
                    '  cria e preenche o Dataset
                    ds = New DataSet()
                    da.Fill(ds, "Products")
                    
                    ' Define o preenchimento do controle DropDownList
                    ddl1.DataTextField = "ProductName"
                    ddl1.DataValueField = "ProductName"
                    ddl1.DataSource = ds.Tables("Products").DefaultView
                    ddl1.DataBind()
                Catch ex As Exception
                    lbl.Text = ex.Message
                Finally
                    Conn.Close()
                End Try
                
            End If
            
        End Sub
        
    </script>    

</head>

<body>
    
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList id="ddl1" AutoPostBack="true" runat="server" />
        <asp:Label ID="lbl" runat="server" Text =" teste" />
       
    </div>
    </form>
</body>
</html>
