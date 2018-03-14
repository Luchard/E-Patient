<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Index.aspx.vb" Inherits="EPatient_Web.Index" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
      
    
    
    <div class="right_col" role="main">

          <!-- top tiles -->
         <div class="row tile_count">
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total patients</span>
              <div class="count red center" ><asp:Label Font-Size="XX-Large" ID="lbl_patients" runat="server" Text=""></asp:Label></div>
             
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-file"></i> Prescriptions</span>
              <div class="count red center" ><asp:Label Font-Size="XX-Large" ID="lbl_permis_de_construire" runat="server" Text=""></asp:Label></div>
             
             
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total médecins</span>
              <div class="count green"><asp:Label Font-Size="XX-Large" ID="lbl_medecin" runat="server" Text=""></asp:Label></div>

            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-dollar"></i> Montant CFPB</span>
              <div class="count">4,567</div>
             <%-- <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> From last Week</span>--%>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i>Terrains Vacants</span>
              <div class="count green"><asp:Label Font-Size="XX-Large" ID="lbl_terrain_vaccant" runat="server" Text=""></asp:Label></div>
          
                  <%--  <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>--%>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-home"></i> Maisons enregistrées</span>
              <div class="count green"><asp:Label Font-Size="XX-Large" ID="lbl_maison" runat="server" Text=""></asp:Label></div>
          
           <%--   <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>--%>
            </div>
           
           
          </div>
        <div class="container">
 <div class="row-bg row" style="padding-top:0px">
                            <button type="button" class="btn btn-warning btn-sm pull-right" data-toggle="modal" data-target="#myModal">Vue d'ensemble</button>
                       
          <%--  <a href="../Alerte/wbfrm_ListAll_Alertes.aspx" class="dropdown-toggle icon-menu" style="height: 3px; margin: 1px !important; margin-top: -5px !important; background: none !important;">
                                      <asp:Panel ID="pnAlerte" runat="server" Visible="true">
                                          <i class="lnr lnr-alarm" style="font-size:20px !important;"></i>
                                      <span class="badge bg-danger">
                                          <asp:Label ID="lblNombreAlert" runat="server"></asp:Label>
                                      </span>
                                      </asp:Panel>

                                  </a> --%>
     
           <asp:LinkButton ID="lkn_alertes" ToolTip="Alertes" runat="server"><i class="fa fa-bell-o" style=" color:red; font-size:20px"><span class="badge badge-danger">
                                          <asp:Label ID="Label2" runat="server"></asp:Label>
                                      </span></i>
</asp:LinkButton>
   
            </div>
        </div>
          
          <!-- /top tiles -->



           <div class="row">


          <div class="col-md-12 col-sm-12 col-xs-12 pull-left">
              <div class="dashboard_graph">

                <div class="row x_title">
                <%--    <h3>Spécialisations</h3>--%>
                  <div class="col-md-6">
                    
                
            <asp:Chart ID="Chart1" Width="500px" runat="server" DataSourceID="SqlDataSource1">
                <series>
                    <asp:Series Name="Series1" XValueMember="Description" YValueMembers="Column1">
                    </asp:Series>
                </series>
                 <Titles>
                <asp:Title Text="Spécialisations"></asp:Title>
            </Titles>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
           

    
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=EPatient_db;User ID=sa;Password=solutions;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="sp_specialisations_count" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
           

                   
                     
                  </div>
                    
                      <div class="col-md-6">

                      <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSourceVille">
                        <series>
                            <asp:Series Name="Series1" XValueMember="Libelle" YValueMembers="nombre_habitant">
                            </asp:Series>
                        </series>
                           <Titles>
                <asp:Title Text="Patients/Ville"></asp:Title>
            </Titles>
                        <chartareas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </chartareas>
                    </asp:Chart>
                    <asp:SqlDataSource ID="SqlDataSourceVille" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=EPatient_db;User ID=sa;Password=solutions;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="sp_ville_patient" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                   
                  
                           </div>
                   
                     </div>


                <div class="clearfix">
                  
                  </div>
                 
              </div>
            </div>




 <div class="col-md-12 col-sm-12 col-xs-12 pull-left" runat="server" visible="false">

     <div class="dashboard_graph">
        <div class="row x_title">
           

    
    
        </div>
      
  </div>
 </div>

  

    
  
    








                <div class="col-md-12 col-sm-12 col-xs-12 pull-left" runat="server" visible="false">
