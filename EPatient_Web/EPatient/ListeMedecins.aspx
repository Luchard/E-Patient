<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ListeMedecins.aspx.vb" Inherits="EPatient_Web.ListeMedecins" %>
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
  <li class="active">Liste des médecins</li>
</ol>
				</div> 
              <div class="page-title">
              <div class="title_left">
                 <div class="col-md-12" style="font-size: 20px;">
        Liste  des médecins
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
      <asp:button runat="server"  class="btn btn-primary" ID ="btnew" Text="Nouveau médecin"></asp:button>
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
                      <th>Nom complet</th>
                            <th>Adresse</th>
                             <th>Age</th>
                      <th>Groupe Sanguin</th>
                         
                    

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
                      <td><a href="../EPatient/ListeMedicaments.aspx?ID=<%#Eval("ID_Individu")%>"><%#Eval("ID_Individu")%></a></td>  
                          <td><%#Eval("nom_complet")%></td>
                       <td><%#Eval("addresse")%></td>
                     <td><%#Eval("age")%></td>
                          
                     <td><%#Eval("GroupeSanguin")%></td>
                    
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






                  
                </div>
              </div>
            </div>   
          
          </div>
        </div>
</asp:Content>
