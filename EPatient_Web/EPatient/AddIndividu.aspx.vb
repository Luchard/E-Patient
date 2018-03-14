Imports EPatient


Public Class AddIndividu
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Bind_Sexe()
            Bind_Groupe()

            Bind_Ville()

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


    Private Sub Bind_Ville(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0
        Using entities As New EPatient_dbEntities
            Dim cours = From courss In entities.Tbl_Ville
                        Select courss




            Try

                ddl_ville.DataTextField = "Libelle"
                ddl_ville.DataValueField = "ID_Ville"
                ddl_ville.DataSource = cours.ToList
                ddl_ville.DataBind()
                If _refresh Then
                    ddl_ville.DataBind()
                End If
            Catch ex As Exception

            End Try

            ddl_ville.Items.Insert(0, New ListItem("Sélectionnez", "0"))

        End Using
    End Sub



    Private Sub Bind_Groupe(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0


        ddl_groupe_sanguin.Items.Insert(0, New ListItem("Sélectionnez", "0"))


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

                    Dim nom As String = txt_nom.Text

                    Dim prenom As String = txt_prenom.Text
                    Dim addresse As String = txt_addresse.Text
                    Dim groupeSanguin As String = ddl_groupe_sanguin.SelectedValue
                    Dim dateNaissance As String = single_cal1.Value
                    Dim idSexe As Long = CLng(ddl_sexe.Text)
                    Cls_Individu.ModifierIndividu(id_individu, identification, estMedecin, nom, prenom, groupeSanguin, dateNaissance, idSexe, addresse)






                    db.SaveChanges()
                End Using
            Catch

            End Try
        Else
            Using db As New EPatient_dbEntities




                Dim id_medecin As Long = 0

                Dim identification As String = txt_nif.Value
                Dim estMedecin As Boolean = False
                Dim prenom As String = txt_prenom.Text
                Dim nom As String = txt_nom.Text
                Dim codeAccess As String = Cls_Individu.rAndom(15)


                If (Cls_Individu.Existe(codeAccess)) Then
                    codeAccess = Cls_Individu.rAndom(16)
                End If

                Dim lieuNaissance As String = txt_lieu_naissance.Text
                Dim villeNaissance As Long = CLng(ddl_ville.Text)
                Dim nomPere As String = txt_nom_pere.Text
                Dim nomMere As String = txt_nom_mere.Text
                Dim addresse As String = txt_addresse.Text
                Dim groupeSanguin As String = ddl_groupe_sanguin.SelectedValue
                Dim dateNaissance As String = single_cal1.Value
                Dim idSexe As Long = CLng(ddl_sexe.Text)
                id_medecin = Cls_Individu.AjouterIndividu(identification, estMedecin, nom, prenom, groupeSanguin, dateNaissance, idSexe, addresse, lieuNaissance, villeNaissance, nomMere, nomPere, codeAccess)





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
                txt_lieu_naissance.Text = Individu.LieuNaissance

                txt_nif.Value = Individu.Identification
                txt_nom.Text = Individu.Nom
                txt_prenom.Text = Individu.Prenom
                txt_nom_mere.Text = Individu.NomMere
                txt_nom_pere.Text = Individu.NomPere
                ddl_ville.Text = Individu.VilleNaissance

                ' RadDatePicker1.selecteddate = Individu.DateNaissance


                ddl_sexe.Text = Individu.ID_Sexe
                ddl_groupe_sanguin.SelectedValue = Individu.GroupeSanguin





            End Using
        End If
    End Sub

End Class