<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page language="java" %>
<%@ page import="misrc.*" %>
<%@ page import="java.util.List" %>

<%!
    MetodoArchivoSerial ma = new MetodoArchivoSerial();
    String carpeta = "data", archivo = "objetos.ser";
    String rutaAbsolutaArchivo = ma.rutaAbsolutaArchivo(carpeta, archivo);

    String sId = "";
    String sNombre = "";
    String sEstatura = "";

    public void limpiar() {
        sId = "";
        sNombre = "";
        sEstatura = "";
    }
%>

<%
    if (request.getParameter("btoGrabar") != null) {
        out.println("<h3><u>BOTON: GRABAR</u></h3>");
        out.println("<h4>Ruta: " + rutaAbsolutaArchivo + "</h4>");

        try {
            sId = request.getParameter("txtId");
            sNombre = request.getParameter("txtNombre");
            sEstatura = request.getParameter("txtEstatura");

            int iId = Integer.parseInt(sId);
            double dEstatura = Double.parseDouble(sEstatura);

            Alumno a = new Alumno(iId, sNombre, dEstatura);

            if (ma.escribir(rutaAbsolutaArchivo, a)) {
                out.print("<h4>Grabació ok</h4>");
            } else {
                out.print("<h4>Error en grabación</h4>");
            }
        } catch (Exception e) {
            out.print("<h4>Datos de entrada incorrectos</h4>");
        }
        limpiar();
    }

    if (request.getParameter("btoCrear") != null) {
        out.println("<h3>BOTON: CREAR</h3>");
        if (ma.crear(rutaAbsolutaArchivo)) {
            out.println("<h4>Archivo creado correctamente</h4>");
        }
    }

    if (request.getParameter("btoMostrar") != null) {
        out.println("<h3>BOTON: MOSTRAR</h3>");
        List<Alumno> alumnos_al = ma.leer(rutaAbsolutaArchivo);
        if (alumnos_al != null) {
            if (alumnos_al.size() > 0) {
                for (int i = 0; i < alumnos_al.size(); i++) {
                    Alumno a = alumnos_al.get(i);
                    out.println("Id: " + a.getId() + "<br>");
                    out.println("Nombre: " + a.getNombre() + "<br>");
                    out.println("Estatura: " + a.getEstatura() + "<br>");
                }
            } else {
                out.println("<h4>Archivo vacio</h4>");
            }
        } else {
            out.println("<h4>Error en lectura</h4>");
        }
        limpiar();
    }
%>








<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            fieldset {
                width: 300px;
            }
            h3 {
                text-decoration: underline;
                color: blue;
            }
            h4 {
                color: red;
            }
        </style>
    </head>
    <body>
        <h3>FORMULARIO: REGISTRO DE ALUMNO</h3>
        <form action="index.jsp" method="post">
            <fieldset>
                <legend>Ingresar datos:</legend>
                <p>
                    <label for="lblId">Id?</label>
                    <input type="text" name="txtId" value="<%= sId%>">
                </p>
                <p>	
                    <label for="lblNombre">Nombre?</label>
                    <input type="text" name="txtNombre" value="<%= sNombre%>">
                </p>
                <p>				
                    <label for="lblEstatura">Estatura?</label>
                    <input type="text" name="txtEstatura" value="<%= sEstatura%>">
                </p>
                <p>
                    <input type="submit" name="btoGrabar" value="Grabar">
                    <input type="submit" name="btoCrear" value="Crear">
                    <input type="submit" name="btoMostrar" value="Mostrar">
                </p>
            </fieldset>
        </form>
    </body>
</html>
