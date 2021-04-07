<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hello ASP Update</title>
</head>
<body>
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

    <!--formulacion de querys-->

      <%
        nombre = request.form("nombre")
        apellidoPaterno = request.form("apellidoPaterno")
        apellidoMaterno= request.form("apellidoMaterno")
        
        idAlumno = request.QueryString("idAlumno")
        'idAlumno=request.Form("idAlumno")

        if(idAlumno != null) then
    
        sSQL="Update Alumnos SET nombre='" &nombre& "',apellidoPaterno='" &apellidoPaterno& "', apellidoMaterno='" & apellidoMaterno & "'where idAlumno='" & request.QueryString("idAlumno") & "'"
       
        else
        sSQL= "INSERT INTO Alumnos (nombre,apellidoPaterno,ApellidoMaterno) values('" &(nombre)& "','"&(apellidoPaterno) & "','"&(ApellidoMaterno)&"')"

end if
        conn.execute(sSQL)
       response.Redirect("./index.asp")
%>
</body>
</html>
