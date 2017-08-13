<%@ Page Title="Student Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="Student" %>

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
                <asp:Label ID="StuID" runat="server" Text="Label"></asp:Label><br/>
                <asp:Label ID="StuName" runat="server" Text="Label"></asp:Label><br />
                <asp:Label ID="StuRole" runat="server" Text="Label"></asp:Label>
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
                <asp:Button ID="enrollment" runat="server" Text="Enrollment History" CssClass="btn btn-md btn-primary" OnClick="enrollment_Click"/><hr />
                <asp:Button ID="transcript" runat="server" Text="Transcript" CssClass="btn btn-md btn-primary" OnClick="transcript_Click"/><hr />
                <asp:Button ID="registration" runat="server" Text="Registration" CssClass="btn btn-md btn-primary" OnClick="registration_Click"/><hr />
                <asp:Button ID="scholarship" runat="server" Text="Scholarship Apply" CssClass="btn btn-md btn-primary" OnClick="scholarship_Click"/>
            </div>
        </div>
        <div class="col-md-10">
            <div class="well">
                <asp:Label ID="Label1" runat="server" Text="" Font-Size="Larger" ForeColor="OrangeRed"></asp:Label>
                <asp:GridView ID="result" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True"> </asp:GridView> 
                <asp:Button ID="genPDF" runat="server" Text="Generate PDF" CssClass="btn btn-md btn-primary" OnClick="genPDF_Click"/> 
            </div>
        </div>
        <div class="col-md-10">
            <div class="well">
                <asp:Label ID="Label2" runat="server" Text="" Font-Size="Larger" ForeColor="OrangeRed"></asp:Label>
                <asp:GridView ID="GridView1" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True"> </asp:GridView>
                

            </div>
        </div>
    </div>
</asp:Content>
