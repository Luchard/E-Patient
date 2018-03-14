Imports EPatient
Public Class EditerPrescription
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Bind_Medecin()
            Bind_Patient()
            Bind_Medicament()
            Bind_TestLaboratoire()
            LoadInformationsPrescription()
            Load_MedicamentsPrescrits()

        End If


    End Sub


    Private Sub Bind_Patient(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0
        Using entities As New EPatient_dbEntities
            Dim cours = From courss In entities.sp_individu.Where(Function(s) s.isMedecin = 0)
                        Select courss




            Try

                ddl_patient.DataTextField = "nom_complet_individu"
                ddl_patient.DataValueField = "ID_Individu"
                ddl_patient.DataSource = cours.ToList
                ddl_patient.DataBind()
                If _refresh Then
                    ddl_patient.DataBind()
                End If
            Catch ex As Exception

            End Try

            ddl_patient.Items.Insert(0, New ListItem("Sélectionnez", "0"))

        End Using
    End Sub
    Private Sub LoadInformationsPrescription()
        Dim id_prescription As Long




        If Request.QueryString("ID_Prescription") IsNot Nothing AndAlso IsNumeric(Request.QueryString("ID_Prescription")) Then
            id_prescription = Request.QueryString("ID_Prescription")
            Using db As New EPatient_dbEntities

                Dim prescription = (From s In db.Tbl_Prescription.Where(Function(s) s.ID_Prescription = id_prescription)
                                    Select s).FirstOrDefault


                form_id_prescription.Value = id_prescription



                single_cal1.Value = prescription.DateAusculte.Value.ToString("yyyy-MM-dd")

                ddl_medecin.SelectedValue = prescription.CodeMedecin
                ddl_patient.SelectedValue = prescription.CodePatient
                ddl_medecin.Enabled = False
                ddl_medecin.CssClass = "form-control col-md-7 col-xs-12"
                ddl_patient.Enabled = False
                ddl_patient.CssClass = "form-control col-md-7 col-xs-12"
                txt_diagnostique.Text = prescription.DescriptionDiagnostique
                txt_symptome.Text = prescription.DescriptionSymptome
                txt_poids.Value = prescription.PoidsPatient
                txt_taille.Text = prescription.TaillePatient

                code.Text = prescription.Tbl_Individu.codeAcces
                code.Enabled = False
                code.CssClass = "form-control col-md-7 col-xs-12"



            End Using
        End If
    End Sub


    Private Sub Bind_Medicament(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0
        Using entities As New EPatient_dbEntities

            Dim cours = From courss In entities.Tbl_Medicament
                        Select courss




            Try

                ddl_medicament.DataTextField = "CodeInternational"
                ddl_medicament.DataValueField = "ID_Medicament"
                ddl_medicament.DataSource = cours.ToList
                ddl_medicament.DataBind()
                If _refresh Then
                    ddl_medicament.DataBind()
                End If

            Catch ex As Exception

            End Try

            ddl_medicament.Items.Insert(0, New ListItem("Sélectionnez", "0"))

        End Using
    End Sub


    Private Sub Bind_TestLaboratoire(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0
        Using entities As New EPatient_dbEntities

            Dim cours = From courss In entities.Tbl_TestLaboratoire
                        Select courss




            Try

                ddl_medicament.DataTextField = "Description"
                ddl_medicament.DataValueField = "ID_TestLaboratoire"
                ddl_medicament.DataSource = cours.ToList
                ddl_medicament.DataBind()
                If _refresh Then
                    ddl_medicament.DataBind()
                End If

            Catch ex As Exception

            End Try

            ddl_medicament.Items.Insert(0, New ListItem("Sélectionnez", "0"))

        End Using
    End Sub


    Private Sub Load_MedicamentsPrescrits()

        Try

            If form_id_prescription.Value = 0 Then
                Return
            End If

            Dim entity As New EPatient_dbEntities


            Dim medicPresc = From mp As Tbl_MedicamentPrescrit In entity.Tbl_MedicamentPrescrit
                             Where mp.CodePrescription = CLng(form_id_prescription.Value)
                             Select mp




            rlv_part.DataSource = medicPresc.ToList
            rlv_part.DataBind()


        Catch ex As Exception

        End Try
    End Sub
    Private Sub Bind_Medecin(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0
        Using entities As New EPatient_dbEntities
            Dim cours = From courss In entities.sp_individu.Where(Function(s) s.isMedecin = True)
                        Select courss




            Try

                ddl_medecin.DataTextField = "nom_complet_individu"
                ddl_medecin.DataValueField = "ID_Individu"
                ddl_medecin.DataSource = cours.ToList
                ddl_medecin.DataBind()
                If _refresh Then
                    ddl_medecin.DataBind()
                End If
            Catch ex As Exception

            End Try

            ddl_medecin.Items.Insert(0, New ListItem("Sélectionnez", "0"))

        End Using
    End Sub

    Private Sub btnew_Click(sender As Object, e As EventArgs) Handles btnew.Click
        Dim entity As New EPatient_dbEntities

        Dim prescription As Tbl_Prescription = entity.Tbl_Prescription.Find(CLng(form_id_prescription.Value))
        If prescription Is Nothing Then
            prescription = New Tbl_Prescription()
            entity.Tbl_Prescription.Add(prescription)
        End If

        prescription.CodePatient = ddl_patient.SelectedValue
        prescription.DateAusculte = single_cal1.Value
        prescription.CodeMedecin = ddl_medecin.SelectedValue
        prescription.DescriptionDiagnostique = txt_diagnostique.Text
        prescription.DescriptionSymptome = txt_symptome.Text
        prescription.PoidsPatient = txt_poids.Value
        prescription.TaillePatient = txt_taille.Text

        entity.SaveChanges()
        form_id_prescription.Value = prescription.ID_Prescription



        Dim medPred As Tbl_MedicamentPrescrit
        Dim meds = From mp As Tbl_MedicamentPrescrit In entity.Tbl_MedicamentPrescrit
                   Where mp.CodeMedicament = ddl_medicament.SelectedValue _
                   And mp.CodePrescription = prescription.ID_Prescription
                   Select mp

        If meds.Count > 0 Then
            medPred = meds.FirstOrDefault
        Else
            medPred = New Tbl_MedicamentPrescrit
            medPred.CodePrescription = prescription.ID_Prescription
            entity.Tbl_MedicamentPrescrit.Add(medPred)
        End If

        medPred.CodeMedicament = ddl_medicament.SelectedValue
        medPred.Dosage = txt_dossage.Text
        medPred.EffeSecondaire = txt_effets_sec.Text

        entity.SaveChanges()

        txt_effets_sec.Text = ""
        txt_dossage.Text = ""

        Load_MedicamentsPrescrits()

    End Sub

    Protected Sub RadBtn_Cancel_Click(sender As Object, e As EventArgs) Handles RadBtn_Cancel.Click
        Response.Redirect("ListePrescriptions")
    End Sub

End Class