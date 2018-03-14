Imports System.IO.Ports
Imports System.Net.Mail
'Imports System.Web.Mail

Imports System.Net
Imports CrystalDecisions.CrystalReports.Engine
Imports ReportLayer
Imports System.IO


Partial Class production_valider_permis_construire
    Inherits System.Web.UI.Page
    Dim portserie As New System.IO.Ports.SerialPort
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            With portserie
                .PortName = "COM1"
                .BaudRate = 9600
                .Parity = Parity.None
                .StopBits = StopBits.One
                .DataBits = 8
                .Handshake = Handshake.RequestToSend
                .DtrEnable = True
                .RtsEnable = True
                .NewLine = vbCrLf
            End With
            Bind_documents()
            Load_document()
        End If




    End Sub



    Protected Sub Btn_ListCrediteurs_Click()



        Try
            Dim crReportDocument As New ReportDocument
            Dim rHelper As ReportLayer
            Dim dtbase As RALDatabase
            dtbase.DataBaseName = "SGCT_db"
            dtbase.ServerName = "localhost"
            dtbase.UserId = "sa"
            dtbase.Pass = ("solutions")
            Session("CurrentReportRAL") = Nothing
            rHelper = New ReportLayer(dtbase, Request.PhysicalApplicationPath & "Rapport\")


            crReportDocument = rHelper.LoadReport("CrystalReport.rpt")
            ' crReportDocument.SetParameterValue("@ID_Code_anne", 1)
            'crReportDocument.SetParameterValue("@ID_ecole", TypeSafeConversion.NullSafeLong(id_ecole))
            '  crReportDocument.SetParameterValue("@ID", 1, "Header.rpt")
            'crReportDocument.SetParameterValue("@ID", 1, "Header.rpt")

            Session("CurrentReportRAL") = crReportDocument
            Dim stream As New BinaryReader(crReportDocument.ExportToStream(CrystalDecisions.[Shared].ExportFormatType.WordForWindows))
            '' m_stream = m_report.ExportToStream(CrystalDecisions.Shared.ExportFormatType.WordForWindows)
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "application/ms-word"

            Response.AddHeader("content-disposition", Convert.ToString("attachment; filename=") & "Liste_quartier.doc")
            Response.AddHeader("content-length", stream.BaseStream.Length.ToString())
            Response.BinaryWrite(stream.ReadBytes(Convert.ToInt32(stream.BaseStream.Length)))
            Response.Flush()
            Response.Close()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType, "ExpPDF_Key", "alert('Erreur : " & ex.Message.Replace("'", "\'") & "');", True)
        End Try


    End Sub


    Private Sub Load_document()
        Dim id_permis As Long
        id_permis = Request.QueryString("ID_permis")
        Try
            Using entities As New SGCT_dbEntities
                rlv_document.DataSource = entities.sp_liste_document_permis.Where(Function(s) s.id_permis = id_permis)
                rlv_document.DataBind()
                ' rlv_document.Rebind()
            End Using

        Catch ex As Exception

        End Try
    End Sub

    Private Sub Bind_documents(Optional ByVal _refresh As Boolean = True)
        Dim id_permis As Long
        id_permis = Request.QueryString("ID_permis")
        Using entities As New SGCT_dbEntities
            Dim documents = (From courss In entities.sp_informations_permis.Where(Function(s) s.id_permis = id_permis)
                        Select courss).FirstOrDefault
            lbl_travaux.Text = documents.type_travaux
            Label1.Text = documents.nom_complet
            lbl_surface.Text = documents.surface
            lbl_adresse.Text = documents.adresse

            Dim id_mairie As Long
            id_mairie = Session("Adminsession_idmairie")

            Dim tarif = (From _tarif In entities.tbl_Tarif.Where(Function(s) s.ID_service = 1 And s.ID_mairie = id_mairie) Select _tarif).FirstOrDefault

            txt_montant.Text = CLng(0)
            txt_montant.Text = CLng(txt_montant.Text) + CDbl(documents.surface * tarif.Taxe_principale) + CDbl(tarif.droit_fixe) + CDbl(tarif.droit_numerotation) + CDbl(tarif.droit_special)

            txt_montant.Text = CDbl(txt_montant.Text) + CDbl((documents.surface * tarif.Taxe_principale) * (tarif.taxe / 100))
            'Try

            '    Checkboxlist_documents.DataSource = documents.ToList

            '    Checkboxlist_documents.DataTextField = "description"
            '    Checkboxlist_documents.DataValueField = "id_document"

            '    Checkboxlist_documents.DataBind()

            '    If _refresh Then
            '        Checkboxlist_documents.DataBind()
            '    End If
            'Catch ex As Exception

            'End Try
        End Using
    End Sub


    Protected Sub RadBtn_Saveit_Click(sender As Object, e As EventArgs) Handles RadBtn_Saveit.Click

        Dim id_permis As Long
        id_permis = Request.QueryString("ID_permis")
        Dim id_contribualbe As Long
        Dim number_cell As String
        Using db As New SGCT_dbEntities

            Dim permis = (From s In db.tbl_permis_construire.Where(Function(s) s.id_permis_construire = id_permis)
                         Select s).FirstOrDefault

            permis.id_statut = 2
            id_contribualbe = permis.id_contribuable

            Dim contribuable = (From s In db.tbl_contribuable.Where(Function(s) s.ID_Personne = id_contribualbe)
                        Select s).FirstOrDefault
            permis.description = txt_description.Text
            permis.date_debut = DateTime.Now
            permis.date_fin = permis.date_debut.Value.AddYears(2)
            permis.montant_permis = txt_montant.Text
            permis.date_visite = date_visite.SelectedDate
            db.SaveChanges()

            number_cell = contribuable.telephone
        End Using


        With portserie
            .PortName = "COM1"
            .BaudRate = 9600
            .Parity = Parity.None
            .StopBits = StopBits.One
            .DataBits = 8
            .Handshake = Handshake.RequestToSend
            .DtrEnable = True
            .RtsEnable = True
            .NewLine = vbCrLf
        End With
        ''  Btn_ListCrediteurs_Click()

        portserie.Open()
        ''        aprés l 'ouverture du port, testons sont ouverture
        If portserie.IsOpen() Then
            'nous écrivons à notre port l'utilisation des commandes AT
            portserie.Write("AT" & vbCrLf)
            'initialisation du mode de text
            portserie.Write("AT+CMGF=1" & vbCrLf)
            'numero du message en utilisant le mode PDU
            portserie.Write("AT+CMGS=" & Chr(34) & number_cell & Chr(34) & vbCrLf)
            'envoie du message 
            portserie.Write("Votre demande de permis de construire est validee vous pouvez passer le prendre a la mairie" & Chr(26))
            'confirmation du message
            'MsgBox("Le message est parti avec succes")
            'ScriptManager.RegisterStartupScript(Me, Me.GetType, "ExpReport_Key", "alert('Message envoyé avec succès');", True)

            portserie.Close()
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType, "ExpReport_Key", "alert('Votre port nest pas valide');", True)

        End If


        ' Response.Redirect("liste_permis_delivre")



        Try
            Dim SmtpServer As New SmtpClient()
            Dim mail As New MailMessage()
            SmtpServer.Credentials = New  _
        Net.NetworkCredential("mictfdshaiti@gmail.com", "mictfdshaiti123")
            SmtpServer.Port = 587
            SmtpServer.Host = "smtp.gmail.com"
            mail = New MailMessage()
            mail.From = New MailAddress("mictfdshaiti@gmail.com")
            mail.To.Add("luchill11@yahoo.fr")
            mail.Subject = "Test Mail"
            mail.Body = "C Luchard map verifie si voye mail la mache voye yon message pou mwen siw jwen mail la"
            SmtpServer.EnableSsl = True
            SmtpServer.Send(mail)
            ScriptManager.RegisterStartupScript(Me, Me.GetType, "ExpReport_Key", "alert('Mail send');", True)

            '    MsgBox("mail send")
        Catch ex As Exception
            'MsgBox(ex.ToString)
        End Try
        Response.Redirect("liste_permis_delivre")

    End Sub







End Class
