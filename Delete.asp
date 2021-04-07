<!--<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hello ASP Delete</title>
</head>
<body>-->
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
        idAlumno = request.QueryString("idAlumno")
        'idAlumno = request.form("idAlumno")
        
        if(idAlumno>0) then
        'sSQL="Exec sp_deletealumno "&request.QueryString("idAlumno")&"" '
         sSQL="Delete Alumnos where idAlumno='" & request.QueryString("idAlumno") & "'"
       
        conn.execute(sSQL)
        response.Redirect("./index.asp")
        end if
        %>

<!--</body>
</html>-->
