<%@ Control Language="C#" AutoEventWireup="true" CodeFile="File_Manager.ascx.cs" Inherits="Controls_File_Managerl" %>
<%@ Register Assembly="IZ.WebFileManager" Namespace="IZ.WebFileManager" TagPrefix="iz" %>
<iz:FileManager ID="FileManager1" runat="server" Height="400" Width="600">
    <RootDirectories>
        <iz:RootDirectory DirectoryPath="~/Images/albums" Text="Root" />
    </RootDirectories>
</iz:FileManager>