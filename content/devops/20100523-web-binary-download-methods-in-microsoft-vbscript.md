---
title: Download Binary File Function within Microsoft VBScript
link: https://www.olafrv.com/wordpress/web-binary-download-methods-in-microsoft-vbscript/
author: chanchito
description: 
post_id: 385
created: 2010/05/23 15:23:11
created_gmt: 2010/05/23 19:53:11
comment_status: open
post_name: web-binary-download-methods-in-microsoft-vbscript
status: publish
post_type: post
---

# Download Binary File Function within Microsoft VBScript

Taken on May 23th, 2010 from <https://www.ericphelps.com/scripting/samples/BinaryDownload/index.htm> by Eric. It works perfect, just download your file with: **SaveWebBinary "https://server/file1.ext1", "C:/file2.ext2"** Using this function: 
    
    
    Function SaveWebBinary(strUrl, strFile) 'As Boolean
    Const adTypeBinary = 1
    Const adSaveCreateOverWrite = 2
    Const ForWriting = 2
    Dim web, varByteArray, strData, strBuffer, lngCounter, ado
        On Error Resume Next
        'Download the file with any available object
        Err.Clear
        Set web = Nothing
        Set web = CreateObject("WinHttp.WinHttpRequest.5.1")
        If web Is Nothing Then Set web = CreateObject("WinHttp.WinHttpRequest")
        If web Is Nothing Then Set web = CreateObject("MSXML2.ServerXMLHTTP")
        If web Is Nothing Then Set web = CreateObject("Microsoft.XMLHTTP")
        web.Open "GET", strURL, False
        web.Send
        If Err.Number <> 0 Then
            SaveWebBinary = False
            Set web = Nothing
            Exit Function
        End If
        If web.Status <> "200" Then
            SaveWebBinary = False
            Set web = Nothing
            Exit Function
        End If
        varByteArray = web.ResponseBody
        Set web = Nothing
        'Now save the file with any available method
        On Error Resume Next
        Set ado = Nothing
        Set ado = CreateObject("ADODB.Stream")
        If ado Is Nothing Then
            Set fs = CreateObject("Scripting.FileSystemObject")
            Set ts = fs.OpenTextFile(strFile, ForWriting, True)
            strData = ""
            strBuffer = ""
            For lngCounter = 0 to UBound(varByteArray)
                ts.Write Chr(255 And Ascb(Midb(varByteArray,lngCounter + 1, 1)))
            Next
            ts.Close
        Else
            ado.Type = adTypeBinary
            ado.Open
            ado.Write varByteArray
            ado.SaveToFile strFile, adSaveCreateOverWrite
            ado.Close
        End If
        SaveWebBinary = True
    End Function