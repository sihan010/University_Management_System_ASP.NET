<%@ Page Title="Course CRUD Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CourseCRUD.aspx.cs" Inherits="CourseCRUD" %>

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
                 <h2 style="text-align:center;">Provide Course Details</h2><hr />

                 <div style="margin-left:30%;color:orangered">
                     <asp:Label ID="message" runat="server" Text=""></asp:Label><br>
                 </div>

                 <p style="margin-left:25%">Course ID:<br></p>
                 <asp:TextBox ID="id" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Course name Name:<br></p>
                 <asp:TextBox ID="name" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Course Credit:<br></p>
                 <asp:TextBox ID="credit" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Course Prerequisite:<br></p>
                 <asp:TextBox ID="prereq" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>
                                                 
                 <p style="margin-left:25%">Offer Department:<br></p>
                 <asp:DropDownList ID="department" runat="server" CssClass="col-md-offset-3" Height="35px" Width="280px" DataTextField="dept_name" DataValueField="dept_name">                                          
                 </asp:DropDownList>

                 <p style="margin-left:25%">Section No:<br></p>
                 <asp:TextBox ID="section" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Section Capacity:<br></p>
                 <asp:TextBox ID="capacity" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Start Time:<br></p>
                 <asp:TextBox ID="start" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">End Time:<br></p>
                 <asp:TextBox ID="end" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Room No:<br></p>
                 <asp:TextBox ID="room" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Room Capacity:<br></p>
                 <asp:TextBox ID="room_capacity" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox><hr />
                                
                 
                 <asp:Button ID="addCourse" runat="server" Text="Submit" CssClass="btn btn-success btn-md col-md-offset-4" OnClick="addCourse_Click" Width="81px"/>                                       
            </div> 
         </div>     

    </div>
</asp:Content>
