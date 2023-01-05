<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="MemberPages_Default2" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register src="../Controles/wucMercadologico.ascx" tagname="wucMercadologico" tagprefix="uc1" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
    <style type ="text/css" >

        #divMercadologico {
            float: left;                
        }

        #divCheck {
            clear:both; 
            float: left
            ; margin-left : 350px;
              
        }

        #divPanel {           
            clear:both;   
            padding-top: 15px          
            
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="divMercadologico"> 

    
   </div>



    <div id="divPanel">    
    </div>


<script type="text/javascript">
    // <![CDATA[
    var textSeparator = ";";
    function OnListBoxSelectionChanged(listBox, args)
    {
        if (args.index == 0)
            args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
        UpdateSelectAllItemState();
        UpdateText();
    }
    function UpdateSelectAllItemState()
    {
        IsAllSelected() ? checkListBox.SelectIndices([0]) : checkListBox.UnselectIndices([0]);
    }
    function IsAllSelected()
    {
        var selectedDataItemCount = checkListBox.GetItemCount() - (checkListBox.GetItem(0).selected ? 0 : 1);
        return checkListBox.GetSelectedItems().length == selectedDataItemCount;
    }
    function UpdateText()
    {
        var selectedItems = checkListBox.GetSelectedItems();
        checkComboBox.SetText(GetSelectedItemsText(selectedItems));
    }
    function SynchronizeListBoxValues(dropDown, args)
    {
        checkListBox.UnselectAll();
        var texts = dropDown.GetText().split(textSeparator);
        var values = GetValuesByTexts(texts);
        checkListBox.SelectValues(values);
        UpdateSelectAllItemState();
        UpdateText(); // for remove non-existing texts
    }
    function GetSelectedItemsText(items)
    {
        var texts = [];
        for (var i = 0; i < items.length; i++)
            if (items[i].index != 0)
                texts.push(items[i].text);
        return texts.join(textSeparator);
    }
    function GetValuesByTexts(texts)
    {
        var actualValues = [];
        var item;
        for (var i = 0; i < texts.length; i++)
        {
            item = checkListBox.FindItemByText(texts[i]);
            if (item != null)
                actualValues.push(item.value);
        }
        return actualValues;
    }
    // ]]>
    </script>

    <br />
    <br />
    
</asp:Content>

