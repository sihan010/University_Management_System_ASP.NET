<%@ Page Title="Faculty CRUD Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="FacultyCRUD.aspx.cs" Inherits="FacultyCRUD" %>

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
                 <h2 style="text-align:center;">Provide Faculty Details</h2><hr />

                 <div style="margin-left:30%;color:orangered">
                     <asp:Label ID="message" runat="server" Text=""></asp:Label><br>
                 </div>

                 <p style="margin-left:25%">Faculty ID:<br></p>
                 <asp:TextBox ID="id" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Faculty First Name:<br></p>
                 <asp:TextBox ID="fname" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Faculty Last Name:<br></p>
                 <asp:TextBox ID="lname" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Faculty Room:<br></p>
                 <asp:TextBox ID="room" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Faculty Address:<br></p>
                 <asp:TextBox ID="address" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Faculty Email:<br></p>
                 <asp:TextBox ID="email" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Faculty Phone:<br></p>
                 <asp:TextBox ID="phone" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>
                                 
                 <p style="margin-left:25%">Gender:<br></p>
                 <asp:DropDownList ID="gender" runat="server" CssClass="col-md-offset-3" Height="35px" Width="280px">
                     <asp:ListItem>Male</asp:ListItem>
                     <asp:ListItem>Female</asp:ListItem>                     
                 </asp:DropDownList>

                 <p style="margin-left:25%">Blood Group:<br></p>
                 <asp:DropDownList ID="blood" runat="server" CssClass="col-md-offset-3" Height="35px" Width="280px">
                     <asp:ListItem>A+</asp:ListItem>
                     <asp:ListItem>A-</asp:ListItem>  
                     <asp:ListItem>B+</asp:ListItem>
                     <asp:ListItem>B-</asp:ListItem> 
                     <asp:ListItem>AB+</asp:ListItem>
                     <asp:ListItem>AB-</asp:ListItem>  
                     <asp:ListItem>O+</asp:ListItem>
                     <asp:ListItem>O-</asp:ListItem>                   
                 </asp:DropDownList>

                 <p style="margin-left:25%">Department Name:<br></p>
                 <asp:DropDownList ID="dept" runat="server" CssClass="col-md-offset-3" Height="35px" Width="280px" DataTextField="dept_name" DataValueField="dept_name">                                                            
                 </asp:DropDownList>

                 <p style="margin-left:25%">School Name:<br></p>
                 <asp:DropDownList ID="school" runat="server" CssClass="col-md-offset-3" Height="35px" Width="280px" DataTextField="sc_name" DataValueField="sc_name">                                                            
                 </asp:DropDownList><hr/>
                 
                 <asp:Button ID="addFaculty" runat="server" Text="Submit" CssClass="btn btn-success btn-md col-md-offset-4" OnClick="addFaculty_Click" Width="81px"/>                                       
            </div> 
         </div>     

    </div>
</asp:Content>