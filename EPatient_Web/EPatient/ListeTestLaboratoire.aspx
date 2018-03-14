<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ListeTestLaboratoire.aspx.vb" Inherits="EPatient_Web.ListeTestLaboratoire" %>
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
  <li class="active">Liste  des tests de laboratoire</li>
</ol>
				</div> 
              <div class="page-title">
              <div class="title_left">
                 <div class="col-md-12" style="font-size: 20px;">
        Liste  des tests de laboratoire
			      </div>
              </div>


            </div>
            <div class="clearfix"></div>
	
             
                  <div class="row alignright"  style="margin-right: 15px;">
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Nouveau test</button>
                      </div>
        
             <div class="row">

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
             
                  <div class="x_content">
                   

                      

                      <asp:ListView ID="rlv_part" runat="server" ItemPlaceholderID="ListViewContainer">
                          
            <LayoutTemplate>
            <table id="datatable" class="table table-striped table-bordered">
                   
                                    <thead>
                        <tr>
                            <th>Code</th>
                          <th>Description</th>
                        
                         <th>Modifier</th>
                       <th>Supprimer</th>
                             <%--<th>Détails</th>
                            <th>Edit</th>
                        <th>Delete</th>--%>

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
                          <td><%#Eval("CodeInternational")%></td>
                        <td><%#Eval("Description")%></td>
                           
                     <td><asp:LinkButton Visible="true" ID="LinkButton1" CommandName="Edit" CausesValidation="false" runat="server" ToolTip="Modifier" class=" glyphicon glyphicon-edit "></asp:LinkButton></td>  
                        <td><asp:LinkButton Visible="true" ID="lk_delete_piege" OnClientClick="Confirm()" CommandName= "Delete" CausesValidation="false" runat="server" ToolTip="Delete" class=" glyphicon glyphicon-remove "></asp:LinkButton></td>
                    <asp:TextBox Visible="false" runat="server" ID="TextBox2" Text='<%#Eval("ID_TestLaboratoire")%>'></asp:TextBox>
                       <%--  <td><a href="../Demosss/Details_etudiant.aspx?ID=<%#Eval("ID_Fonction")%>"><i class="fa fa-search"></i></a></td>
                      
                   <td><asp:LinkButton Visible="true" ID="lk_delete_piege" OnClientClick="Confirm()" CommandName= "Delete" CausesValidation="false" runat="server" ToolTip="Delete" class=" glyphicon glyphicon-remove "></asp:LinkButton></td>  
                  <asp:TextBox Visible="false" runat="server" ID="TextBox2" Text='<%#Eval("ID_Fonction")%>'></asp:TextBox>--%>
                        </tr>
               </ItemTemplate>
                                                     <EditItemTemplate>
                                        <tr>
                                            
                                           
                                            <td><asp:TextBox ID="tb_update_lon_piege" CssClass="form-control" runat="server" Text='<%# Bind("CodeInternational")%>'></asp:TextBox></td>
                                             
                                            <td><asp:TextBox ID="txt_update_test" CssClass="form-control" runat="server" Text='<%# Bind("Description")%>'></asp:TextBox></td>
                                             
                                            
                                             <asp:TextBox Visible="false" runat="server" ID="TextBox1" Text='<%#Eval("ID_TestLaboratoire")%>'></asp:TextBox>
                                             <td>
                                                <asp:LinkButton ID="lk_update_piege" CommandName="Update" CausesValidation="false" runat="server" ToolTip="Modifier" class="btn btn-primary btn-xs" style="margin-right:5px;margin-top:10px"><i class=" fa fa-check"></i></asp:LinkButton>
                                                <asp:LinkButton ID="lk_delete_piege" CommandName="Cancel" CausesValidation="false" runat="server" ToolTip="Annuler" class="btn btn-primary btn-xs" style="margin-top:10px"><i class=" fa fa-close"></i></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </EditItemTemplate>
                                        <InsertItemTemplate>
                                         <tr>
                                            <td style="vertical-align:middle"><strong>Ajouter</strong></td>
                                           
                   
                                            <td><asp:TextBox ID="tb_update_lon_piege" CssClass="form-control" runat="server"></asp:TextBox></td>
                                            <td><asp:TextBox ID="tb_update_code_piege" CssClass="form-control" runat="server"></asp:TextBox></td>
                                         
                                            <td>
                                                <asp:LinkButton ID="lk_insert_piege" CommandName="Insert" CausesValidation="false" runat="server" ToolTip="Ajouter" class="btn btn-primary btn-xs" style="margin-right:5px;margin-top:10px"><i class=" fa fa-plus"></i></asp:LinkButton>
                                                <asp:LinkButton ID="lk_delete_piege" CommandName="Cancel" CausesValidation="false" runat="server" ToolTip="Annuler" class="btn btn-primary btn-xs" style="margin-top:10px"><i class=" fa fa-close"></i></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </InsertItemTemplate>        
                </asp:ListView>
                  </div>






                    <div class="x_content">

                  <!-- modals -->
                  <!-- Large modal -->
               <%--   <button type="button"  class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Large modal</button>--%>

                  <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                        </div>
                        <div class="modal-body">
                          <h4>Text in a modal</h4>
                          <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                          <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</p>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          <button type="button" class="btn btn-primary">Save changes</button>
                        </div>

                      </div>
                    </div>
                  </div>

                  <!-- Small modal -->
               <%--   <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Small modal</button>--%>

                  <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel2">Ajouter des tests de laboratoire</h4>
                        </div>
                        <div class="modal-body">
                        <div class="form-group">
                            
              <label for="recipient-name" class="form-control-label">Test </label>
             <asp:TextBox runat="server" id="txt_test" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez le secteur" required="required" type="text"></asp:TextBox>
          
                              </div>
              

                           <div class="form-group">
                            
              <label for="recipient-name" class="form-control-label">Code International </label>
             <asp:TextBox runat="server" id="txt_code" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez le secteur" required="required" type="text"></asp:TextBox>
          
                              </div>  

                  

                        </div>
                          <br />
                        
                        <div class="modal-footer">
                             
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          <asp:Button ID="RadBtn_Save"  runat="server" Text="Save changes"  class="btn btn-primary"/>
         
                           <%-- <button type="button" class="btn btn-primary">Save changes</button>--%>
                        </div>

                      </div>
                    </div>
                  </div>
                  <!-- /modals -->
                </div>
                </div>
              </div>
            </div>   
       
          </div>
        </div>
</asp:Content>
