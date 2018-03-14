<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="EditerPrescription.aspx.vb" Inherits="EPatient_Web.EditerPrescription" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        function check_fields() {

            has_errors = false;
            var code = document.getElementById("<%=code.ClientID%>");
            if (code.value == "") {
                code.parentElement.className += " has-error";
                has_errors = true;
            }

            return !has_errors;

        }

    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">



    <div class="right_col" role="main">

        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <h3>EDITER UNE PRESCRIPTION
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




                            <asp:ScriptManager runat="server"></asp:ScriptManager>

                            <input type="hidden" id="form_id_prescription" runat="server" value="0" />





                            <div class="row">
                                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="prenom">
                                        Code<span class="required">*</span>
                                    </label>
                                </div>

                                <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                    <asp:TextBox runat="server" ID="code" class="form-control col-md-7 col-xs-12" name="code" placeholder="entrez code" required="required" type="text"></asp:TextBox>

                                </div>

                                <div class="col-md-1 col-sm-6 col-xs-12">
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="code" ID="RequiredFieldValidator6" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">
                                        Consulté<span class="required">*</span>
                                    </label>
                                </div>

                                <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                
                                <input type="text" runat="server"  class="form-control has-feedback-left" id="single_cal1" placeholder="Date consultation" aria-describedby="inputSuccess2Status">
                                <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                 
                                       </div>

                                <div class="col-md-1 col-sm-6 col-xs-12">
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="single_cal1" ID="RequiredFieldValidator1" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">
                                        Patient<span class="required">*</span>
                                    </label>
                                </div>

                                <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                    <asp:DropDownList ID="ddl_patient" runat="server" class="form-control col-md-7 col-xs-12"></asp:DropDownList>
                                </div>

                                <div class="col-md-1 col-sm-6 col-xs-12">
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_patient" ID="RequiredFieldValidator7" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                                    </asp:RequiredFieldValidator>



                                </div>


                                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Médecin<span class="required">*</span></label>
                                </div>

                                <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                    <asp:DropDownList ID="ddl_medecin" runat="server" class="form-control col-md-7 col-xs-12">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-1 col-sm-6 col-xs-12">
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_medecin" ID="RequiredFieldValidator8" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                                    </asp:RequiredFieldValidator>
                                </div>




                                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-3">Diagnostique<span class="required">*</span></label>
                                </div>

                                <div class="col-md-9 col-sm-12 col-xs-12 form-group">
                                    <asp:TextBox ID="txt_diagnostique" runat="server" type="text" class="form-control" TextMode="MultiLine" placeholder="entrez votre diagnotisque" required="required"></asp:TextBox>


                                </div>


                                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-3">Symptômes<span class="required">*</span></label>
                                </div>

                                <div class="col-md-9 col-sm-12 col-xs-12 form-group">
                                    <asp:TextBox ID="txt_symptome" runat="server" type="text" class="form-control" TextMode="MultiLine" placeholder="entrez votre diagnotisque" required="required"></asp:TextBox>


                                </div>


                                <div class="col-md-1 col-sm-6 col-xs-12">
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_symptome" ID="RequiredFieldValidator9" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>
                                            
                                    </asp:RequiredFieldValidator>
                                </div>



                                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="description">
                                        Poids<span class="required">*</span>
                                    </label>
                                </div>

                                <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                    <input type="text" class="form-control" runat="server" id="txt_poids" placeholder="entrez le poids du patient">
                                </div>
                                <div class="col-md-1 col-sm-6 col-xs-12">
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_poids" ID="txtt_taux" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                                    </asp:RequiredFieldValidator>
                                </div>




                                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="taux">
                                        Taille<span class="required">*</span>
                                    </label>
                                </div>

                                <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                    <asp:TextBox ID="txt_taille" runat="server" type="text" class="form-control" placeholder="entrez la taille du patient" required="required"></asp:TextBox>


                                    <span class="fa fa-text-height form-control-feedback right" aria-hidden="true"></span>

                                </div>

                            </div>


                            <br />

                            <fieldset style="margin-right: 20px;">
                                <br />


                                <fieldset style="margin: 20px;">
                                    <br />
                                    <div class="row">


                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">
                                                Médicament<span class="required">*</span>
                                            </label>
                                        </div>

                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <asp:DropDownList ID="ddl_medicament" runat="server" class="form-control col-md-7 col-xs-12"></asp:DropDownList>
                                        </div>

                                        <div class="col-md-1 col-sm-6 col-xs-12">
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_medicament" ID="RequiredFieldValidator4" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                                            </asp:RequiredFieldValidator>
                                        </div>


                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Dosage<span class="required">*</span></label>
                                        </div>

                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <asp:TextBox ID="txt_dossage" runat="server" type="text" class="form-control" placeholder="entrez le dosage du médicament" required="required"></asp:TextBox>

                                        </div>
                                        <div class="col-md-1 col-sm-6 col-xs-12">
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_dossage" ID="RequiredFieldValidator5" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                                            </asp:RequiredFieldValidator>
                                        </div>




                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-3">Effets secondaires<span class="required">*</span></label>
                                        </div>

                                        <div class="col-md-9 col-sm-12 col-xs-12 form-group">
                                            <asp:TextBox ID="txt_effets_sec" runat="server" type="text" class="form-control" TextMode="MultiLine" placeholder="entrez les effets secondaires du médicament" required="required"></asp:TextBox>


                                        </div>


                                        <div class="col-md-12">

                                            <div class="row" runat="server" id="div_cout" visible="false">

                                                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">
                                                        Institution<span class="required">*</span>
                                                    </label>
                                                </div>

                                                <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                    <asp:DropDownList ID="ddl_institution" runat="server" class="form-control col-md-7 col-xs-12"></asp:DropDownList>
                                                </div>

                                                <div class="col-md-1 col-sm-6 col-xs-12">
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_institution" ID="RequiredFieldValidator2" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                                                    </asp:RequiredFieldValidator>
                                                </div>


                                                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Cout<span class="required">*</span></label>
                                                </div>

                                                <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                    <asp:TextBox ID="txt_cout" runat="server" type="text" class="form-control" placeholder="entrez la taille du patient" required="required"></asp:TextBox>


                                                    <span class="fa fa-user form-control-feedback right" aria-hidden="true">Gdes</span>

                                                </div>

                                                <div class="col-md-1 col-sm-6 col-xs-12">
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_cout" ID="RequiredFieldValidator3" Text="Champ obligatoire !" ValidationGroup="cours"><span style="color:red">*</span>

                                                    </asp:RequiredFieldValidator>
                                                </div>


                                            </div>

                                        </div>


                                    </div>
                                </fieldset>


                                <div class="row alignright" style="margin-right: 5px;">
                                    <asp:Button runat="server" OnClientClick="return check_fields();" class="btn btn-primary" ID="btnew" Text="Ajouter médicament"></asp:Button>
                                </div>


                                <div class="title_left">
                                    <div class="col-md-12" style="font-size: 15px; font-weight: bold; margin-left: 8px;">
                                        Médicaments
                                    </div>
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
                                                                    <th>Medicaments</th>
                                                                    <th>Description</th>
                                                                    <th>Dosage</th>
                                                                    <th>Cout</th>



                                                                    <th class="bulk-actions" colspan="7">
                                                                        <a class="antoo" style="color: #fff; font-weight: 500;">Bulk Actions ( <span class="action-cnt"></span>) <i class="fa fa-chevron-down"></i></a>
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
                                                            <td><a href="../EPatient/ListeMedicaments.aspx?ID=<%#Eval("CodeMedicament")%>"><%#Eval("Tbl_Medicament.CodeInternational")%></a></td>
                                                            <td><%#Eval("EffeSecondaire")%></td>
                                                            <td><%#Eval("Dosage")%></td>
                                                            <td>0.00</td>

                                                            <%--     <td><asp:LinkButton Visible="false" ID="lk_delete_piege" OnClientClick="Confirm()" CommandName= "Delete" CausesValidation="false" runat="server" ToolTip="Delete" class=" glyphicon glyphicon-remove "></asp:LinkButton></td>
                    <asp:TextBox Visible="false" runat="server" ID="TextBox2" Text='<%#Eval("ID_Individu")%>'></asp:TextBox>
                        <td><a href="../Demosss/Details_etudiant.aspx?ID=<%#Eval("ID_Fonction")%>"><i class="fa fa-search"></i></a></td>
                      
                   <td><asp:LinkButton Visible="true" ID="lk_delete_piege" OnClientClick="Confirm()" CommandName= "Delete" CausesValidation="false" runat="server" ToolTip="Delete" class=" glyphicon glyphicon-remove "></asp:LinkButton></td>  
                  <asp:TextBox Visible="false" runat="server" ID="TextBox2" Text='<%#Eval("ID_Fonction")%>'></asp:TextBox>--%>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <tr>


                                                            <td>
                                                                <asp:TextBox ID="tb_update_lon_piege" CssClass="form-control" runat="server" Text='<%# Bind("CodeInternational")%>'></asp:TextBox></td>


                                                            <asp:TextBox Visible="false" runat="server" ID="TextBox1" Text='<%#Eval("id_medicament")%>'></asp:TextBox>
                                                            <td>
                                                                <asp:LinkButton ID="lk_update_piege" CommandName="Update" CausesValidation="false" runat="server" ToolTip="Modifier" class="btn btn-primary btn-xs" Style="margin-right: 5px; margin-top: 10px"><i class=" fa fa-check"></i></asp:LinkButton>
                                                                <asp:LinkButton ID="lk_delete_piege" CommandName="Cancel" CausesValidation="false" runat="server" ToolTip="Annuler" class="btn btn-primary btn-xs" Style="margin-top: 10px"><i class=" fa fa-close"></i></asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <tr>
                                                            <td style="vertical-align: middle"><strong>Ajouter</strong></td>


                                                            <td>
                                                                <asp:TextBox ID="tb_update_lon_piege" CssClass="form-control" runat="server"></asp:TextBox></td>
                                                            <td>
                                                                <asp:TextBox ID="tb_update_code_piege" CssClass="form-control" runat="server"></asp:TextBox></td>

                                                            <td>
                                                                <asp:LinkButton ID="lk_insert_piege" CommandName="Insert" CausesValidation="false" runat="server" ToolTip="Ajouter" class="btn btn-primary btn-xs" Style="margin-right: 5px; margin-top: 10px"><i class=" fa fa-plus"></i></asp:LinkButton>
                                                                <asp:LinkButton ID="lk_delete_piege" CommandName="Cancel" CausesValidation="false" runat="server" ToolTip="Annuler" class="btn btn-primary btn-xs" Style="margin-top: 10px"><i class=" fa fa-close"></i></asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </InsertItemTemplate>
                                                </asp:ListView>
                                            </div>







                                        </div>
                                    </div>
                                </div>

                            </fieldset>






















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

