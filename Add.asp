<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hello ASP Add</title>
    <script type="text/javascript">
        function Submit_page() {
            if ($("#nombre").val() == "") {
                alert("Enter Name.");
                return false;
            }
            if ($("#apellidoPaterno").val() == "") {
                alert("Ingresa tu apellido Paterno.");
                return false;
            }
            if ($("#apellidoMaterno").val() == "") {
                alert("Ingresa tu apellidoMaterno.");
                return false;
            }
            else
                return true;
        }

    </script>

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
    Name = request.QueryString("idAlumno")
    if Name <> "" then
       sSQL = "SELECT top 1 * FROM Alumnos where idAlumno = '" & Name & "'"
       'response.Write sSQL'
       set rs = Conn.execute(sSQL)
      
       if not(rs.bof and rs.eof) then
         nombre = rs("nombre")
              apellidoPaterno = rs("apellidoPaterno")
              apellidoMaterno =rs("apellidoMaterno")    
        idAlumno=rs("idAlumno")
       end if
    end if
    %>
</head>
<body>
    <form action="posting.asp" name="frm_config" id="frm_config" method="post">
        <table>
            <tr>
                <td>Nombre</td>
                <td>
                    <% if Id <> "" then %><input type="hidden" name="idAlumno" id="idAlumno" value="<%=idAlumno%>" /><% end if %>
                    <input type="text" id="nombre" name="nombre" value="<%=nombre%>" /></td>
            </tr>
            <tr>
                <td>Apellido Paterno</td>
                <td>
                    <input type="text" id="apellidoPaterno" name="apellidoPaterno" maxlength="10" value="<%=apellidoPaterno%>" />
                </td>
            </tr>
            <tr>
                <td>Apellido Materno</td>
                <td>
                    <input type="text" id="apellidoMaterno" name="apellidoMaterno" value="<%=apellidoMaterno%>" />
                </td>
            </tr>

            <tr>
                <td>
                    <input type="submit" id="btnsubmit" value="Submit" onclick="Submit_page()" /><div id="post_result"></div>
                </td>
                <td></td>
            </tr>
        </table>
    </form>

</body>
</html>
