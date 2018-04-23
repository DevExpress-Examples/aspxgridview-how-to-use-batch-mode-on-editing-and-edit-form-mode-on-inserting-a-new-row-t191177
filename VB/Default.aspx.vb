Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If hf.Contains("isNewClicked") Then
            If CBool(hf.Get("isNewClicked")) = True Then
                gridView.SettingsEditing.Mode = DevExpress.Web.ASPxGridView.GridViewEditingMode.EditForm
            Else
                gridView.SettingsEditing.Mode = DevExpress.Web.ASPxGridView.GridViewEditingMode.Batch
            End If
        End If
    End Sub

    Protected Sub ASPxCallbackPanel1_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
       If hf.Contains("isNewClicked") Then
            If CBool(hf.Get("isNewClicked")) = True Then
                gridView.SettingsEditing.Mode = DevExpress.Web.ASPxGridView.GridViewEditingMode.EditForm
                hf.Set("isNewClicked", False)
                gridView.AddNewRow()
            Else
                gridView.SettingsEditing.Mode = DevExpress.Web.ASPxGridView.GridViewEditingMode.Batch
            End If
       End If
    End Sub
End Class