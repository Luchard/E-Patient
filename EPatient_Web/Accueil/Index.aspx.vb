Imports EPatient

Public Class Index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If (Session("Adminsession") = Nothing) Then
                Response.Redirect("~/login")
            End If
            NombreALert()
            LabelFonction()
        End If

    End Sub


    Private Sub NombreALert()

        '  lblNombreAlert.Text = "5"
        Label2.Text = 4

    End Sub


    Sub LabelFonction()
        Using db = New EPatient_dbEntities

            Dim id_role As Long
            id_role = Session("id_role")
            Dim _nbreInst = db.Tbl_Institution
            Dim _nbreInst_1 = db.Tbl_Institution.Count
            '   If id_role = 1 Then
            lbl_patients.Text = Cls_Individu.ListerPatient.Count
            lbl_medecin.Text = Cls_Individu.ListerMedecin.Count

            lbl_maison.Text = db.Tbl_Medicament.Count
                lbl_terrain_vaccant.Text = db.Tbl_Specialisation.Count
                lbl_permis_de_construire.Text = db.Tbl_Prescription.Count
                lbl_mairie.Text = "" & _nbreInst_1
                Label1.Text = db.Tbl_Individu.Count
            'lbCoaches.Text = "" & db.Tbl_Coach.Count
            '       lbl_patent_attente.Text = "" & db.tbl_Patente.Where(Function(s) s.id_statut = 2).Count
            ''      lbl_patent_deman.Text = "" & db.tbl_Patente.Where(Function(s) s.id_statut = 4).Count
            '     lbl_patent_livrees.Text = "" & db.tbl_Patente.Where(Function(s) s.id_statut = 1).Count
            '    lbInterPlan.Text = "" & db.tbl_permis_construire.Where(Function(s) s.id_statut = 1).Count
            '    lbInterConf.Text = "" & db.tbl_permis_construire.Where(Function(s) s.id_statut = 2).Count
            '    lbInterExec.Text = "" & db.tbl_permis_construire.Where(Function(s) s.id_statut = 3).Count
            '    lbInterArc.Text = "" & db.tbl_permis_construire.Where(Function(s) s.id_statut = 4).Count
            '    lbOperateur.Text = db.sp_utilisateur_caisse.Count
            ' Else
            ' lbl_contribuables.Text = db.tbl_contribuable.Where(Function(s) s.id_mairie = id_mairie).Count
            '   lbl_personnel.Text = db.tbl_personnel.Where(Function(s) s.id_mairie = id_mairie).Count
            '    lbl_maison.Text = db.tbl_immeuble.Where(Function(s) s.id_mairie = id_mairie).Count
            '    lbl_terrain_vaccant.Text = db.tbl_terrain.Where(Function(s) s.Id_mairie = id_mairie).Count
            '     lbl_permis_de_construire.Text = db.tbl_permis_construire.Where(Function(s) s.id_mairie = id_mairie).Count
            ' lbOperateur.Text = db.sp_utilisateur_caisse.Where(Function(s) s.id_mairie = id_mairie).Count
            '      lbl_mairie.Text = "" & _nbreInst
            ' Label1.Text = db.tbl_contribuable.Where(Function(s) s.id_mairie = id_mairie).Count
            'lbCoaches.Text = "" & db.Tbl_Coach.Count
            '     lbl_patent_attente.Text = "" & db.tbl_Patente.Where(Function(s) s.id_statut = 2 And s.id_mairie = id_mairie).Count
            '       lbl_patent_deman.Text = "" & db.tbl_Patente.Where(Function(s) s.id_statut = 4 And s.id_mairie = id_mairie).Count
            ' lbl_patent_livrees.Text = "" & db.tbl_Patente.Where(Function(s) s.id_statut = 1 And s.id_mairie = id_mairie).Count
            '       lbInterPlan.Text = "" & db.tbl_permis_construire.Where(Function(s) s.id_statut = 1 And s.id_mairie = id_mairie).Count
            '       lbInterConf.Text = "" & db.tbl_permis_construire.Where(Function(s) s.id_statut = 2 And s.id_mairie = id_mairie).Count
            '       lbInterExec.Text = "" & db.tbl_permis_construire.Where(Function(s) s.id_statut = 3 And s.id_mairie = id_mairie).Count
            '      lbInterArc.Text = "" & db.tbl_permis_construire.Where(Function(s) s.id_statut = 4 And s.id_mairie = id_mairie).Count
            '   End If


        End Using
    End Sub
End Class