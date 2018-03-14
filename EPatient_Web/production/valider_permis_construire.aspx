<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="valider_permis_construire.aspx.vb" Inherits="production_valider_permis_construire" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">



    <div class="right_col" role="main">


   <div class="crumbs">
					<ol class="breadcrumb">
  <li><i class="fa fa-home"></i>
   <a href="../Demosss/Default4.aspx">Home</a></li>
  <li class="active">Validation</li>
   </ol>
	</div> 




                <div class="page-title">
              <div class="title_left">
                 <div class="col-md-12" style="font-size: 20px;">
        Validation
			      </div>
              </div>
                     </div>

         <form runat="server">
              









    

             <div class="row">

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    
                    <%--<ul class="nav navbar-right panel_toolbox">
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
                    </ul>--%>
                    <div class="clearfix"></div>


                  </div>
                  <div class="x_content">
                   
                    
                      




               
                      

                  <span class="section">Informations permis</span>
                        <div class="row">

                              <div class="col-sm-6">
                                  <asp:label ForeColor="Black" Font-Bold="true"   Text="Montant : " Font-Size="Medium"  runat="server"></asp:label>
                                   <asp:Label runat="server" ForeColor="Blue" Font-Size="Medium"  Font-Bold="true"  ID="txt_montant" ></asp:Label>
                             <asp:Label runat="server" Text="GOURDES" ForeColor="Blue" Font-Size="Medium"  Font-Bold="true"  ID="Label2" ></asp:Label>
                                   <br />
                    
                                   <asp:label ForeColor="Black" Font-Bold="true"   Text="Type de travaux :     " Font-Size="Medium"  runat="server"></asp:label>
                                  <asp:Label runat="server" ForeColor="Blue" Font-Size="Medium"  Font-Bold="true"  ID="lbl_travaux" ></asp:Label>
                                  <br />
                                   <asp:label ForeColor="Black" Font-Bold="true"  Text="Demandeur :     " runat="server"  Font-Size="Medium"></asp:label>
                                  <asp:Label runat="server" ForeColor="Blue" Font-Size="Medium"  Font-Bold="true"  ID="Label1" ></asp:Label>
                              <br />
                                  <asp:label ForeColor="Black" Font-Bold="true"  Text="Adresse :     " runat="server"  Font-Size="Medium"></asp:label>
                                  <asp:Label runat="server" ForeColor="Blue" Font-Size="Medium"  Font-Bold="true"  ID="lbl_adresse" ></asp:Label>
                              <br />
                                   <asp:label ForeColor="Black" Font-Bold="true"   Text="Surface :     " Font-Size="Medium"  runat="server"></asp:label>
                                  <asp:Label runat="server" ForeColor="Blue" Font-Size="Medium"  Font-Bold="true"  ID="lbl_surface" ></asp:Label>
                                   <asp:Label runat="server"  ForeColor="Blue" Font-Size="Medium"  Font-Bold="true"  ID="Label3" >m<sup>2</sup></asp:Label>
                           
                                    <br />
                                <asp:ListView ID="rlv_document" runat="server" ItemPlaceholderID="ListViewContainer">
                                            <LayoutTemplate>
                                                <table>
                                                    <td class="auto-style1">
                                                        <asp:Label runat="server" Text="Documents" Font-Size="Medium" Font-Bold="true"  ForeColor="Black"  ></asp:Label>
                                                    </td>
                                                    <asp:PlaceHolder runat="server" ID="ListViewContainer" />

                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>

                                                <tr>
                                                    <td style=" color:blue; font-size:medium ; font-family:'Times New Roman' ;">
                                                        <asp:Image ID="img_export" runat="server" ImageUrl="images/tick_1.png" Visible='<%#Eval("EstRemis")%>' />
                                                    <%#Eval("description")%></td>
                                                </tr>

                                            </ItemTemplate>
                                        </asp:ListView>
                            </div>

                            


                     
                           
    <asp:ScriptManager runat="server"></asp:ScriptManager>
                             
                     <div class="col-sm-6">

                         <table>
                             <tr>
                                 <td>
                                      <label for="recipient-name" class="form-control-label">Évaluation</label>
                                 </td>
                                 <td>
                                      <telerik:RadDatePicker ID="date_visite" runat="server"></telerik:RadDatePicker> 
                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                     &nbsp;
                                 </td>
                             </tr>
                             <tr>
                                 <td>
 <label class="form-control-label" for="prénom">Remarques
                        </label>
             &nbsp;
                                 </td>
                             
                                 <td>
                                         <asp:TextBox runat="server"  ID="txt_description" class="form-control col-md-12 col-xs-12" name="prénom" Height="100" Width="400"  required="required" TextMode="MultiLine" ></asp:TextBox>
                           
               
                                 </td>
                             </tr>
                         </table>

                     
                      
                          
          
                    
                               
                            
                               
                                   
                               

                             
                      
                 
                            
                

                          
                               
                        
                           
                   
                 




                     </div>      
                            

                        
                      
            



         

       








                            
    









                            </div>











                    
                  </div>







                    <%--fffff--%>



                 






                    
                   
                   
                      

                      

                 
                        <div class="row">
                       


                                                 
  




                            
                        <div class="row alignright" style="margin-right: 15px;">
     <%--   <asp:Button ID="RadBtn_Saveit" runat="server" Text="Sauvegarder" ValidationGroup="cours" CausesValidation="true"
            class="btn btn-success"/>--%>

                               <asp:Button ID="RadBtn_Saveit" runat="server" Text="Valider" 
           class="btn btn-success" CausesValidation="true"/>

                               <asp:Button ID="Button1" runat="server" Text="Rejeter" 
           class="btn btn-success" CausesValidation="true"/>



        <asp:Button ID="RadBtn_Cancelit" runat="server" Text="Annuler" CausesValidation="false"
            class="btn btn-primary" />
    </div>



                        











                            </div>











                    
                 






                    
















                    
                </div>
              </div>
            </div>   
          </form>





        </div>



























</asp:Content>
