<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="EPatient_Web.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        /*.auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 237px;
            text-align: right;
        }
        .auto-style3 {
            width: 253px;
        }*/
        .info {
  margin: 50px auto;
  text-align: center;
}
        h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  /*color: #172344;*/
  color: #172344;
}
        .isa_error {
    /*color: #D8000C;*/
    /*background-color: #FFBABA;*/
     border-top-left-radius: 3px;
  border-top-right-radius: 3px;
  border-bottom-left-radius: 3px;
  border-bottom-right-radius: 3px;
  font-family:Cambria

}

 .button {
  outline: 0;
  /*background: #172344;*/
  background: #172344;
  width: 100%;
  border: 0;
  padding: 15px;
  border-top-left-radius: 3px;
  border-top-right-radius: 3px;
  border-bottom-left-radius: 3px;
  border-bottom-right-radius: 3px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
        img.displayed {
    display: block;
    margin-left: auto;
    margin-right: auto }
        body{background-color: #f2f2f2;

        }
       table {
            padding: 40px;
    /*margin: 0px;*/
    border-radius: 5px;
    background-color: white;
    width: auto;
    margin-left: auto;
    margin-right: auto;
    
}
        
        input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
     background: #f2f2f2;
}
         input[type=password], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
     background: #f2f2f2;
}
        .auto-style1 {
            height: 62px;
        }
    </style>
</head>
<body>
  
                  <div class="info">
                    <h1>E-Patient<br /></h1>
                  </div>
               
    <form id="form1" runat="server">
    <div style="width: 1052px">
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style1" style="text-align: right">&nbsp;</td>
                <td class="auto-style1">
                    <img src="production/téléchargement.png" class="displayed"/></td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: right">&nbsp;</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBoxusername" runat="server" placeholder="utilisateur" Width="250px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxusername" ErrorMessage="Entrez votre username" ForeColor="#FF3300" CssClass="isa_error"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBoxpassword" runat="server" TextMode="Password" placeholder="mot de passe" Width="248px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxpassword" ErrorMessage="Entres votre password" ForeColor="#FF3300" CssClass="isa_error"></asp:RequiredFieldValidator>
                   
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="Button_login" runat="server" Text="Login" CssClass="button" />
                   
                          <asp:Label ID="Label2" runat="server" Text="Textepourlabel" Visible ="False" ForeColor="Red" CssClass="isa_error"></asp:Label>
                         <asp:Label ID="Alexandre" runat="server" Text="Textepourlabel" Visible ="False" ForeColor="Red" CssClass="isa_error"></asp:Label>
                </td>
                <td>
                    <div >
                    </div>
                    
                </td>
            </tr>
        </table>
    </form>
</body>
</html>


