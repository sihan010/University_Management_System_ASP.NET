<%@ Page Title="Admission" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Candidate.aspx.cs" Inherits="Candidate" %>

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
                 <h2 style="text-align:center;">Provide Personal and Ecademic Details</h2><hr />

                 <div style="margin-left:30%;color:orangered">
                     <asp:Label ID="message" runat="server" Text=""></asp:Label><br>
                 </div>

                 <p style="margin-left:25%">First Name:<br></p>
                 <asp:TextBox ID="fname" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Last Name:<br></p>
                 <asp:TextBox ID="lname" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Father's Name:<br></p>
                 <asp:TextBox ID="father" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">Mother's Name:<br></p>
                 <asp:TextBox ID="mother" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">High School or A Level Institution Name:<br></p>
                 <asp:TextBox ID="high" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">High School or A Level Passing Year:<br></p>
                 <asp:TextBox ID="ssc" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">High School or A Level GPA:<br></p>
                 <asp:TextBox ID="ssc_gpa" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">College or O Level Institution Name:<br></p>
                 <asp:TextBox ID="college" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">College or O Level Passing Year:<br></p>
                 <asp:TextBox ID="hsc" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>

                 <p style="margin-left:25%">College or O Level GPA:<br></p>
                 <asp:TextBox ID="hsc_gpa" runat="server" CssClass="form-control col-md-offset-3"></asp:TextBox>
                 
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

                 <p style="margin-left:25%">Select Major:<br></p>
                 <asp:DropDownList ID="major" runat="server" CssClass="col-md-offset-3" Height="35px" Width="280px">
                     <asp:ListItem>CS</asp:ListItem>
                     <asp:ListItem>CE</asp:ListItem>  
                     <asp:ListItem>CSE</asp:ListItem>
                     <asp:ListItem>EEE</asp:ListItem> 
                     <asp:ListItem>ETE</asp:ListItem>
                     <asp:ListItem>BBA</asp:ListItem>  
                     <asp:ListItem>Law</asp:ListItem>                                        
                 </asp:DropDownList><hr/>
                 
                 <asp:Button ID="AddCandidate" runat="server" Text="Submit" CssClass="btn btn-success btn-md col-md-offset-4" OnClick="AddCandidate_Click" Width="81px"/>                                       
            </div> 
         </div>     

    </div>
</asp:Content>