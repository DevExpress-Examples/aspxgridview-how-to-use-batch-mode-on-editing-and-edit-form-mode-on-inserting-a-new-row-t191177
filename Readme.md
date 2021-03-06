<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
<!-- default file list end -->
# ASPxGridView - How to use Batch mode on editing and Edit Form mode on inserting a new row
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t191177/)**
<!-- run online end -->


<p>This example demonstrates how to use ASPxGridView in different modes on editing and inserting a new row. <br />In the illustrated scenario, the grid edits rows in Batch mode and inserts them using the edit form. For this purpose, ASPxGridView is nested in ASPxCallbackPanel and its mode is switched on the callback panel's callback.<br />A custom New button is placed in the command column's HeaderTemplate. On the New button's click, you can check if ASPxGridView has unsaved changes using the client-side <a href="http://help.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridViewBatchEditApi_HasChangestopic">HasChanges</a> method and call the UpdateEdit method to save these changes or initiate the ASPxCallbackPanel's callback to add a new row.</p>

<br/>


