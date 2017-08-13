<%@ Page Title="Department CRUD Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="DepartmentCRUD.aspx.cs" Inherits="DepartmentCRUD" %>

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
                 <h2 style="text-align:center;">Provide Department Details</h2><hr />

                 <div style="margin-left:30%;color:orangered">
                     <asp:Label ID="message" runat="server" Text=""></asp:Label><br>
                 </div>

                 <p style="margin-left:25%">Department Name:<br></p>
                 <asp:TextBox ID="name" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Number of Faculties:<br></p>
                 <asp:TextBox ID="number" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>               

                 <p style="margin-left:25%">School Name:<br></p>
                 <asp:DropDownList ID="school" runat="server" CssClass="col-md-offset-3" Height="35px" Width="280px" DataTextField="sc_name" DataValueField="sc_name">                                                            
                 </asp:DropDownList><hr/>
                 
                 <asp:Button ID="addDept" runat="server" Text="Submit" CssClass="btn btn-success btn-md col-md-offset-4" OnClick="addDept_Click" Width="81px"/>                                       
            </div> 
         </div>     

    </div>
</asp:Content>
