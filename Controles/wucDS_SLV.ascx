<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucDS_SLV.ascx.vb" Inherits="Controles_DS_SLV" %>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                                        
                                        
    SelectCommand="SELECT [descSecao], [QtdeAT], [vlrVendaAT], [percMargemAT], [QtdeAA], [vlrVendaAA], [percMargemAA], [vlrVendaMA], [QtdeMA], [percMargemMA], [percCresc], [vlrMeta], [percMargemMeta],[Tipo],[idFilial] FROM [SLV].[AnaliseAnoAnterior] WHERE ([Usuario] = @Usuario) ORDER BY [idDepto],[idSecao]">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                
