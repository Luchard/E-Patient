
Partial Class production_utilisateur
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Load_fonction()
            Bind_mairie()
            Bind_role()
        End If




    End Sub



    Private Sub Load_fonction()

        Try
            Using entities As New SGCT_dbEntities
                Dim fonctions = From func In entities.users_SGCT
                            Select func

                rlv_part.DataSource = fonctions.ToList
                rlv_part.DataBind()

            End Using


        Catch ex As Exception

        End Try
    End Sub


    Private Sub Bind_mairie(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0
        Using entities As New SGCT_dbEntities
            Dim cours = From courss In entities.tbl_mairie
                        Select courss




            Try
                ' rcmb_periode.DataSource = periode.FirstOrDefault
                Dropdownlist4.DataTextField = "nom_mairie"
                Dropdownlist4.DataValueField = "Id_mairie"
                Dropdownlist4.DataSource = cours.ToList
                Dropdownlist4.DataBind()
                If _refresh Then
                    Dropdownlist4.DataBind()
                End If
            Catch ex As Exception

            End Try

            Dropdownlist4.Items.Insert(0, New ListItem("Sélectionnez", "0"))

        End Using


    End Sub

    Private Sub Bind_role(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0
        Using entities As New SGCT_dbEntities
            Dim cours = From courss In entities.tbl_role
                        Select courss




            Try
                ' rcmb_periode.DataSource = periode.FirstOrDefault
                Dropdownlist5.DataTextField = "role"
                Dropdownlist5.DataValueField = "ID_role"
                Dropdownlist5.DataSource = cours.ToList
                Dropdownlist5.DataBind()
                If _refresh Then
                    Dropdownlist5.DataBind()
                End If
            Catch ex As Exception

            End Try

            Dropdownlist5.Items.Insert(0, New ListItem("Sélectionnez", "0"))

        End Using


    End Sub



    Protected Sub lv_all_pieges_ItemCanceling(sender As Object, e As ListViewDeleteEventArgs) Handles rlv_part.ItemDeleting
        Dim entities As New SGCT_dbEntities

        Dim dataItem As ListViewDataItem = rlv_part.Items(e.ItemIndex)

        Dim id As Long = CType(dataItem.FindControl("TextBox2"), TextBox).Text
        Dim fonction As tbl_contribuable = entities.tbl_contribuable.Find(id)

        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue = "Yes" Then

            entities.tbl_contribuable.Remove(fonction)

            entities.SaveChanges()
            'Else
            '    RadAjaxManager1.ResponseScripts.Add("CloseAndRefresh_MainPage();")
        End If
        Load_fonction()
    End Sub


    Protected Sub Unnamed_Click(sender As Object, e As ImageClickEventArgs)

        Dim dataItem As ListViewDataItem = rlv_part.Items



        Dim id As Long = CInt(CType(rlv_part.FindControl("TextBox1"), TextBox).Text)



        Using entities As New SGCT_dbEntities


            '' Dim piege As Tbl_Note = entities.Tbl_Note.Find(id)
            'Dim _etudiant As Tbl_secteur_activite = entities.Tbl_Etudiant.Find(id)
            'Dim confirmValue As String = Request.Form("confirm_value")
            'If confirmValue = "Yes" Then

            '    entities.Tbl_Etudiant.Remove(_etudiant)

            '    entities.SaveChanges()
            '    'Else
            '    '    RadAjaxManager1.ResponseScripts.Add("CloseAndRefresh_MainPage();")
            'End If
        End Using

    End Sub


    Protected Sub RadBtn_Saveit_Click(sender As Object, e As EventArgs) Handles RadBtn_Saveit.Click
        Dim objcrypt As New encrypteway



        Using db As New SGCT_dbEntities


            Dim pers = (From doc In db.users_SGCT
                       Select doc).ToList
            Dim find_user As Integer

            For Each per As users_SGCT In pers
                Dim use As String
                Dim user_pass As String
                use = per.username
                user_pass = utilisateur.Text

                If use = user_pass Then

                    find_user = 1

                End If
            Next

            If find_user = 1 Then
                '  lbl_erreur.Text = "Ce user existe déjà dans la base"
            Else
                Dim personne As New users_SGCT
                personne.nom = name.Text

                personne.prenom = prénom.Text
                personne.adresse = "dont know"
                personne.Telephone = "dont know"

                objcrypt.Encrypttoi(password.Text)
                personne.password = objcrypt.Encrypttoi(password.Text)
                personne.username = utilisateur.Text
                '                personne.occupation = 1
                personne.IsActif = 1
                db.users_SGCT.Add(personne)
                db.SaveChanges()
            End If



        End Using







    End Sub
End Class

