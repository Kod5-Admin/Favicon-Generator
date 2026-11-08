' Favicon Generator
' Creates all common favicon / Apple touch icon sizes from one large PNG
' (ideally 512x512) using IrfanView.
' Usage: drag & drop a PNG onto this script. Without an argument it looks for
'        favicon-512x512.png next to the script.
' Output files are written to the same folder as the source image.
Option Explicit

Dim fso, shell, iview, source, outDir, sizes, s, list, missing
Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

' {file name, size}
sizes = Array( _
    Array("favicon-16x16.png", 16), _
    Array("favicon-32x32.png", 32), _
    Array("favicon-48x48.png", 48), _
    Array("favicon-96x96.png", 96), _
    Array("favicon-192x192.png", 192), _
    Array("apple-touch-ipad.png", 76), _
    Array("apple-touch-iphone4.png", 114), _
    Array("apple-touch-iphone.png", 120), _
    Array("apple-touch-ipad-retina.png", 152))

iview = FindIrfanView()
If iview = "" Then
    MsgBox "IrfanView was not found. Please install it from https://www.irfanview.com", vbCritical, "Favicon Generator"
    WScript.Quit 1
End If

If WScript.Arguments.Count > 0 Then
    source = WScript.Arguments(0)
Else
    source = fso.GetParentFolderName(WScript.ScriptFullName) & "\favicon-512x512.png"
End If

If Not fso.FileExists(source) Then
    MsgBox "Source image not found:" & vbCrLf & source & vbCrLf & vbCrLf & _
           "Drag a PNG file onto this script.", vbCritical, "Favicon Generator"
    WScript.Quit 1
End If

outDir = fso.GetParentFolderName(fso.GetAbsolutePathName(source)) & "\"

list = ""
For Each s In sizes
    list = list & s(0) & "  (" & s(1) & "x" & s(1) & ")" & vbCrLf
Next

If MsgBox("Source: " & fso.GetFileName(source) & vbCrLf & _
          "Output folder: " & outDir & vbCrLf & vbCrLf & _
          "These files will be created (existing ones are overwritten):" & vbCrLf & vbCrLf & _
          list & vbCrLf & "Continue?", vbYesNo + vbQuestion, "Favicon Generator") <> vbYes Then
    WScript.Quit
End If

missing = ""
For Each s In sizes
    shell.Run Q(iview) & " " & Q(source) & " /resize=(" & s(1) & "," & s(1) & ") /resample /convert=" & Q(outDir & s(0)), 0, True
    If Not fso.FileExists(outDir & s(0)) Then missing = missing & s(0) & vbCrLf
Next

If missing = "" Then
    MsgBox "All favicon files were created successfully!", vbInformation, "Favicon Generator"
Else
    MsgBox "These files could not be created:" & vbCrLf & vbCrLf & missing, vbExclamation, "Favicon Generator"
End If

' ---------------------------------------------------------------
Function FindIrfanView()
    Dim paths, p
    paths = Array( _
        "C:\Program Files\IrfanView\i_view64.exe", _
        "C:\Program Files\IrfanView\i_view32.exe", _
        "C:\Program Files (x86)\IrfanView\i_view32.exe")
    FindIrfanView = ""
    For Each p In paths
        If fso.FileExists(p) Then
            FindIrfanView = p
            Exit Function
        End If
    Next
End Function

Function Q(t)
    Q = Chr(34) & t & Chr(34)
End Function
