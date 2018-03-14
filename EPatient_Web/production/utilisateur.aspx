<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="utilisateur.aspx.vb" Inherits="production_utilisateur" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        Utilisateurs
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
	
              <form runat="server">
                  
        

        



             <div class="row">
<div class="col-md-5">
    <fieldset>
        <asp:Panel runat="server" ID="panel_informations">
                                               
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="prénom">Prénom<span class="required">*</span>
                        </label>
                  </div>

                  <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                 <asp:TextBox runat="server" id="prénom" class="form-control col-md-7 col-xs-12" name="prénom" placeholder="entrez votre prénom" required="required" type="text"></asp:TextBox>
                           
                              <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>   
                  </div>

                            <div class="col-md-1 col-sm-6 col-xs-12">
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="prénom"  ID="RequiredFieldValidator6" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>
                          </div>
                            </div>
                               
                            <div class="col-md-12">
                                <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Nom<span class="required">*</span>
                        </label>
                       </div>

                  <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                  <asp:TextBox runat="server" id="name" class="form-control col-md-7 col-xs-12" name="name" placeholder="entrez votre nom" required="required" type="text"></asp:TextBox> 
                        <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                  </div>
                            <div class="col-md-1 col-sm-6 col-xs-12">
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="name"  ID="RequiredFieldValidator5" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>
                          </div>
                            </div>
                  
                            <div class="col-md-12">
                                <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email<span class="required">*</span>
                        </label>
                  </div>

                  <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                     <asp:TextBox runat="server" type="email" id="email" name="email" required="required" placeholder="exemple@yahoo.fr" class="form-control col-md-7 col-xs-12"></asp:TextBox>
                        <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                  </div>

                               <div class="col-md-1 col-sm-6 col-xs-12">
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="email"  ID="RequiredFieldValidator7" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>
                          </div>
                            </div>

                             

              <%--      <div class="col-md-12">
                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Sexe<span class="required">*</span></label>
                  </div>

                  <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                     <asp:DropDownList ID="rcmb_sexe" runat="server" class="form-control col-md-7 col-xs-12">
                                                    <Items>
                                                        <asp:listitem runat="server" Text="Masculin" Value="M" />
                                                        <asp:listitem runat="server" Text="Féminin" Value="F" />
                                                    </Items>
                                                </asp:DropDownList>
                  </div>
                               <div class="col-md-1 col-sm-6 col-xs-12">
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="email"  ID="RequiredFieldValidator8" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>
                          </div>
                    </div>
                             --%>

                   
                     
 <div class="col-md-12">
     <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-3">Utilisateur<span class="required">*</span></label>
                  </div>

                  <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                     <asp:TextBox ID="utilisateur" runat="server" type="text" class="form-control" placeholder="entrez votre username" required="required"></asp:TextBox>
                          
                          <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                  </div>


   <div class="col-md-1 col-sm-6 col-xs-12">
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="utilisateur"  ID="RequiredFieldValidator9" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>
                          </div></div>
 
    
                              
 <div class="col-md-12">
<div class="col-md-3 col-sm-12 col-xs-12 form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="description">Password<span class="required">*</span>
                        </label>
                  </div>

                  <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                    <asp:TextBox runat="server" type="text" TextMode="Password" id="password" name="password" required="required" placeholder="*****" class="form-control col-md-7 col-xs-12"></asp:TextBox>
                        <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>        
                       
                    
                     
                  </div> 
               <div class="col-md-1 col-sm-6 col-xs-12">
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="password"  ID="RequiredFieldValidator3" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>
                          </div>
     </div>



 <div class="col-md-12">
 <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12" for="confirmpassword">Confirmer<span class="required">*</span>
                        </label>
                  </div>

                  <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                     <asp:TextBox runat="server" type="text" TextMode="Password" id="confirmpassword" name="confirmpassword" required="required" placeholder="******" class="form-control col-md-7 col-xs-12"></asp:TextBox>
                        <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                  </div>

                               <div class="col-md-3 col-sm-6 col-xs-12">

                                   <asp:CompareValidator ID="comparePasswords" runat="server" ControlToCompare="password" ControlToValidate="confirmpassword" ErrorMessage="Your passwords do not match up!" ForeColor="#FF3300">

                                   </asp:CompareValidator>

                          </div>
 </div>

                            <div class="col-md-12">
                           <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="taux">Role<span class="required">*</span>
                        </label>
                  </div>
                                            
                                               
                                         

                                            
                                            
                                                 <div class="col-md-6 col-sm-12 col-xs-12 form-group">
   <asp:dropdownlist ID="Dropdownlist5" runat="server"  class="form-control col-md-2 col-xs-12">
                                              
                                                   
                                                </asp:dropdownlist>
                                                 </div>
                                           

                                            
                                            
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Dropdownlist5"  ID="RequiredFieldValidator14" InitialValue="0" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>
                                           







                                     
 </div>






                            <div class="col-md-12">
<div class="col-md-3 col-sm-12 col-xs-12 form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="taux">Mairie<span class="required">*</span>
                        </label>
                  </div>

                  <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                       <asp:dropdownlist ID="Dropdownlist4" runat="server"  class="form-control col-md-2 col-xs-12">
                         
                                                   
                                                </asp:dropdownlist>  
                       
                  </div> 


                              <div class="col-md-1 col-sm-6 col-xs-12">
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="Dropdownlist4"  ID="RequiredFieldValidator15" InitialValue="0" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>
                          </div>
 </div>
                            <div class="col-md-12">
                                <div class="row alignright" style="margin-right: 15px;">
     <%--   <asp:Button ID="RadBtn_Saveit" runat="server" Text="Sauvegarder" ValidationGroup="cours" CausesValidation="true"
            class="btn btn-success"/>--%>

                               <asp:Button ID="RadBtn_Saveit" runat="server" Text="Sauvegarder" 
           class="btn btn-success" CausesValidation="true"/>




        <asp:Button ID="RadBtn_Cancelit" runat="server" Text="Annuler" CausesValidation="false"
            class="btn btn-primary" />
    </div>
                            </div>
                             
                    </div>
                      </asp:Panel>
    </fieldset>
                      
</div>
                 <div class="col-md-7">
<div class="col-md-12 col-sm-12 col-xs-12">
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
                            <%-- <th>Téléphone</th>
                             <th>Email</th>
                            --%>
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
                          <td><%#Eval("prenom")%></td>
                          <td><%#Eval("nom")%></td>      
                    
                     <td><%#Eval("username")%></td> 
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
          </form>
          </div>
        </div>
</asp:Content>
