﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ListeMedicaments.aspx.vb" Inherits="EPatient_Web.ListeMedicaments" %>
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
  <li class="active">Liste des médicaments</li>
</ol>
				</div> 
              <div class="page-title">
              <div class="title_left">
                 <div class="col-md-12" style="font-size: 20px;">
        Liste  des médicaments
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
	
              
                  <div class="row alignright"  style="margin-right: 15px;">
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Nouveau médicament</button>
                      </div>
        
             <div class="row">

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                   

                      

                      <asp:ListView ID="rlv_part" runat="server" ItemPlaceholderID="ListViewContainer">
                          
            <LayoutTemplate>
            <table id="datatable" class="table table-striped table-bordered">
                   
                                    <thead>
                        <tr>
                          <th>Code</th>
                      <th>Code international</th>
                            <th>Description</th>
                           <th>Montant</th>
                         
                    

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
                          
                  <%--  <ItemTemplate>
                        <asp:ImageButton ID="btnEdit" runat="server" 
                            ImageUrl="~/images/_edit.png"/>
                        <asp:Label ID="lbType" Text='<%# DataBinder.Eval(Container.DataItem, "CodeInternational") %>' runat="server" 
                             Visible="False"></asp:Label>
                    </ItemTemplate>--%>
                 
               
            <ItemTemplate>
                 <tr>
                      <td><a href="../EPatient/ListeMedicaments.aspx?ID=<%#Eval("id_medicament")%>"><%#Eval("id_medicament")%></a></td>  
                          <td><%#Eval("CodeInternational")%></td>
                       <td><%#Eval("Description")%></td>
                    <td><%#Eval("cout")%></td>
                    
                    <%--     <td><asp:LinkButton Visible="false" ID="lk_delete_piege" OnClientClick="Confirm()" CommandName= "Delete" CausesValidation="false" runat="server" ToolTip="Delete" class=" glyphicon glyphicon-remove "></asp:LinkButton></td>
                    <asp:TextBox Visible="false" runat="server" ID="TextBox2" Text='<%#Eval("ID_Individu")%>'></asp:TextBox>
                        <td><a href="../Demosss/Details_etudiant.aspx?ID=<%#Eval("ID_Fonction")%>"><i class="fa fa-search"></i></a></td>
                      
                   <td><asp:LinkButton Visible="true" ID="lk_delete_piege" OnClientClick="Confirm()" CommandName= "Delete" CausesValidation="false" runat="server" ToolTip="Delete" class=" glyphicon glyphicon-remove "></asp:LinkButton></td>  
                  <asp:TextBox Visible="false" runat="server" ID="TextBox2" Text='<%#Eval("ID_Fonction")%>'></asp:TextBox>--%>
                        </tr>
               </ItemTemplate>
                                                     <EditItemTemplate>
                                        <tr>
                                            
                                           
                                            <td><asp:TextBox ID="tb_update_lon_piege" CssClass="form-control" runat="server" Text='<%# Bind("CodeInternational")%>'></asp:TextBox></td>
                                             
                                            
                                             <asp:TextBox Visible="false" runat="server" ID="TextBox1" Text='<%#Eval("id_medicament")%>'></asp:TextBox>
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
                          <h4 class="modal-title" id="myModalLabel2">Ajouter nouvelle mairie</h4>
                        </div>
                        <div class="modal-body">
                        <div class="form-group">
                            
              <label for="recipient-name" class="form-control-label">Nom mairie </label>
             <asp:TextBox runat="server" id="txt_nom_mairie" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez la mairie" required="required" type="text"></asp:TextBox>
          
                              </div>
                            <div class="form-group">
                            
              <label for="recipient-name" class="form-control-label">Commune </label>
             <asp:TextBox runat="server" Visible ="false"  id="txt_ville" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez la mairie" required="required" type="text"></asp:TextBox>
          

                                 <asp:dropdownlist ID="ddl_commune" runat="server"   class="form-control col-md-2 col-xs-12">
                                              </asp:dropdownlist>

                              </div>
                            <div class="form-group">
                            
              <label for="recipient-name" class="form-control-label">Adresse </label>
             <asp:TextBox runat="server" id="txt_adresse" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez l'adresse" required="required" type="text"></asp:TextBox>
          
                              </div>
                            <div class="form-group">
                            
              <label for="recipient-name" class="form-control-label">Longitude</label>
             <asp:TextBox runat="server" id="txt_longitude" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez la longitude" required="required" type="text"></asp:TextBox>
          
                              </div>
                            <div class="form-group">
                            
              <label for="recipient-name" class="form-control-label">Latitude </label>
             <asp:TextBox runat="server" id="txt_latitude" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez la latitude" required="required" type="text"></asp:TextBox>
          
                              </div>
                            <div class="form-group">
                            
              <label for="recipient-name" class="form-control-label">Description </label>
             <asp:TextBox runat="server" id="txt_description" class="form-control col-md-7 col-xs-12" name="recipient-name" TextMode="MultiLine"  placeholder="entrez la description" required="required" type="text"></asp:TextBox>
          
                              </div>
                          <%--  <div class="form-group">
     <label for="recipient-name" class="form-control-label">Tarif</label>
             <asp:TextBox runat="server" id="txt_tarif" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez une description" required="required" type="text"></asp:TextBox>
</div>--%>
                           
<%--<div class="form-group">
     <label for="recipient-name" class="form-control-label">Description</label>
             <asp:TextBox runat="server" id="txt_montant" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez une description" required="required" type="text"></asp:TextBox>
</div>--%>
                            <hr />

                            
                            <br />
                  
                            <br />
                        </div>
                        
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