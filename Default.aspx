<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<head runat="server">
    <title>Log - In</title>
  <link rel="stylesheet" href="styles/login.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <br />
    <br />
    <img src="images/Logo.png">
    <section class="container">
    <div class="login">
    
      <h1>EGI Dormitory Management System</h1>      
      <p><asp:TextBox ID="txtUsername" runat="server" placeholder="Username"></asp:TextBox></p>
      <asp:RequiredFieldValidator ControlToValidate="txtUsername" ID="RequiredFieldValidator1" ValidationGroup="login" Display="Dynamic" runat="server" ErrorMessage="Enter your username!" ></asp:RequiredFieldValidator>
      <p><asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox></p>
      <asp:RequiredFieldValidator ControlToValidate="txtPassword" ID="RequiredFieldValidator2" ValidationGroup="login" Display="Dynamic" runat="server" ErrorMessage="Enter your password!" ></asp:RequiredFieldValidator>
      
            
      <p class="submit"><asp:Button ID="btnLogIn" ValidationGroup="login" runat="server" Text="Log - In" OnClick="btnLogIn_Click" />
          <br />
          <br />
          <asp:Label ID="lblAlert" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>

         <%-- <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="login" runat="server" HeaderText="Please sure you have completed the following:"></asp:ValidationSummary>--%>

      </p>

    </div>
      <div class="login-help">
      <p>Powered by Team Rocket</p>
      </div>
    </section>   
    </form>
</body>
</html>
