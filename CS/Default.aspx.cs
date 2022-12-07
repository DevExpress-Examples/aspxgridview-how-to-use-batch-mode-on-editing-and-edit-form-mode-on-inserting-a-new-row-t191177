using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default: System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if (hf.Contains("isNewClicked"))
            if ((bool)hf.Get("isNewClicked") == true)
                gridView.SettingsEditing.Mode = DevExpress.Web.GridViewEditingMode.EditForm;
            else 
                gridView.SettingsEditing.Mode = DevExpress.Web.GridViewEditingMode.Batch;
    }

    protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
       if (hf.Contains("isNewClicked")) {
            if ((bool)hf.Get("isNewClicked") == true) {
                gridView.SettingsEditing.Mode = DevExpress.Web.GridViewEditingMode.EditForm;
                hf.Set("isNewClicked", false);
                gridView.AddNewRow();
            }
            else
                gridView.SettingsEditing.Mode = DevExpress.Web.GridViewEditingMode.Batch;
       }
    }
}