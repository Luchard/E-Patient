<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ListeUtilisateur.aspx.vb" Inherits="EPatient_Web.ListeUtilisateur" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript"> 
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Voulez-vous vraiment annuler ?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
      </script>
        <div class="right_col" role="main">
          <div class="">
          <div class="crumbs">
					<ol class="breadcrumb">
  <li><i class="fa fa-home"></i>
   <a href="../production/dashboard.aspx">Home</a></li>
  <li class="active">Utilisateurs</li>
</ol>
				</div> 
              <div class="page-title">
              <div class="title_left">
                 <div class="col-md-12" style="font-size: 20px;">
  Gestion utilisateurs
			      </div>
              </div>

            <%--  <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                              <button class="btn btn-default" type="button">Go!</button>
                          </span>
                  </div>
                </div>
              </div>--%>
            </div>
            <div class="clearfix"></div>
	
             
                  
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        



             <div class="row">
<div class="col-md-4">
  
        <asp:Panel runat="server" ID="panel_informations">
                                 <div class="panel panel-default">
                                <div class="panel-heading">
                                    <asp:Label ID="Label1" runat="server" Text="Infos du compte Utilisateur"></asp:Label>
                                </div>
                                <div class="panel-body">
                                 














                                    <table id="tblUserInfos" border="0" cellpadding="4" cellspacing="0">
                                        <tr>
                                            <td colspan="2" align="center">
                                                <br />
                                                <asp:Label ID="lbMsgAddEdit" runat="server" EnableViewState="false" Style="font-size: smaller; font-weight: bold;" />
                                            </td>
                                        </tr>
                                         <tr>
                                            <td nowrap width="160px">
                                                <asp:Label ID="Label7" runat="server" Text="Individu : "></asp:Label>
                                            </td>
                                            <td nowrap>
                                                <asp:dropdownlist ID="ddl_individu" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_individu_SelectedIndexChanged"  Width="55%" />
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="#FF3300"  ControlToValidate="ddl_privilege" 
                            InitialValue="0" ErrorMessage="Type required">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                          <tr>
                                            <td nowrap width="160px">
                                                <asp:Label ID="Label5" runat="server" Text="Email : "></asp:Label>
                                            </td>
                                            <td nowrap>
                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="txtFieldStyle" Width="250px" ValidationGroup="GroupInfo"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="#FF3300" ValidationGroup="GroupInfo"
                                                    ErrorMessage="Le libellé du groupe est obligatoire !" ControlToValidate="utilisateur">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                          
                                          <tr>
                                            <td nowrap width="160px">
                                                <asp:Label ID="Label6" runat="server" Text="Username : "></asp:Label>
                                            </td>
                                            <td nowrap>
                                                <asp:TextBox ID="utilisateur" runat="server" CssClass="txtFieldStyle" Width="250px" ValidationGroup="GroupInfo"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="#FF3300" ValidationGroup="GroupInfo"
                                                    ErrorMessage="Le libellé du groupe est obligatoire !" ControlToValidate="utilisateur">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                          <tr>
                                            <td nowrap width="160px">
                                                <asp:Label ID="pass" runat="server" Text="Password : "></asp:Label>
                                            </td>
                                            <td nowrap>
                                                <asp:TextBox TextMode="Password" ID="mot_de_passe" runat="server" CssClass="txtFieldStyle" Width="250px" ValidationGroup="GroupInfo"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ForeColor="#FF3300" ValidationGroup="GroupInfo"
                                                    ErrorMessage="Le libellé du groupe est obligatoire !" ControlToValidate="mot_de_passe">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                          <tr>
                                            <td nowrap width="160px">
                                                <asp:Label ID="Label9" runat="server" Text="Confirmer : "></asp:Label>
                                            </td>
                                            <td nowrap>
                                                <asp:TextBox TextMode="Password" ID="TextBox5" runat="server" CssClass="txtFieldStyle" Width="250px" ValidationGroup="GroupInfo"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ForeColor="#FF3300" ValidationGroup="GroupInfo"
                                                    ErrorMessage="Le libellé du groupe est obligatoire !" ControlToValidate="TextBox5">*</asp:RequiredFieldValidator>
                                                

                                   <asp:CompareValidator ID="comparePasswords" runat="server" ControlToCompare="mot_de_passe" ControlToValidate="TextBox5" ValidationGroup="GroupInfo" ErrorMessage="Your passwords do not match up!" ForeColor="#FF3300">

                                   </asp:CompareValidator>

                         



                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap width="160px">
                                                <asp:Label ID="Label3" runat="server" Text="Groupe utilisateur : "></asp:Label>
                                            </td>
                                            <td nowrap>
                                                <asp:dropdownlist ID="ddl_privilege" runat="server"  Width="55%" />
                                          <asp:RequiredFieldValidator ID="rfvType" runat="server" ForeColor="#FF3300"  ControlToValidate="ddl_privilege" 
                            InitialValue="0" ErrorMessage="Type required">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap width="160px">
                                                <asp:Label ID="Label4" runat="server" Text="Statut Compte : "></asp:Label>
                                            </td>
                                            <td nowrap>
                                                <asp:dropdownlist ID="ddl_statutCompte" runat="server"  Width="55%" />
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="#FF3300"  ControlToValidate="ddl_privilege" 
                            InitialValue="0" ErrorMessage="Type required">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                         <asp:Panel runat="server" ID="pnel_patient" Visible="false">
                                    

                                             
                                       <tr>
                                           <td nowrap width="160px">
                                               <asp:Label ID="Label8" runat="server" Text="Patients Autorisés : "></asp:Label>
                                           </td>

                                           <td>
                                               <asp:ListBox ID="listePatient" Width="55%"  runat="server" SelectionMode="Multiple" ></asp:ListBox>
                                           </td>
                                       </tr>
                                       
                                       
                                        </asp:Panel>


                                         <tr>
                                            <td></td>
                                            <td style="padding-top: 10px"> 
                                                 <asp:Button ID="RadBtn_Save" runat="server" Text="Sauvegarder" ValidationGroup="cours" CausesValidation="true"
            class="btn btn-success" />

                                                &nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="RadBtn_Cancel" runat="server" Text="Annuler" CausesValidation="false"
            class="btn btn-primary" />
                                            </td>
                                        </tr>
                                    </table>
                                    </div>
                                     </div>               
                        




          
                      </asp:Panel>
    
                      
