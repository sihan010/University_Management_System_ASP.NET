<%@ Page Title="Adminstrator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Admistrator.aspx.cs" Inherits="Admistrator" %>

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
                <asp:Label ID="GurID" runat="server" Text="Label"></asp:Label><br/>
                <asp:Label ID="Role" runat="server" Text="Label"></asp:Label>
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
                <asp:Button ID="faculty" runat="server" Text="Faculty Zone" CssClass="btn btn-md btn-primary" OnClick="faculty_Click" /><hr />
                <asp:Button ID="course" runat="server" Text="Course Zone" CssClass="btn btn-md btn-primary" OnClick="course_Click" /><hr />
                <asp:Button ID="school" runat="server" Text="School Zone" CssClass="btn btn-md btn-primary" OnClick="school_Click"/><hr />
                <asp:Button ID="department" runat="server" Text="Department Zone" CssClass="btn btn-md btn-primary" OnClick="department_Click" /><hr />
                <asp:Button ID="candidate" runat="server" Text="Candidate List" CssClass="btn btn-md btn-primary" OnClick="candidate_Click" /><hr />
                <asp:Button ID="addLogin" runat="server" Text="Add Login" CssClass="btn btn-md btn-primary" OnClick="addLogin_Click" />
            </div>
        </div>


        <div class="col-md-10">
            <div class="well">
                                
                <asp:Label ID="Label2" runat="server" Text="Select Enrollment History"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="col-md-offset-3 dropdown" Height="35px" Width="280px"
                     DataTextField="stu_id" DataValueField="stu_id"></asp:DropDownList>
                <asp:Button ID="ok1" runat="server" Text="Submit" Onclick="ok1_Click" CssClass="btn btn-md btn-primary"/><hr />
                <asp:GridView ID="result1" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True"> </asp:GridView>               
            </div>
        </div>
        <div class="col-md-10">
            <div class="well">
                              
                <asp:Label ID="Label4" runat="server" Text="Please Select Transcript"></asp:Label>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="col-md-offset-3 dropdown" Height="35px" Width="280px"
                     DataTextField="stu_id" DataValueField="stu_id"></asp:DropDownList>
                <asp:Button ID="ok2" runat="server" Text="Submit" Onclick="ok2_Click" CssClass="btn btn-md btn-primary"/><hr />
                <asp:GridView ID="result2" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True"> </asp:GridView>               
            </div>
        </div>
        <div class="col-md-10">
            <div class="well">                              
                <asp:Label ID="fa_label" runat="server" Text="Please Select Faculty Zone"></asp:Label>
                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="col-md-offset-3 dropdown" Height="35px" Width="280px"
                     DataTextField="fa_id" DataValueField="fa_id"></asp:DropDownList>
                <asp:Button ID="fa_button" runat="server" Text="Submit" Onclick="fa_button_Click" CssClass="btn btn-md btn-primary"/>
                <asp:Button ID="fa_more" runat="server" Text="Other Operation" OnClick="fa_more_Click" CssClass="btn btn-md btn-primary" /><hr />
                <asp:GridView ID="fa_result" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True"> </asp:GridView>                
            </div>
        </div>

        <div class="col-md-10">
            <div class="well">                              
                <asp:Label ID="can_Label" runat="server" Text="Please Select Candidate List"></asp:Label> <hr />                          
                
                <asp:GridView ID="can_res" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True"> </asp:GridView>                
            </div>
        </div>
    </div>
</asp:Content>
