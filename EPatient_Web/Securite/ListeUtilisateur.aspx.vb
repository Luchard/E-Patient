Imports System
Imports EPatient
Public Class ListeUtilisateur
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Bind_Privilege()
            Bind_Individu()
            Bind_StatutCompte()
            Load_user()
            BindPatient()

        End If


    End Sub


    Private Sub BindPatient()
        Dim _ret As Long = 0
        Using entities As New EPatient_dbEntities
            Dim cours = From courss In Cls_Individu.ListerPatient
                        Select courss




            Try


                listePatient.DataSource = cours.ToList
                listePatient.DataTextField = "nom_complet"
                listePatient.DataValueField = "ID_Individu"
                listePatient.DataBind()

                ' If _refresh Then
                '   RadListBoxSource.DataBind()
                ' End If




            Catch ex As Exception

            End Try

        End Using


    End Sub
    Private Sub Load_user()
        '' Load utilisateurs
        Try
            Using entities As New EPatient.EPatient_dbEntities
                Dim fonctions = From func In Cls_Utilisateur.AllUtilisateur
                                Select func

                rlv_part.DataSource = fonctions.ToList
                rlv_part.DataBind()

            End Using


        Catch ex As Exception

        End Try
    End Sub

    Private Sub Bind_Privilege(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0
        Using entities As New EPatient_dbEntities
            Dim cours = From courss In entities.Tbl_Privilege
                        Select courss




            Try
                ' rcmb_periode.DataSource = periode.FirstOrDefault
                ddl_privilege.DataTextField = "Libelle"
                ddl_privilege.DataValueField = "ID_Privilege"
                ddl_privilege.DataSource = cours.ToList
                ddl_privilege.DataBind()
                If _refresh Then
                    ddl_privilege.DataBind()
                End If
            Catch ex As Exception

            End Try

            ddl_privilege.Items.Insert(0, New ListItem("Sélectionnez", "0"))

        End Using


    End Sub



    Private Sub Bind_Individu(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0
        Using entities As New EPatient_dbEntities
            Dim cours = From courss In entities.sp_ListeIndividu
                        Select courss




            Try
                ' rcmb_periode.DataSource = periode.FirstOrDefault
                ddl_individu.DataTextField = "nom_complet"
                ddl_individu.DataValueField = "ID_Individu"
                ddl_individu.DataSource = cours.ToList
                ddl_individu.DataBind()
                If _refresh Then
                    ddl_individu.DataBind()
                End If
            Catch ex As Exception

            End Try

            ddl_individu.Items.Insert(0, New ListItem("Sélectionnez", "0"))

        End Using


    End Sub


    Private Sub Bind_StatutCompte(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0
        Using entities As New EPatient_dbEntities
            Dim cours = From courss In entities.Tbl_StatutCompte
                        Select courss




            Try
                ' rcmb_periode.DataSource = periode.FirstOrDefault
                ddl_statutCompte.DataTextField = "Libelle"
                ddl_statutCompte.DataValueField = "ID_StatutCompte"
                ddl_statutCompte.DataSource = cours.ToList
                ddl_statutCompte.DataBind()
                If _refresh Then
                    ddl_statutCompte.DataBind()
                End If
            Catch ex As Exception

            End Try

            ddl_statutCompte.Items.Insert(0, New ListItem("Sélectionnez", "0"))

        End Using


    End Sub

    Protected Sub RadBtn_Cancel_Click(sender As Object, e As EventArgs) Handles RadBtn_Cancel.Click
        Response.Redirect("Liste_chauffeurs")
    End Sub
    Protected Sub RadBtn_Saveit_Click(sender As Object, e As EventArgs) Handles RadBtn_Save.Click
        Dim objcrypt As New Cls_encrypteway



        Using db As New EPatient_dbEntities


            Dim pers = (From doc In db.Tbl_Utilisateur
                        Select doc).ToList
            Dim find_user As Integer
            Dim fin_individu As Integer = 0
            Dim idIndividu As Long = CLng(ddl_individu.Text)

            For Each per As Tbl_Utilisateur In pers
                Dim use As String
                Dim user_pass As String
                use = per.username
                user_pass = utilisateur.Text

                If use = user_pass Then

                    find_user = 1

                End If
            Next
            For Each per As Tbl_Utilisateur In pers
                If per.ID_Individu = idIndividu Then
                    fin_individu = 1
                End If
            Next


            If find_user = 1 Then
                ' lbl_erreur.Text = "Ce user existe déjà dans la base"
            Else
                If fin_individu = 1 Then

                Else
                    Dim personne As New Tbl_Utilisateur
                    Cls_encrypteway.Encrypttoi(mot_de_passe.Text)
                    personne.ID_Individu = CLng(ddl_individu.Text)
                    personne.ID_Privilege = CLng(ddl_privilege.Text)
                    personne.ID_StatutCompte = CLng(ddl_statutCompte.Text)
                    personne.password = Cls_encrypteway.Encrypttoi(mot_de_passe.Text)
                    personne.username = utilisateur.Text

                    db.Tbl_Utilisateur.Add(personne)
                    db.SaveChanges()


                    For Each elem As Object In listePatient.Items
                        ''Placer ici le code de sauvegarde
                        Dim idPatient As Long = CLng(elem.Value)


                        Try
                            Dim autorisation As New Tbl_Autorisation_Patient
                            autorisation.ID_Individu = idPatient
                            autorisation.ID_Utilisateur = personne.ID_Utilisateur
                            db.Tbl_Autorisation_Patient.Add(autorisation)
                            db.SaveChanges()


                        Catch ex As Exception

                        End Try

                    Next
                End If




            End If




        End Using







    End Sub

    Protected Sub ddl_individu_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim individu As New Tbl_Individu
        Dim id As Long = CLng(ddl_individu.Text)
        individu = Cls_Individu.ReadIndividu(id)

        If individu.isMedecin Then
            pnel_patient.Visible = True
        Else
            pnel_patient.Visible = False
        End If
    End Sub
End Class