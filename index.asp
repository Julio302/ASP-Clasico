<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hello ASP</title>
    <%

dim db_connection

db_connection = "Provider=SQLOLEDB.1;Server=.;Database=JFernandezAlumnosDigiPro;Uid=sa; Pwd=pass@word1;"


set conn = server.createobject("adodb.connection")
set Cmd = Server.CreateObject("ADODB.Command")
'-------------------------------------------------------
conn.open (db_connection)
'-------------------------------------------------------
set rs = Server.CreateObject("ADODB.RecordSet")
    %>
    <%
sql="select * from Alumnos"
set rs = Conn.execute(sql)

'if (rs.bof and rs.eof) then
       'response.Write "<span class=""error"">No Record Found</span>"
       'response.End
'end if
    %>
</head>
<body>
    <table border="1" class="table table-bordered">
        <tr>
            <td>Editar</td>
            <td>Eliminar</td>
            <td>IdAlumno</td>
            <td>Nombre</td>
            <td>Apellido paterno</td>
            <td>Apellido materno</td>
        </tr>
        <%
             
              while not rs.eof
        %>
        <tr>

            <td>
                <a href="./Add.asp?idAlumno=<%=rs("idAlumno")%>" class="news_frm">Modificar</a>
            </td>
            <td>
                <a href="Delete.asp?idAlumno=<%=rs("idAlumno")%>" class="news">Delete</a>
            </td>
            <td><%=rs("idAlumno")%></td>
            <td><%=rs("nombre")%></td>
            <td><%=rs("apellidoPaterno")%></td>
            <td><%=rs("apellidoMaterno")%></td>
        </tr>

        <%
              rs.movenext
              wend
        %>
    </table>
    <!--<% Response.Write("I am back!") %>-->

    
    <a href="add.asp">Nuevo Alumno</a>

</body>
</html>