</div>

                
                 <div class="col-md-8">
<div class="col-md-12 col-sm-12 col-xs-12">
    <div class="panel panel-default">
                                <div class="panel-heading">
                                    <asp:Label ID="Label2" runat="server" Text="Liste Utilisateurs"></asp:Label>
                                </div>
                                <div class="panel-body">
                <div class="x_panel">
            
                  <div class="x_content">
                   

                      

                      <asp:ListView ID="rlv_part" runat="server" ItemPlaceholderID="ListViewContainer">
            <LayoutTemplate>
            <table id="datatable" class="table table-striped table-bordered">
                   
                                    <thead>
                        <tr>
                          <th>Prénom</th>
                          <th>Nom</th>
                    
                             <th>Utilisateur</th> 
                             <th>Privilège</th>
                             <th>Statut compte</th>

                          <th class="bulk-actions" colspan="7">
                              <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                            </th>
                        </tr>
                      </thead>                   
           <tbody>

                        <asp:PlaceHolder runat="server" ID="ListViewContainer" />
                </tbody>

          </table>
            </LayoutTemplate>
            <ItemTemplate>
                 <tr>
                          <td><%#Eval("Prenom")%></td>
                          <td><%#Eval("Nom")%></td>      
                    
                     <td><%#Eval("username")%></td> 
                      <td><%#Eval("Libelle")%></td> 
                      <td><%#Eval("libelle_statut_compte")%></td> 
                      <%--<td><%#Eval("telephone")%></td> 
                      <td><%#Eval("email")%></td--%>
                   
                    
                       <%--  <td><a href="../Demosss/Details_etudiant.aspx?ID=<%#Eval("ID_Fonction")%>"><i class="fa fa-search"></i></a></td>
                      
                   <td><asp:LinkButton Visible="true" ID="lk_delete_piege" OnClientClick="Confirm()" CommandName= "Delete" CausesValidation="false" runat="server" ToolTip="Delete" class=" glyphicon glyphicon-remove "></asp:LinkButton></td>  
                  <asp:TextBox Visible="false" runat="server" ID="TextBox2" Text='<%#Eval("ID_Fonction")%>'></asp:TextBox>--%>
                        </tr>
               </ItemTemplate>      
                </asp:ListView>
                  </div>






                    
                </div>

                                    </div>
        </div>
              </div>
</div>
           
                 
                  <div class="container">
 
</div>
            </div>   
       
          </div>
        </div>
</asp:Content>