<div class="dashboard_graph">
 <div class="row x_title">

       
    
        

 </div>
</div>
       
                </div>

     








                <div class="col-md-12 col-sm-12 col-xs-12 pull-left">
                    <div class="dashboard_graph">
                        <div class="row x_title">
                           <div class="col-md-6">
                             <div class="demo-container size-wide">
     
    </div>

</div>

                             <div class="col-md-6">
                             <div class="demo-container size-wide">
     
    </div>

</div>
    
   
                        </div>
                    </div>
        
                </div>

     


               <br />
               <br />
               <br />
               <br />
               <br />
               <br />
               <br />
               <br />

               
               <br />
               <br />
               <br />
               <br />
               <br />
               <br />
               <br />
               <br />
                  
               <br />
               <br />
               <br />
               <br />
               <br />
               <br />
               <br />

               
               <br />
               <br />
               <br />
               <br />
               <br />
             


             
    
 
   

          </div>


        </div>
 
    

     <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
     <div class="modal-content">
                                      <div class="modal-header" style="background-color:#4D7496;">
                                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span  style="color:#ffffff;">X</span></button>
                                          <h4 class="modal-title" style="color:#ffffff;">Vue d'ensemble</h4>
                                      </div>
                                      <div class="modal-body" style="min-height:300px;">
                                          <table class="table table-bordered table-striped table-condensed">
                            
            <tbody>
            <tr>
             <td>Mairies sur SGCT</td><td><span class="badge" style="font-size:16px">
                 <asp:Label ID="lbl_mairie" runat="server" Text=""></asp:Label></span></td>
            </tr>
                 <tr>
             <td>Nombre de contribuables</td><td><span class="badge" style="font-size:16px"> <asp:Label ID="Label1" runat="server" Text=""></asp:Label></span></td>
            </tr>
            <tr>
             <td>Nombre d'opérateurs</td><td><span class="badge" style="font-size:16px"> <asp:Label ID="lbOperateur" runat="server" Text=""></asp:Label></span></td>
            </tr>
            <tr>
             <td>Patente en attente</td><td><span class="badge" style="font-size:16px"> <asp:Label ID="lbl_patent_attente" runat="server" Text=""></asp:Label></span></td>
            </tr>
           
            <tr>
             <td>Patente demandées</td><td><span class="badge" style="font-size:16px"><asp:Label ID="lbl_patent_deman" runat="server" Text=""></asp:Label></span></td>
            </tr>
            <tr>
             <td>Patente livrées</td><td><span class="badge" style="font-size:16px"><asp:Label ID="lbl_patent_livrees" runat="server" Text=""></asp:Label></span></td>
            </tr>
            
            <tr>
             <td>Permis de construire en attente </td><td><span class="badge" style="font-size:16px"><asp:Label ID="lbInterPlan" runat="server" Text=""></asp:Label></span></td>
            </tr>
           
            <tr>
             <td>Permis de construire délivré</td><td><span class="badge" style="font-size:16px"><asp:Label ID="lbInterConf" runat="server" Text=""></asp:Label></span></td>
            </tr>
           
            <tr>
             <td>Permis d'inhumer demandé</td><td><span class="badge" style="font-size:16px"><asp:Label ID="lbInterExec" runat="server" Text=""></asp:Label></span></td>
            </tr>
           
          
           
            <tr>
             <td>Permis de construire livré</td><td><span class="badge" style="font-size:16px"><asp:Label ID="lbInterArc" runat="server"></asp:Label></span></td>
            </tr>
           
            </tbody>
          </table>
                                    </div>
                                </div>
      
    </div>
        </div> 







            
    







            
</asp:Content>


