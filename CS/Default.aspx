<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript">
        var isNewClicked = false;
        function hlNew_Click(s, e) {
            if (gridView.batchEditApi.HasChanges()) {
                if (confirm("All changes will be saved automatically. Do you want to continue?"))
                    gridView.UpdateEdit();
                isNewClicked = true;
            }
            else {
                hf.Set("isNewClicked", true);
                cp.PerformCallback();
            }
        }
        function OnEndCallback(s, e) {
            if (isNewClicked == true) {
                isNewClicked = false;
                hf.Set("isNewClicked", true);
            }
            else hf.Set("isNewClicked", false);
            cp.PerformCallback();
        }
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxHiddenField ID="hf" runat="server" ClientInstanceName="hf"></dx:ASPxHiddenField>
        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="cp" OnCallback="ASPxCallbackPanel1_Callback">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxGridView ID="gridView" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridView" DataSourceID="ads" KeyFieldName="CategoryID" >
                        <ClientSideEvents EndCallback="OnEndCallback" />
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                <HeaderTemplate>
                                    <dx:ASPxHyperLink ID="hlNew" runat="server" Text="New">
                                        <ClientSideEvents Click="hlNew_Click" />
                                    </dx:ASPxHyperLink>
                                </HeaderTemplate>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CategoryName" ShowInCustomizationForm="True" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Description" ShowInCustomizationForm="True" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsEditing Mode="Batch"></SettingsEditing>
                    </dx:ASPxGridView>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
                <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]" DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = ?" InsertCommand="INSERT INTO [Categories] ([CategoryName], [Description]) VALUES (?, ?)" UpdateCommand="UPDATE [Categories] SET [CategoryName] = ?, [Description] = ? WHERE [CategoryID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
    </form>
</body>
</html>
