<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucCheckListControl.ascx.vb" Inherits="Controles_wucCheckListControl" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    
.fileEscondido {
	overflow: hidden;
    position: relative;
}

.fileEscondido input[type=file]{
	opacity: 0;
	font-size: 45px; 
	position: absolute; 
	right: 0px; 
	top: 0px; 
	opacity: 0;
	filter: alpha(opacity=0); 
	-ms-filter: "alpha(opacity=0)"; 
	-khtml-opacity: 0; 
	-moz-opacity: 0;	
	cursor: pointer;
}
.botaoBlock {
	width: 32px;
	height: 32px;
	position: absolute;
	top: 0px;	
	line-height: 42px;
    background:url(http://blog.paulomontoya.com.br/wp-content/uploads/2012/01/1326736657_Add-button.png) top no-repeat;
	padding: 0;
	border: 0;
	outline: none;
}

</style>

<table cellpadding="0" cellspacing="0" class="auto-style1">
    <tr>
        <td style="text-align: center">
            <asp:Label ID="lblNum" runat="server" Text="Label"></asp:Label>
        </td>

        <td>A conferência dos produtos vindos diretamente dos fornecedores ocorre no momento em que os mesmos são descarregados na doca?<asp:TextBox
           ID="txt1_1" runat="server" Width="500" TextMode="MultiLine" Height="50" ></asp:TextBox></td>

        <td align="center"><asp:RadioButton ID="rnd1_1_Sim" runat="server" GroupName="grupo1_1" /></td>
        <td align="center"><asp:RadioButton ID="rnd1_1_Nao" runat="server" GroupName="grupo1_1" /></td>                                
        <td align="center"><asp:RadioButton ID="rnd1_1_NA" runat="server" GroupName="grupo1_1" /></td>                                

        <td align="center">
                <div class="fileEscondido">
                <asp:ImageButton ID="imgFoto1_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                <asp:FileUpload ID="upFile1_1" runat="server"/>                                         
                </div>    
        </td>

        <td align="center">
            <div class="fileEscondido">
                <asp:ImageButton ID="btnSalvarFoto1_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
            </div>                                    
        </td> 

        <td align="center"><asp:ImageButton ID="imgPPO1_1" runat="server" ImageUrl="~/image/catalog-icon.png" ToolTip="Clique aqui para abrir o procedimento." /></td>
    </tr>
</table>

