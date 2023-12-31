<%-- 
    Document   : ajouterClient
    Created on : 18 août 2021, 18:02:51
    Author     : Zakina
--%>

<%@page import="model.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Pays"%>
<%@page import="forms.FormClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Equida</title>
    </head>
    <body>
         <h1>NOUVEAU CLIENT</h1>
        
         <%
                //Client client=(Client)request.getAttribute("client");
                FormClient form = (FormClient)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="ajouterClient" method="POST">
                <label for="nom">NOM : </label>
                <input id="nom" type="text" name="nom"  size="30" maxlength="30">
                </br>
                
                <label for="prenom">PRENOM : </label>
                <input id="prenom"  type="text"  name="prenom" size="30" maxlength="30">      
                 </br>
                
                <label for="rue">rue : </label>
                <input id="rue"  type="text"  name="rue" size="30" maxlength="50">
                 </br>
                               
                
                <label for="copos">Code postal : </label>
                <input id="copos"  type="text"  name="copos" size="5" maxlength="5">
                </br>
                
                <label for="ville">Ville : </label>
                <input id="ville"  type="text"  name="ville" size="40" maxlength="40">
                </br>
                
                <%-- Champ Liste des pays --%>
                <label for="pays">Pays : </label>
                <select name="codePays">
                    <%
                        ArrayList<Pays> lesPays = (ArrayList)request.getAttribute("pLesPays");
                        for (int i=0; i<lesPays.size();i++){
                            Pays p = lesPays.get(i);
                            out.println("<option value='" + p.getCode()+"'>" + p.getNom()+"</option>" );
                        }
                    %>
                </select>
                </br>            
                
                <label for="categVente">Categorie Vente : </label>
                <select name="categVente" size="5" multiple>
                <%
                        ArrayList<CategVente> lesCategVente = (ArrayList)request.getAttribute("pLesCategVente");
                        for (int i=0; i<lesCategVente.size();i++){
                            CategVente cv = lesCategVente.get(i);
                            out.println("<option value ='" + cv.getCode() + "'>" + cv.getLibelle() + "</option>"); 
                           
                        }
                    %>
                </select></br>
                
                
                
                <%-- Cases à cocher permettant de choisir les différentes catégories de vente auxquelles le client souhaite s'inscrire 
                <label for="categVente">Categories de vente : </label></br>
                 <%
                        ArrayList<CategVente> lesCategVente = (ArrayList)request.getAttribute("pLesCategVente");
                        for (int i=0; i<lesCategVente.size();i++){
                            CategVente cv = lesCategVente.get(i);
                            out.println("<input type='checkbox' id='cb" + i + "' name='" + cv.getCode() + "'>"); 
                            out.println(cv.getLibelle()); 
                            out.println("</label></br>");
                        }
                    %>
                    </br>
                    --%>
                                
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
    </body>
</html>
