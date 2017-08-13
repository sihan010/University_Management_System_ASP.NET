<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AddLogin.aspx.cs" Inherits="AddLogin" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" style="background-color:darkseagreen;background-image:url(img/ban.jpg)">
        <h1 style="margin-left:250px;color:blue">FOCUS</h1>
        <p class="lead" style="text-align:center;color:blue;margin-top:30px">FOCUS is a University Management System where Students , Faculties , Gurdians and Staffs are allowed to 
            manage their works and view present states of their workspace.</p>
    </div>
    <hr />

    <div class="row">      
         <div> 
             <div class="col-md-offset-3 col-md-6 col-md-offset-3 well">
                <h2 style="text-align:center;">Provide Login Credentials</h2><hr />
                 <p style="margin-left:25%">User ID:<br></p>
                <asp:TextBox ID="AddUserID" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox> <hr /> 
                 <p style="margin-left:25%">Password:<br></p> 
                 <asp:TextBox ID="AddPass" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox><hr />
                 <p style="margin-left:25%">Role:<br></p>
                 <asp:DropDownList ID="AddRole" runat="server" CssClass="col-md-offset-3" Height="35px" Width="280px">
                     <asp:ListItem>Student</asp:ListItem>
                     <asp:ListItem>Faculty</asp:ListItem>
                     <asp:ListItem>Gurdian</asp:ListItem>
                     <asp:ListItem>Register</asp:ListItem>
                     <asp:ListItem>Adminstrator</asp:ListItem>
                 </asp:DropDownList><hr />
                 <div style="margin-left:20%;color:orangered">
                     <asp:Label ID="AddLabel1" runat="server" Text=""></asp:Label><br>
                 </div>
                 <asp:Button ID="AddSubmit" runat="server" Text="Submit" CssClass="btn btn-success btn-md col-md-offset-4" OnClick="AddSubmitClick" Width="81px"/>                                       
            </div> 
         </div>     

    </div>
</asp:Content>