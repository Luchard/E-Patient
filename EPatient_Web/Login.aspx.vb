Imports System.Data.SqlClient
Imports EPatient
Public Class Login1
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button_login_Click(sender As Object, e As EventArgs) Handles Button_login.Click

        con = New SqlConnection("Data Source=localhost;Initial Catalog=EPatient_db;Persist Security info=True;User id=sa;Password=solutions;MultipleActiveResultSets=True;")
        con.Open()

        cmd = New SqlCommand("SELECT password FROM Tbl_Utilisateur WHERE username ='" + TextBoxusername.Text + "' ", con)
        dr = cmd.ExecuteReader

        Dim username_1 As String
        username_1 = TextBoxusername.Text

        If (dr.Read) Then
            If (dr(0).ToString = Cls_encrypteway.Encrypttoi(TextBoxpassword.Text)) Then
                Session("Adminsession") = TextBoxusername.Text
                Using entities As New EPatient_dbEntities

                    Dim user = (From func In entities.Tbl_Utilisateur.Where(Function(s) s.username = username_1)
                                Select func).FirstOrDefault


                    Dim individu = Cls_Utilisateur.IndiviById(user.ID_Individu)
                    '  Session("Adminsession_idmairie") = user.id_mairie

                    Session("username") = user.username
                    Session("date_connexion") = DateTime.Now
                    Session("Adminsession_prenom") = individu.Prenom
                    Session("id_utilisateur") = user.ID_Utilisateur
                    Session("idIndividu") = individu.ID_Individu
                    Session("id_role") = user.ID_Privilege
                    Session("id_statut") = user.ID_StatutCompte
                    Session("Adminsession_non") = individu.Nom


                    'Session("Adminsession_prenom") = user.prenom

                End Using
                Response.Write("Password is Correct")
                Response.Redirect("Accueil/Index")
            Else

                '    Label2.Visible = True
                '    Label2.Text = "mot de passe incorrect"

            End If

        Else

            ' Label2.Visible = True
            ' Label2.Text = "utilisateur introuvable"






        End If


        'If (dr.Read = False) Then
        '    Response.Redirect("production/Liste_secteur_activite")
        'End If





    End Sub
End Class