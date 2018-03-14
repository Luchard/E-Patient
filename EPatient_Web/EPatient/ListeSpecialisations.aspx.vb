Imports EPatient

Public Class ListeSpecialisations
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If (Session("Adminsession") = Nothing) Then
                Response.Redirect("~/login")
            End If
            Load_Specialisation()

        End If




    End Sub



    Private Sub Load_Specialisation()

        Try
            Using entities As New EPatient_dbEntities
                Dim fonctions = From func In entities.Tbl_Specialisation
                                Select func

                rlv_part.DataSource = fonctions.ToList
                rlv_part.DataBind()

            End Using


        Catch ex As Exception

        End Try
    End Sub


    Protected Sub RadBtn_Save_Click(sender As Object, e As EventArgs) Handles RadBtn_Save.Click
        Using entities As New EPatient_dbEntities


            Cls_Specialisation.AjouterSpecialisation(txt_code.Text, txt_specialisation.Text)
            Load_Specialisation()
        End Using
    End Sub

    Protected Sub lv_all_specialisation_ItemCanceling(sender As Object, e As ListViewDeleteEventArgs) Handles rlv_part.ItemDeleting
        Dim entities As New EPatient_dbEntities

        Dim dataItem As ListViewDataItem = rlv_part.Items(e.ItemIndex)

        Dim id As Long = CType(dataItem.FindControl("TextBox2"), TextBox).Text
        Dim fonction As Tbl_Specialisation = entities.Tbl_Specialisation.Find(id)

        Dim confirmValue As String = Request.Form("confirm_value")
        If confirmValue = "Yes" Then

            entities.Tbl_Specialisation.Remove(fonction)
            entities.SaveChanges()
        End If
        Load_Specialisation()
    End Sub








    'Modifier secteur



    Protected Sub lv_all_specialisation_ItemCanceling(sender As Object, e As ListViewCancelEventArgs) Handles rlv_part.ItemCanceling
        rlv_part.EditIndex = -1
        Load_Specialisation()

    End Sub

    Protected Sub lv_all_specialisation_ItemEditing(sender As Object, e As ListViewEditEventArgs) Handles rlv_part.ItemEditing
        rlv_part.EditIndex = e.NewEditIndex
        Load_Specialisation()
    End Sub

    Protected Sub lv_all_specialisation_ItemInserting(sender As Object, e As ListViewInsertEventArgs) Handles rlv_part.ItemInserting
        Dim entities As New EPatient_dbEntities
        Dim specialisation As New Tbl_Specialisation




        Try
            specialisation.Description = CType(e.Item.FindControl("tb_update_lon_piege"), TextBox).Text
            specialisation.codeSpecialisation = CType(e.Item.FindControl("txt_update_code"), TextBox).Text
        Catch ex As Exception

        End Try



        entities.Tbl_Specialisation.Add(specialisation)
        entities.SaveChanges()
        Load_Specialisation()
    End Sub

    Protected Sub rlv_part_ItemUpdating(sender As Object, e As ListViewUpdateEventArgs) Handles rlv_part.ItemUpdating
        Dim entities As New EPatient_dbEntities


        Dim dataItem As ListViewDataItem = rlv_part.Items(e.ItemIndex)

        Dim text_nom As TextBox = CType(dataItem.FindControl("TextBox1"), TextBox)
        Dim id As Long = CInt(CType(dataItem.FindControl("TextBox1"), TextBox).Text)
        '  id = CDec(CType(dataItem.FindControl("TextBox1"), TextBox).Text)


        Dim description As String = CType(dataItem.FindControl("tb_update_lon_piege"), TextBox).Text
        Dim code As String = CType(dataItem.FindControl("txt_update_code"), TextBox).Text
        Cls_Specialisation.ModifierSpecialisation(id, code, description)
        rlv_part.EditIndex = -1
        Load_Specialisation()

    End Sub


    Protected Sub lv_all_specialisation_PagePropertiesChanging(sender As Object, e As PagePropertiesChangingEventArgs) Handles rlv_part.PagePropertiesChanging

        Load_Specialisation()
    End Sub








End Class
