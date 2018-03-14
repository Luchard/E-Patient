
Partial Class production_Tarification
    Inherits System.Web.UI.Page


    Private Sub Bind_secteur(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0
        Using entities As New SGCT_dbEntities
            Dim cours = From courss In entities.Tbl_secteur_activite
                        Select courss


            Bind_service()
            Bind_Type_Construction()
            txt_droit_numerotation.Text = 0.0
            txt_droit_fixe.Text = 0.0
            txt_droit_special.Text = 0.0

            txt_taxe_principale.Text = 0.0

            txt_taxe.Text = 0.0

            'Try
            '    ' rcmb_periode.DataSource = periode.FirstOrDefault
            '    rcmb_secteur.DataTextField = "Nom_secteur"
            '    rcmb_secteur.DataValueField = "ID_secteur"
            '    rcmb_secteur.DataSource = cours.ToList
            '    rcmb_secteur.DataBind()
            '    If _refresh Then
            '        rcmb_secteur.DataBind()
            '    End If
            'Catch ex As Exception

            'End Try

            'rcmb_secteur.Items.Insert(0, New ListItem("Sélectionnez", "0"))

        End Using


    End Sub

    

    Private Sub Bind_service(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0
        Dim id_mairie As Long
        id_mairie = Session("Adminsession_idmairie")
        Using entities As New SGCT_dbEntities()
            Dim periode = From period In entities.Tbl_Services Join x In entities.tbl_mairie_service On period.ID_service Equals x.id_services Where (x.id_mairie = id_mairie And period.EstTarifiable = True)
                        Select period




            Try
                ' rcmb_periode.DataSource = periode.FirstOrDefault
                rcmb_service.DataSource = periode.ToList
                rcmb_service.DataTextField = "Services"
                rcmb_service.DataValueField = "ID_service"

                rcmb_service.DataBind()
                If _refresh Then
                    rcmb_service.DataBind()
                End If
            Catch ex As Exception

            End Try

            rcmb_service.Items.Insert(0, New ListItem("Sélectionnez", "0"))

        End Using
    End Sub


    Private Sub Bind_Type_Construction(Optional ByVal _refresh As Boolean = True)
        Dim _ret As Long = 0
        Using entities As New SGCT_dbEntities()
            Dim periode = From period In entities.tbl_type_contruction
                        Select period




            Try
                ' rcmb_periode.DataSource = periode.FirstOrDefault
                rcmb_construction.DataSource = periode.ToList
                rcmb_construction.DataTextField = "type_construction"
                rcmb_construction.DataValueField = "Id_type_contruction"

                rcmb_construction.DataBind()
                If _refresh Then
                    rcmb_construction.DataBind()
                End If
            Catch ex As Exception

            End Try

            rcmb_construction.Items.Insert(0, New ListItem("Sélectionnez", "0"))

        End Using
    End Sub


  



  
  





 


    Public Function Rechercher_tarif(id As Long) As Tbl_secteur_activite
        Using db As New SGCT_dbEntities
            Dim secteur = (From s In db.Tbl_secteur_activite.Where(Function(s) s.ID_secteur = id)
                          Select s).FirstOrDefault

            Return secteur

        End Using
    End Function



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Bind_secteur()
          
          

        End If
    End Sub

    Protected Sub RadBtn_Save_Click(sender As Object, e As EventArgs) Handles RadBtn_Save.Click
        Using db As New SGCT_dbEntities
            Dim personnel As New tbl_personnel

         

            Response.Redirect("Liste_personnel_administratif")
        End Using
    End Sub


   
  

 
    Protected Sub RadBtn_Cancel_Click(sender As Object, e As EventArgs) Handles RadBtn_Cancel.Click
        Response.Redirect("Liste_contribuables")
    End Sub

   

    Protected Sub rcmb_service_SelectedIndexChanged(sender As Object, e As EventArgs)
        If (rcmb_service.SelectedValue = 1) Then
            panel_permis_construire.Visible = True
            panel_autre.Visible = False
        Else
            panel_permis_construire.Visible = False
            panel_autre.Visible = True
        End If
    End Sub
End Class


