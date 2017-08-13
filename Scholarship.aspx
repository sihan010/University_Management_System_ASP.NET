<%@ Page Title="Scholarship" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Scholarship.aspx.cs" Inherits="Scholarship" %>

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
                 <h2 style="text-align:center;">Provide Scholarship Details</h2><hr />

                 <div style="margin-left:30%;color:orangered">
                     <asp:Label ID="message" runat="server" Text=""></asp:Label><br>
                 </div>

                 <p style="margin-left:25%">Finantial Gurantor First Name:<br></p>
                 <asp:TextBox ID="fname" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Finantial Gurantor Last Name:<br></p>
                 <asp:TextBox ID="lname" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">CGPA:<br></p>
                 <asp:TextBox ID="cgpa" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Parcentage:<br></p>
                 <asp:TextBox ID="parcent" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>
                

                 <p style="margin-left:25%">Scholarship Type:<br></p>
                 <asp:DropDownList ID="type" runat="server" CssClass="col-md-offset-3" Height="35px" Width="280px">
                     <asp:ListItem>Merit</asp:ListItem>
                     <asp:ListItem>Need Based</asp:ListItem>  
                     <asp:ListItem>Board Scholarship</asp:ListItem>
                     <asp:ListItem>Freedom Fighter Quota</asp:ListItem>                                       
                 </asp:DropDownList> <hr />             
                 
                 <asp:Button ID="AddSch" runat="server" Text="Submit" CssClass="btn btn-success btn-md col-md-offset-4" OnClick="AddSch_Click" Width="81px"/>                                       
            </div> 
         </div>     

    </div>
</asp:Content>
