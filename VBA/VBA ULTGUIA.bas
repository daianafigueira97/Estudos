Attribute VB_Name = "Módulo1"
Sub ultguia()
Attribute ultguia.VB_ProcData.VB_Invoke_Func = "a\n14"
    On Error Resume Next
    Sheets(ActiveSheet.Index - 1).Select
    If Err.Number <> 0 Then Sheets(1).Activate
End Sub
