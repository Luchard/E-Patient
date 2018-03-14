Imports EPatient

Public Class ListeIndividu
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If (Session("Adminsession") = Nothing) Then
                Response.Redirect("~/login")
            End If
            Load_Individu()
        End If

    End Sub


    Private Sub Load_Individu()

        Try

            Dim fonctions = From func In Cls_Individu.ListerIndividu
                            Select func



            rlv_part.DataSource = fonctions.ToList
            rlv_part.DataBind()






        Catch ex As Exception

        End Try
    End Sub



    Protected Sub btns_new_Click(sender As Object, e As EventArgs) Handles btnew.Click
        Response.Redirect("AddIndividu")
    End Sub
End Class