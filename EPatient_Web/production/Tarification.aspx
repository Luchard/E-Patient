<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Tarification.aspx.vb" Inherits="production_Tarification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="right_col" role="main">

          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>
                     Tarification
                  </h3>
              </div>

          <%--    <div class="title_right">
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

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    
              
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <form runat="server"  class="form-horizontal form-label-left" novalidate>

                      
                      <span class="section">Informations pour le tarif</span>
                        <div class="row">
                           
                 
  <table>
                                    <tr>
                                        <td>
   <label for="recipient-name" class="form-control-label">Service<span class="required">*</span>
                    </label>
                                        </td>
                                        <td>
                                              &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                        <td>
  <asp:dropdownlist runat="server" AutoPostBack="true"  OnSelectedIndexChanged="rcmb_service_SelectedIndexChanged" ID="rcmb_service"  class="form-control col-md-7 col-xs-12"></asp:dropdownlist>
          
                                        </td>
 
                                    </tr>
                                   
                                </table>

                

   
                            <br />
                         
                            <asp:Panel runat="server" ID ="panel_permis_construire" Visible="false" >
                                <table>
                                    <tr>
                                        <td>
  <label for="recipient-name" class="form-control-label">Type Construction</label>
                                        </td>
                                        <td>
                                            &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                        <td>
 <asp:dropdownlist runat="server" ID="rcmb_construction"  class="form-control col-md-7 col-xs-12"></asp:dropdownlist>
  
                                        </td>
                                        <td>
                                             &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                        <td>
                                              <label for="recipient-name" class="form-control-label">Taxe principale</label>
                                        </td>
                                        <td>
                                            &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                        <td>
    <asp:TextBox runat="server"  id="txt_taxe_principale" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez le prix par m2" required="required" type="text"></asp:TextBox>
          
                                        </td>
                                         <td>
                                             &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                        <td>
                                                <label for="recipient-name" class="form-control-label">Taxe</label>
                                        </td>
                                        <td>
                                            &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" id="txt_taxe" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez la taxe" required="required" type="text"></asp:TextBox>
          
                                        </td>
                                        <td>
                                             <label>%</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                              &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
  <label for="recipient-name" class="form-control-label">Droit spécial</label>
                                        </td>
                                        <td>
                                            &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                        <td>
  <asp:TextBox runat="server" id="txt_droit_special" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez le droit spécial" required="required" type="text"></asp:TextBox>
          
  
                                        </td>
                                        <td>
                                             &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                        <td>
                                               <label for="recipient-name" class="form-control-label">Droit fixe</label>
                                        </td>
                                        <td>
                                            &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                        <td>
   <asp:TextBox runat="server" id="txt_droit_fixe" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez le droit fixe" required="required" type="text"></asp:TextBox>
                 
                                        </td>
                                         <td>
                                             &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                        <td>
                                                 <label for="recipient-name" class="form-control-label">Droit de numérotation</label>
                                        </td>
                                        <td>
                                            &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" id="txt_droit_numerotation" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez le droit de numérotation" required="required" type="text"></asp:TextBox>
          
                                        </td>
                                       
                                    </tr>
                                </table>
                               
            
            
                       
                            
                            </asp:Panel>
                            
                  
                            <asp:Panel runat="server" ID="panel_autre" Visible="false" >
                                <table>
                                    <tr>
                                        <td>
<label for="recipient-name" class="form-control-label">Montant</label>
                                        </td>
                                        <td>
                                              &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                        <td>
  <asp:TextBox runat="server" id="txt_montant" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez le montant" required="required" type="text"></asp:TextBox>
          
                                        </td>
 
                                    </tr>
                                   
                                </table>
                                
                            </asp:Panel>
                            <asp:Panel runat="server" ID="panel_droit_affichage" Visible ="false" >
                                  <table>
                                    <tr>
                                        <td>
<label for="recipient-name" class="form-control-label">Montant/m<sup>2</sup></label>
                                        </td>
                                        <td>
                                              &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                        <td>
  <asp:TextBox runat="server" id="TextBox1" class="form-control col-md-7 col-xs-12" name="recipient-name" placeholder="entrez le montant" required="required" type="text"></asp:TextBox>
          
                                        </td>
 
                                    </tr>
                                   
                                </table>
                            </asp:Panel>


</div>

                       
                     
              
                        



                        
                        
                        
                        
                             
                      
                        
                      
                      
                      
                      
                      
                        

                        

                        


                        
                      <div class="ln_solid"></div>
                    

                        <div class="row alignright" style="margin-right: 15px;">
        <asp:Button ID="RadBtn_Save" runat="server" Text="Sauvegarder" ValidationGroup="cours" CausesValidation="true"
            class="btn btn-success" />

        <asp:Button ID="RadBtn_Cancel" runat="server" Text="Annuler" CausesValidation="false"
            class="btn btn-primary" />
    </div>











    

























                    </form>




                      
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
</asp:Content>
