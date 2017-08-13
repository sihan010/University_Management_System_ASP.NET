<%@ Page Language="C#"  CodeFile="Transcript.aspx.cs" Inherits="Transcript" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transcript</title>
    <link rel="stylesheet" href="/Content/bootstrap.css" />
    <link rel="stylesheet" href="~/gridviewCSS.css" />
</head>
<body>
    <form id="transcript" runat="server">
     <div class="row">
         <div class="col-md-6 well" style="text-align:center">
             <asp:Label ID="id" runat="server" Text=""></asp:Label><br />
             <asp:Label ID="name" runat="server" Text=""></asp:Label><br />
             <asp:Label ID="address" runat="server" Text=""></asp:Label>
         </div>
         <div class="col-md-6 well" style="text-align:center">
             <asp:Label ID="time" runat="server" Text=""></asp:Label><br />
             <asp:Label ID="major" runat="server" Text=""></asp:Label><br />
             <asp:Label ID="minor" runat="server" Text=""></asp:Label>
         </div>
     </div><br /><br />
    <div style="text-align:center" class="well">
        <asp:GridView ID="result" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" 
            RowStyle-CssClass="rows" AllowPaging="True"> </asp:GridView>    
    </div>
       <div class="row">
         <div class="col-md-6 well" style="text-align:center">
             <asp:Label ID="credit" runat="server" Text=""></asp:Label><br />
             <asp:Label ID="grade" runat="server" Text=""></asp:Label><br />
             <asp:Label ID="cgpa" runat="server" Text=""></asp:Label>
         </div>         
     </div>
     <div style="text-align:center;margin-bottom:20px;">
         <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:Button ID="gen" runat="server" Text="Download As PDF" CssClass="btn btn-md btn-primary" OnClick="gen_Click" />
     </div>
    </form>
</body>
</html>
