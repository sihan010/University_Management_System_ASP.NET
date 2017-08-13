<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />
    <div class="row">      
         <div> 
             <div class="col-md-offset-3 col-md-6 col-md-offset-3 well">
                <h2 style="text-align:center;">Use Your Credentials to Log In</h2><hr />
                 <p style="margin-left:25%">User ID:<br></p>
                <asp:TextBox ID="LoginUserID" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox> <hr /> 
                 <p style="margin-left:25%">Password:<br></p> 
                 <asp:TextBox ID="LoginPass" runat="server" CssClass="form-control col-md-offset-3" TextMode="Password"></asp:TextBox><hr />
                 <p style="margin-left:25%">Role:<br></p>
                 <asp:DropDownList ID="LoginRole" runat="server" CssClass="col-md-offset-3 dropdown" Height="35px" Width="280px">
                     <asp:ListItem>Student</asp:ListItem>
                     <asp:ListItem>Faculty</asp:ListItem>
                     <asp:ListItem>Gurdian</asp:ListItem>
                     <asp:ListItem>Register</asp:ListItem>
                     <asp:ListItem>Adminstrator</asp:ListItem>
                 </asp:DropDownList><hr />
                 <div style="margin-left:30%;color:orangered">
                     <asp:Label ID="LoginLabel1" runat="server" Text=""></asp:Label><br>
                 </div>
                 <asp:Button ID="loginSubmit" runat="server" Text="Log In" CssClass="btn btn-success btn-md col-md-offset-5" Onclick="loginSubmitClick" Width="81px"/>                                       
            </div> 
         </div>     

    </div>
</asp:Content>