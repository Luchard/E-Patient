Imports EPatient

Public Class ListeMedicaments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If (Session("Adminsession") = Nothing) Then
                Response.Redirect("~/login")
            End If
            Load_Medicaments()
        End If


    End Sub



    Private Sub Load_Medicaments()

        Try




            Dim fonctions = From func In EPatient.Cls_Medicament.AllMedicament
                            Select func



            rlv_part.DataSource = fonctions.ToList
            rlv_part.DataBind()






        Catch ex As Exception

        End Try
    End Sub
End Class