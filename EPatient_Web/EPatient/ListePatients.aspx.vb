Imports EPatient

Public Class ListePatients
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If (Session("Adminsession") = Nothing) Then
                Response.Redirect("~/login")
            End If
            Load_Medecin()
        End If
    End Sub



    Private Sub Load_Medecin()

        Try


            Dim id_patient As Long = Session("idIndividu")


            Dim fonctions = From func In Cls_Individu.ListerPatient
                            Select func



            rlv_part.DataSource = fonctions.ToList
            rlv_part.DataBind()






        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btns_new_Click(sender As Object, e As EventArgs) Handles btnew.Click
        Response.Redirect("EditerIndividu")
    End Sub

End Class
