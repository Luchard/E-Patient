Imports EPatient

Public Class EditerIndividu
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Bind_Sexe()
            Bind_Groupe()
            Bind_Specialisation()
            LoadInformationsIndividu()


        End If
    End Sub



    Private Sub Bind_Sexe(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0
        Using entities As New EPatient_dbEntities
            Dim cours = From courss In entities.Tbl_Sexe
                        Select courss




            Try

                ddl_sexe.DataTextField = "Sexe"
                ddl_sexe.DataValueField = "ID_Sexe"
                ddl_sexe.DataSource = cours.ToList
                ddl_sexe.DataBind()
                If _refresh Then
                    ddl_sexe.DataBind()
                End If
            Catch ex As Exception

            End Try

            ddl_sexe.Items.Insert(0, New ListItem("Sélectionnez", "0"))

        End Using
    End Sub


    Private Sub Bind_Specialisation(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0
        Using entities As New EPatient_dbEntities
            Dim cours = From courss In entities.Tbl_Specialisation
                        Select courss




            Try

                chk_specialisations.DataTextField = "Description"
                chk_specialisations.DataValueField = "ID_Specialisation"
                chk_specialisations.DataSource = cours.ToList
                chk_specialisations.DataBind()
                If _refresh Then
                    chk_specialisations.DataBind()
                End If
            Catch ex As Exception

            End Try



        End Using
    End Sub

    Private Sub Bind_Groupe(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0


        ddl_groupe_sanguin.Items.Insert(0, New ListItem("Sélectionnez", "0"))


    End Sub
    Private Sub Load_Specialisations(ByVal code_medecin As Long)

        Try




            Dim fonctions = From func In Cls_Specialisation.ListeSpecialisationParMedecin(code_medecin)
                            Select func



            rlv_part.DataSource = fonctions.ToList
            rlv_part.DataBind()






        Catch ex As Exception

        End Try
    End Sub

    Protected Sub chk_medecin_CheckedChanged(sender As Object, e As EventArgs)
        If chk_medecin.Checked Then
            pnel_specialisation.Visible = True


        Else
            pnel_specialisation.Visible = False


        End If

    End Sub




    Protected Sub SaveSpecialisation_Click(sender As Object, e As EventArgs) Handles btnew.Click
        If Request.QueryString("ID_Individu") IsNot Nothing AndAlso IsNumeric(Request.QueryString("ID_Individu")) Then
            Dim id_chauffeur As Long
            id_chauffeur = Request.QueryString("ID_Individu")


            Try
                Using db As New EPatient_dbEntities




                    db.SaveChanges()
                End Using
            Catch

            End Try
        Else
            Using db As New EPatient_dbEntities




                Dim id_medecin As Long = 0

                Dim identification As String = txt_nif.Value
                Dim estMedecin As Boolean = False
                If chk_medecin.Checked Then
                    estMedecin = True
                End If
                Dim nom As String = txt_nom.Text

                Dim prenom As String = txt_prenom.Text
                Dim addresse As String = txt_addresse.Text
                Dim groupeSanguin As String = ddl_groupe_sanguin.SelectedValue
                Dim dateNaissance As String = single_cal1.Value
                Dim idSexe As Long = CLng(ddl_sexe.Text)
                id_medecin = Cls_Individu.AjouterIndividu(identification, estMedecin, nom, prenom, groupeSanguin, dateNaissance, idSexe, addresse)

                If chk_medecin.Checked Then
                    Cls_Specialisation.SupprimerSpecialisationMedecin(id_medecin)
                    For Each oItem As ListItem In chk_specialisations.Items
                        If oItem.Selected Then
                            Cls_Specialisation.AjouterSpecialisationMedecin(id_medecin, oItem.Value)
                        End If

                    Next
                    Load_Specialisations(id_medecin)
                End If




            End Using
        End If


        ' Response.Redirect("Liste_chauffeurs")



    End Sub


    Protected Sub RadBtn_Cancel_Click(sender As Object, e As EventArgs) Handles RadBtn_Cancel.Click
        Response.Redirect("ListeIndividu")
    End Sub
    Protected Sub RadBtn_Save_Click(sender As Object, e As EventArgs) Handles RadBtn_Save.Click
        If Request.QueryString("ID_Individu") IsNot Nothing AndAlso IsNumeric(Request.QueryString("ID_Individu")) Then
            Dim id_individu As Long
            id_individu = Request.QueryString("ID_Individu")


            Try
                Using db As New EPatient_dbEntities



                    Dim identification As String = txt_nif.Value
                    Dim estMedecin As Boolean = False
                    If chk_medecin.Checked Then
                        estMedecin = True
                    End If
                    Dim nom As String = txt_nom.Text

                    Dim prenom As String = txt_prenom.Text
                    Dim addresse As String = txt_addresse.Text
                    Dim groupeSanguin As String = ddl_groupe_sanguin.SelectedValue
                    Dim dateNaissance As String = single_cal1.Value
                    Dim idSexe As Long = CLng(ddl_sexe.Text)
                    Cls_Individu.ModifierIndividu(id_individu, identification, estMedecin, nom, prenom, groupeSanguin, dateNaissance, idSexe, addresse)


                    If chk_medecin.Checked Then
                        Cls_Specialisation.SupprimerSpecialisationMedecin(id_individu)
                        For Each oItem As ListItem In chk_specialisations.Items
                            If oItem.Selected Then
                                Cls_Specialisation.AjouterSpecialisationMedecin(id_individu, oItem.Value)
                                db.SaveChanges()
                            End If

                        Next
                        Load_Specialisations(id_individu)
                    End If



                    db.SaveChanges()
                End Using
            Catch

            End Try
        Else
            Using db As New EPatient_dbEntities




                Dim id_medecin As Long = 0
                Dim code_acces As String = ""
                Dim identification As String = txt_nif.Value
                Dim estMedecin As Boolean = False
                If chk_medecin.Checked Then
                    estMedecin = True
                Else
                    code_acces = Cls_Individu.rAndom(15)


                    If (Cls_Individu.Existe(code_acces)) Then
                        code_acces = Cls_Individu.rAndom(16)
                    End If
                End If
                Dim nom As String = txt_nom.Text

                Dim prenom As String = txt_prenom.Text
                Dim addresse As String = txt_addresse.Text
                Dim groupeSanguin As String = ddl_groupe_sanguin.SelectedValue
                Dim dateNaissance As String = single_cal1.Value
                Dim idSexe As Long = CLng(ddl_sexe.Text)
                If chk_medecin.Checked Then
                    id_medecin = Cls_Individu.AjouterIndividu(identification, estMedecin, nom, prenom, groupeSanguin, dateNaissance, idSexe, addresse)

                Else
                    Cls_Individu.AjouterIndividu(identification, estMedecin, nom, prenom, groupeSanguin, dateNaissance, idSexe, addresse, code_acces)

                End If

                If chk_medecin.Checked Then
                    Cls_Specialisation.SupprimerSpecialisationMedecin(id_medecin)
                    For Each oItem As ListItem In chk_specialisations.Items
                        If oItem.Selected Then
                            Cls_Specialisation.AjouterSpecialisationMedecin(id_medecin, oItem.Value)
                        End If

                    Next
                    Load_Specialisations(id_medecin)
                End If




            End Using
        End If


        ' Response.Redirect("Liste_chauffeurs")

        Response.Redirect("ListeIndividu")

    End Sub

    Private Sub LoadInformationsIndividu()
        Dim id_individu As Long

        If Request.QueryString("ID_Individu") IsNot Nothing AndAlso IsNumeric(Request.QueryString("ID_Individu")) Then
            id_individu = Request.QueryString("ID_Individu")
            Using db As New EPatient_dbEntities

                Dim Individu = (From s In db.Tbl_Individu.Where(Function(s) s.ID_Individu = id_individu)
                                Select s).FirstOrDefault






                single_cal1.Value = Individu.DateNaissance.Value
                txt_addresse.Text = Individu.addresse
                txt_nif.Value = Individu.Identification
                txt_nom.Text = Individu.Nom
                txt_prenom.Text = Individu.Prenom
                ' RadDatePicker1.selecteddate = Individu.DateNaissance


                ddl_sexe.Text = Individu.ID_Sexe
                ddl_groupe_sanguin.SelectedValue = Individu.GroupeSanguin
                chk_medecin.Checked = Individu.isMedecin
                Load_Specialisations(id_individu)
                Dim specialisationMedecin As New List(Of Tbl_SpecialisationMedecin)
                specialisationMedecin = Cls_Specialisation.ListeSpecialisationMedecin(id_individu)
                If Individu.isMedecin = True Then
                    pnel_specialisation.Visible = True
                End If
                For Each _p As Tbl_SpecialisationMedecin In specialisationMedecin
                    For Each oItemf In chk_specialisations.Items
                        If oItemf.Value = _p.CodeSpecialisation Then
                            oItemf.Selected = True
                            '' oItem.Enabled = False

                        End If



                    Next


                Next


            End Using
        End If
    End Sub

End Class