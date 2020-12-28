<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="signup.aspx.cs" Inherits="testmain.signup" %>

<asp:Content ID="content" runat="server" ContentPlaceHolderID="main">
    <div class="content">
        <Label>Insert Details</Label>
        <table class="table">
            <tr>
                <td><asp:Label runat="server">First Name:</asp:Label></td>
                <td><asp:TextBox id="f_namet" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server">Last Name:</asp:Label></td>
                <td><asp:TextBox id="l_namet" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server">User Name:</asp:Label></td>
                <td><asp:TextBox ID="u_namet" runat="server" OnTextChanged="u_namet_TextChanged"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server">As Miner:</asp:Label></td>
                <td><asp:CheckBox ID="cbminer" runat="server"></asp:CheckBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server">Mail Address:</asp:Label></td>
                <td><asp:TextBox id="mailt" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server">Contact No:</asp:Label></td>
                <td><asp:TextBox ID="con_not" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server">Password:</asp:Label></td>
                <td><asp:TextBox id="passt" runat="server"></asp:TextBox></td>
            </tr>
             <tr>
                <td colspan="2"><asp:Button ID="Signup" runat="server" Text="Sign up" OnClick="Signup_Click"></asp:Button></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="google" runat="server" Text="G" OnClick="google_Click"></asp:Button> </td>
            </tr>
        </table>
            
        </div>
</asp:Content>