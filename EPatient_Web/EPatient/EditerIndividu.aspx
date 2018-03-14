<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="EditerIndividu.aspx.vb" Inherits="EPatient_Web.EditerIndividu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   
        
    
    <div class="right_col" role="main">

          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>
                      INDIVIDU
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
                 <asp:TextBox runat="server" ID="txt_prenom" class="form-control col-md-7 col-xs-12" name="prénom" placeholder="entrez votre prénom" required="required" type="text"></asp:TextBox>
                           
                            
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
                    
                       <asp:TextBox runat="server" id="txt_nom" class="form-control col-md-7 col-xs-12" name="prénom" placeholder="entrez votre nom" required="required" type="text"></asp:TextBox>
                    
                     
                 
                       </div>
                            
                            <div class="col-md-1 col-sm-6 col-xs-12">
                               <asp:CheckBox AutoPostBack="true"  runat="server" Text="Est un médecin" ID="chk_medecin" OnCheckedChanged="chk_medecin_CheckedChanged"/>
                          </div>

                             <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Identification<span class="required">*</span>
                        </label>
                  </div>

                  <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                      <input type="text" class="form-control" runat="server" id="txt_nif" placeholder="entrez votre NIF" data-inputmask="'mask' : '999-999-999-9'">   
                 
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
                     <asp:TextBox ID="txt_addresse" runat="server" type="text" class="form-control"  TextMode="MultiLine" placeholder="entrez votre addresse" required="required"></asp:TextBox>
                          
                          
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
                            




                    
                         






</div>

                       
            <br />
                        <asp:Panel runat="server" ID="pnel_specialisation" Visible="false">
<fieldset style="margin-right:20px;">
<br />
   
   
  
        <br />
         


       
      <div class="title_left">
                 <div class="col-md-12" style="font-size: 15px; font-weight:bold ; margin-left : 8px;">
       Spécialisations médecins
                      
			      </div>
              </div> 
    <br />
     <br />
   <div class="col-md-12" style=" margin-left : 8px;">
       <asp:CheckBoxList CellPadding="2"
           CellSpacing="3"
           RepeatColumns="10"
           RepeatDirection="Horizontal"
           
           TextAlign="Right" runat="server" ID="chk_specialisations" Width="1150px"></asp:CheckBoxList>
   </div>
    
    <div class="row alignright"  style="margin-right: 5px;">
      <asp:button runat="server"  class="btn btn-primary" ID ="btnew" Visible="false"  Text="Ajouter Spécialisation"></asp:button>
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
                      <td><a href="../EPatient/ListeMedicaments.aspx?ID=<%#Eval("ID_Specialisation")%>"><%#Eval("codeSpecialisation")%></a></td>  
                          <td><%#Eval("Description")%></td>
                     
               
                        </tr>
               </ItemTemplate>
                                                     <EditItemTemplate>
                                        <tr>
                                            
                                           
                                            <td><asp:TextBox ID="tb_update_lon_piege" CssClass="form-control" runat="server" Text='<%# Bind("Description")%>'></asp:TextBox></td>
                                             
                                            
                                             <asp:TextBox Visible="false" runat="server" ID="TextBox1" Text='<%#Eval("ID_Specialisation")%>'></asp:TextBox>
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
  
</fieldset>

                        </asp:Panel>
                        


                        
                        
                        
                        
                             
                      
                        
                      
                      
                      
                      
                      
                        

                        

                        


                        
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
