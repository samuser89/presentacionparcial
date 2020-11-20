<%-- 
    Document   : simulador
    Created on : 20/11/2020, 07:49:30 AM
    Author     : samuel.serna
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="co.edu.utap.controllers.ParcialController"%>
<%@page import="java.util.List"%>
<%@page import="co.edu.utap.domain.PlanPago"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    

    
    <head>
<!--<link rel="preconnect" href="https://fonts.gstatic.com">-->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/estilos.css">





        <style type="text/css">
           .dollars:before{ content: '$'; }
       </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parcial I</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" 
        crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" 
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" 
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" 
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" 
        integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" 
        crossorigin="anonymous"></script>
    <div class="container badge-light">
        <h1>Parcial</h1>
        
        <ul class="nav nav-pills" >
          <li class="nav-item">
            <a class="nav-link active" href="index.jsp">Inicio</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Parcial</a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="simulador.jsp">Simulador</a>
            </div>
          </li>

        </ul> 
    </div>  
    
    </head>
    <body>
        
        <table class="container badge-light" >
            
           
    
    <td class="container badge-light">
        <form class="container" method="post" action="ParcialController">
        <table>
            <tr><br>
        <div class="col-md-6">
            <td><label>Valor Prestamo: </label></td>

            <td><input class="badge-pill badge-light" type="number" max="99999999999999" placeholder="Monto a Solicitar" id="VlrPrestamo" name="VlrPrestamo"/></td>
                </div></tr>
            <tr>
        <div class="col-md-3">
            <td><label>Cuotas: </label></td>
            <td><input class="badge-pill badge-light" type="number" placeholder="Cuotas" id="CantiCuotas" name="CantiCuotas"/></td>
                </div></tr>
            <tr>
        <div class="col-md-3">
            <td><label>TASA M.V: </label></td>
            <td><input class="badge-pill badge-light" type="number" min="0" max="10" step="0.01" placeholder="0.01 a 10" id="Tasa" name="Tasa"/></td>
                </div></tr>
                <tr>         
        
                    <div class="col-md-3">
                   
                    <th><input class="badge-pill btn btn-info btn-lg" type="submit" value="Simular" id="btnSimular" name="btnSimular" /> </th>
                    <th><a class="badge-pill btn btn-secondary btn-sm" type="reset" href="index.jsp">Cancelar</a>
                    <a type="button" class="badge-pill btn btn-link col-1 btn-sm" href="simulador.jsp">limpiar</a></th>
                    
                    </div>
            </div>
            </table> 
            </form>
        <br>
        </td>
        
        <td class="badge" > 
        
            <%
                    if (request.getAttribute("plan") != null) {
                int nroCuotas=Integer.valueOf(request.getParameter("CantiCuotas"));
                double valorPrestamo=Double.valueOf(request.getParameter("VlrPrestamo"));
                double tasa = Double.valueOf(request.getParameter("Tasa")) / 100;
        
               
        double cuotaMensual = valorPrestamo*((tasa * (Math.pow((1+tasa),nroCuotas))) / ((Math.pow((1+tasa),nroCuotas)) - 1));
            %>
        <div class="container alert-ligth badge-light">
                        
            <br>
            <h1><label class="badge " >Datos de la Simulación<br> 
                <span class="badge badge-light" >Plan de Pagos</span>
            </label></h1>
            <h4>
                <%
            DecimalFormat df = new DecimalFormat();
            df.setMaximumFractionDigits(2);
            df.setMinimumFractionDigits(2);
            %>
            <label class="badge">Monto del Prestamo
                <span class="dollars badge badge-secondary" ><%=df.format(valorPrestamo)%></span>
            </label></br>    
            
            <label class="badge ">Cuotas
                <span class="badge badge-secondary"><%=request.getParameter("CantiCuotas")%></span>
            </label>
            <label class="badge ">Valor Cuota
                <span class="dollars badge badge-secondary" ><%=df.format(cuotaMensual)%></span>
            </label></br>            
      
            <label class="badge badge-success">TASA M.V:
                <span class="badge badge-light"><%=request.getParameter("Tasa") + "%" %></span>
            </label></br>            


            </h4>
        </div>
                   
                
                <%}%>
        
            
        </td>
        
</table>       
        
        
            
                <%
                    if (request.getAttribute("plan") != null) {
                %>
                <table class="table table-bordered container badge-light">
                    <br>
<div class="container alert alert-success alert-dismissible">
  <button type="button" class="close" data-dismiss="alert">X</button>
  <strong>Felicitaciones!</strong> Su simulación de crédito ha sido exitosa, a continuación presentamos su <strong>Plan de Pagos</strong>.
</div>
            <thead class="thead-dark">
                <tr>
                    <th >Cuota #</th>
                    <th >Abono a intereses</th>
                    <th >Abono a capital</th>
                    <th >Cuota mensual</th>
                    <th >Saldo del Credito</th>
                </tr>
            </thead>
            <%
                    
                        List<PlanPago> plan = (List<PlanPago>) request.getAttribute("plan");
                        for (PlanPago p : plan) {
                %>
            <tbody>
            <%
            DecimalFormat df = new DecimalFormat();
            df.setMaximumFractionDigits(2);
            df.setMinimumFractionDigits(2);
            %>
                <tr>
                    <td ><%= p.getNroCuota()%></td>
                    
                    <td class="dollars"><%= df.format(p.getAbonoIntereses())%></td>
                    <td class="dollars"><%= df.format(p.getAbonoCapital())%></td>
                    <td class="dollars mat-form-field-infix" thousandseparator=","><%= df.format(p.getCuotaMensual())%></td>
                    <td class="dollars mat-form-field-infix" thousandseparator=","><%= df.format(p.getSaldo())%></td>
                </tr>

            </tbody>
            
                <%
                        }
                    }
                %>

            </table>
        

    </body>
     

</html>