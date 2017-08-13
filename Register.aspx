<%@ Page Title="Gurdian Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" style="background-color:darkseagreen;background-image:url(img/ban.jpg)">
        <h1 style="margin-left:250px;color:blue">FOCUS</h1>
        <p class="lead" style="text-align:center;color:blue;margin-top:30px">FOCUS is a University Management System where Students , Faculties , Gurdians and Staffs are allowed to 
            manage their works and view present states of their workspace.</p>
    </div>
    <hr />

    <div class="row">      
         <div class="col-md-offset-1 col-md-10 col-md-offset-1">
            <div class="well">
                <asp:Label ID="ID" runat="server" Text=""></asp:Label><br/>
                <asp:Label ID="Role" runat="server" Text=""></asp:Label>
                <div style="text-align:right;margin-top:-5%">
                    <asp:Button ID="logOut" runat="server" Text="Log Out" Onclick="logOut_Click" CssClass="btn btn-md btn-danger"/>
                </div>                
            </div>
         </div> 
    </div>
    <div class="row">
        <div class="col-md-2">
            <div class="well">
                <h3 style="text-align:center">Control Panel</h3><hr />
                <asp:Button ID="reg" runat="server" Text="Registration" CssClass="btn btn-md btn-primary" OnClick="reg_Click"/><hr />
                <asp:Button ID="tran" runat="server" Text="Admission" CssClass="btn btn-md btn-primary" OnClick="tran_Click"/><hr />       
            </div>
        </div>
        <div class="col-md-10">
            <div class="well">                                
                <asp:Label ID="Label1" runat="server" Text="Please Select Admission From Control Panel"></asp:Label> 
                <div style="text-align:right">
                    <asp:Button ID="reg_toogle" runat="server" Text="Toogle" OnClick="reg_toogle_Click" CssClass="btn btn-md btn-primary" />  
                </div>                          
            </div>
        </div> 
        <div class="col-md-10">
            <div class="well">                                
                <asp:Label ID="Label2" runat="server" Text="Please Select a Admission From Control Panel"></asp:Label> 
                <div style="text-align:right">
                    <asp:Button ID="Button1" runat="server" Text="Toogle" OnClick="Button1_Click" CssClass="btn btn-md btn-primary" />  
                </div>                          
            </div>
        </div>       
    </div>
</asp:Content>
