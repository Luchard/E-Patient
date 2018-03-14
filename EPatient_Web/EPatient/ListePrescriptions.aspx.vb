Imports EPatient

Public Class ListePrescriptions
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If (Session("Adminsession") = Nothing) Then
                Response.Redirect("~/login")
            End If

            Load_Prescriptions()
        End If


    End Sub

    Private Sub Load_Prescriptions()

        Try
            Dim id_utilisateur As Long = Session("id_utilisateur")
            Dim id_privilege As Long = Session("id_role")

            Using entities As New EPatient_dbEntities


                Dim administrateur = From func In Cls_Prescription.ListePrescriptionPatientMedecin
                                     Select func

                Dim patientMedecin = From func In Cls_Prescription.ListePrescriptionPatientMedecin(8)
                                     Select func

                Dim medecinAutorise = From func In Cls_Prescription.ListePrescriptionPatientAutorise(id_utilisateur)
                                      Select func

                Dim listePrescription As IList = medecinAutorise.ToList
                For Each item As IList In patientMedecin
                    listePrescription.Add(item)
                Next


                If id_privilege = 1 Then
                    rlv_part.DataSource = administrateur.ToList
                Else
                    rlv_part.DataSource = medecinAutorise.ToList
                End If


                rlv_part.DataBind()



            End Using


        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btns_new_Click(sender As Object, e As EventArgs) Handles btn_new.Click
        Response.Redirect("EditerPrescription")
    End Sub
End Class