<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="signin.aspx.cs" Inherits="testmain.signin" %>

<asp:Content ID="content" runat="server" ContentPlaceHolderID="main">
    <div class="content">
        <Label>Login</Label>
        <table class="table">
            <tr>
                <td><asp:Label runat="server">User Name:</asp:Label></td>
                <td><asp:TextBox id="u_namet" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server">Password:</asp:Label></td>
                <td><asp:TextBox id="passt" runat="server"></asp:TextBox></td>
            </tr>
             <tr>
                <td colspan="2"><asp:Button ID="Signin" runat="server" Text="Sign in" OnClick="Signin_Click"></asp:Button></td>
            </tr>
        </table>
        </div>
</asp:Content>
