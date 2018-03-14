<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AddIndividu.aspx.vb" Inherits="EPatient_Web.AddIndividu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   
        
    
    <div class="right_col" role="main">

          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>
                   AJOUTER   INDIVIDU
                  </h3>
              </div>

       
            </div>
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    
              
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    

                      <asp:ScriptManager runat="server"></asp:ScriptManager>
                  
                        <div class="row">
                               <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="prénom">Prénom<span class="required">*</span>
                        </label>
                  </div>

                  <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                 <asp:TextBox runat="server" ID="txt_prenom" class="form-control col-md-7 col-xs-12" name="prénom" placeholder="entrez le prénom" required="required" type="text"></asp:TextBox>
                           
                            
                  </div>

                            <div class="col-md-1 col-sm-6 col-xs-12">
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_prenom"  ID="RequiredFieldValidator6" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>
                          </div>

                  <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Nom<span class="required">*</span>
                        </label>
                       </div>

                  <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                    
                       <asp:TextBox runat="server" id="txt_nom" class="form-control col-md-7 col-xs-12" name="prénom" placeholder="entrez le nom" required="required" type="text"></asp:TextBox>
                    
                     
                 
                       </div>
                            

                             <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Identification<span class="required">*</span>
                        </label>
                  </div>

                  <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                      <input type="text" class="form-control" runat="server" id="txt_nif" placeholder="entrez le NIF" data-inputmask="'mask' : '999-999-999-9'">   
                 
                       </div>

                               <div class="col-md-1 col-sm-6 col-xs-12">
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_nif"  ID="RequiredFieldValidator7" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>


                                  
                          </div>

                 
                             <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Sexe<span class="required">*</span></label>
                  </div>

                  <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                     <asp:DropDownList ID="ddl_sexe" runat="server" class="form-control col-md-7 col-xs-12">
                                                    
                                                </asp:DropDownList>
                  </div>
                               <div class="col-md-1 col-sm-6 col-xs-12">
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_sexe"  ID="RequiredFieldValidator8" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>
                          </div>

                   
                     

 <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-3">Addresse<span class="required">*</span></label>
                  </div>

                  <div class="col-md-9 col-sm-12 col-xs-12 form-group">
                     <asp:TextBox ID="txt_addresse" runat="server" type="text" class="form-control"  TextMode="MultiLine" placeholder="entrez l' addresse" required="required"></asp:TextBox>
                          
                          
                  </div>


                          


           

                   

  

                

                          

                  



                                     <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="description">Groupe Sanguin<span class="required">*</span>
                        </label>
                  </div>

                  <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                      <asp:DropDownList ID="ddl_groupe_sanguin" runat="server" class="form-control col-md-7 col-xs-12">
                                               
                           <asp:ListItem Value="A+">A+</asp:ListItem>
                          <asp:ListItem Value="A-">A-</asp:ListItem>
                           <asp:ListItem Value="B+">B+</asp:ListItem>
                          <asp:ListItem Value="B-">B-</asp:ListItem>
                          <asp:ListItem Value="AB+">AB+</asp:ListItem>
                          <asp:ListItem Value="AB-">AB-</asp:ListItem>
                          <asp:ListItem Value="O+">O+</asp:ListItem>
                          <asp:ListItem Value="O-">O-</asp:ListItem>
                         </asp:DropDownList>
                     
                  </div> 
                            <div class="col-md-1 col-sm-6 col-xs-12">
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_groupe_sanguin" ID="txtt_taux" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>
                          </div>

                           
                            

                              <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="taux">Date Naissance<span class="required">*</span>
                        </label>
                  </div>

                  <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                      
                    
                                <input type="text" runat="server"  class="form-control has-feedback-left" id="single_cal1" placeholder="Date naissance" aria-describedby="inputSuccess2Status">
                                <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                 
                 </div>
                            


                             <div class="col-md-3 col-sm-6 col-xs-12">
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_groupe_sanguin" ID="RequiredFieldValidator2" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>
                          </div>

                    
                         
<div class="col-md-2 col-sm-12 col-xs-12 form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="prénom">Lieu Naissance<span class="required">*</span>
                        </label>
                  </div>

                  <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                 <asp:TextBox runat="server" ID="txt_lieu_naissance" class="form-control col-md-7 col-xs-12" name="prénom" placeholder="entrez le lieu de naissance" required="required" type="text"></asp:TextBox>
                           
                            
                  </div>

                            <div class="col-md-1 col-sm-6 col-xs-12">
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_prenom"  ID="RequiredFieldValidator1" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>
                          </div>

                  <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Ville Naissance<span class="required">*</span>
                        </label>
                       </div>

                  <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                    
                       
                    <asp:DropDownList runat="server" ID ="ddl_ville"   class="form-control col-md-7 col-xs-12"></asp:DropDownList>
                     
                 
                       </div>


 <div class="col-md-3 col-sm-6 col-xs-12">
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_prenom"  ID="RequiredFieldValidator4" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>
                          </div>










                             <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="prénom">Nom Père<span class="required">*</span>
                        </label>
                  </div>

                  <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                 <asp:TextBox runat="server" ID="txt_nom_pere" class="form-control col-md-7 col-xs-12" name="prénom" placeholder="entrez le nom du père" required="required" type="text"></asp:TextBox>
                           
                            
                  </div>

                            <div class="col-md-1 col-sm-6 col-xs-12">
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_prenom"  ID="RequiredFieldValidator3" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                            </asp:RequiredFieldValidator>
                          </div>

                  <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Nom Mère<span class="required">*</span>
                        </label>
                       </div>

                  <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                    
                       <asp:TextBox runat="server" id="txt_nom_mere" class="form-control col-md-7 col-xs-12" name="prénom" placeholder="entrez le nom de la mère" required="required" type="text"></asp:TextBox>
                    
                     
                 
                       </div>

</div>

                       
            <br />
                       


                        
                        
                        
                        
                             
                      
                        
                      
                      
                      
                      
                      
                        

                        

                        


                        
                      <div class="ln_solid"></div>
                    

                        <div class="row alignright" style="margin-right: 15px;">
        <asp:Button ID="RadBtn_Save" runat="server" Text="Sauvegarder" ValidationGroup="cours" CausesValidation="true"
            class="btn btn-success" />

        <asp:Button ID="RadBtn_Cancel" runat="server" Text="Annuler" CausesValidation="false"
            class="btn btn-primary" />
    </div>











    

























                




                      
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
</asp:Content>
