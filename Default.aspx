<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" style="background-color:darkseagreen;background-image:url(img/ban.jpg)">
        <h1 style="margin-left:250px;color:blue">FOCUS</h1>
        <p class="lead" style="text-align:center;color:blue;margin-top:30px">FOCUS is a University Management System where Students , Faculties , Gurdians and Staffs are allowed to 
            manage their works and view present states of their workspace.</p>
    </div>
    <hr />

    <div class="row">      
         <div>
             <div class="col-md-5 well">
                <h2 style="text-align:center;">New Here?</h2><hr />
                <h3 style="text-align:center;color:blue">Want to be a part of IUB ?</h3>                 
                <div style="text-align:center;">
                    <asp:Button ID="apply" runat="server" Text="Apply for Admission" CssClass="btn btn-success btn-lg" OnClick="apply_Click" />
                </div> 
                 <asp:Label ID="Label1" runat="server" Text=""></asp:Label>         
            </div> 
             <div class="col-md-offset-1 col-md-6 well">
                <h2 style="text-align:center;">Already a part of IUB?</h2><hr />
                <h3 style="text-align:center;color:blue">Please Login</h3>
                <div><a href="Login.aspx" class="btn btn-success btn-lg" style="text-align:center;margin-left:40%;">Login Here</a></div>            
            </div> 
         </div>     

    </div>
</asp:Content>
