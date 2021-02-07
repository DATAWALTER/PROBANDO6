<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="misrc.*"%>
<%@page import="java.util.List"%>

<%!
    MetodoArchivoSerial ma = new MetodoArchivoSerial();
    String carpeta = "data", archivo = "objetos.ser";
    String rutaAbsolutaArchivo = ma.rutaAbsolutaArchivo(carpeta, archivo);

    String sId = "";
    String sNombre = "";
    String sEstatura = "";
    String sMensaje = "";

    public void limpiar() {
        sId = "";
        sNombre = "";
        sEstatura = "";
        sMensaje = "";
    }

    public Alumno buscar(int id) {
        Alumno alumnoencontrado = null;
        List<Alumno> alumnos_al = ma.leer(rutaAbsolutaArchivo);
        for (int i = 0; i < alumnos_al.size(); i++) {
            Alumno alumno = alumnos_al.get(i);
            if (alumno.getId() == id) {
                alumnoencontrado = alumno;
            }
        }
        return alumnoencontrado;
    }
%>

<%
    if (request.getParameter("btoBuscar") != null) {
        sId = request.getParameter("txtId");
        Alumno alumnoencontrado = buscar(Integer.parseInt(sId));
        if (alumnoencontrado != null) {
            sId = String.valueOf(alumnoencontrado.getId());
            sNombre = alumnoencontrado.getNombre();
            sEstatura = String.valueOf(alumnoencontrado.getEstatura());
            sMensaje = "ENCONTRADO";
        } else {
            sNombre = "";
            sEstatura = "";
            sMensaje = "NO EXISTE";
        }
    }
%>

<%
    if (request.getParameter("btoLimpiar") != null) {
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
        <h3>FORMULARIO: BUSCAR ALUMNO</h3>
        <form action="buscar.jsp" method="post">
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
                    <input type="text" name="txtMensaje" value="<%= sMensaje%>">
                </p>
                <p>
                    <input type="submit" name="btoBuscar" value="Buscar">
                    <input type="submit" name="btoLimpiar" value="Limpiar">
                </p>
            </fieldset>
        </form>
    </body>
</html>
