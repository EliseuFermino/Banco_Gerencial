Imports System.Configuration.ConfigurationManager
Imports Microsoft.VisualBasic
Imports System.Data.Sql
Imports System.Data

Public Class clData_gerVendas




    Public Shared dbConnect As String = ConnectionStrings("gerVendasConnectionString").ConnectionString
    Public Shared mdstDateDelim As String = "#"
    Public Shared mdstSqlConcat As String = "&"
    Public Shared gdstUsername As String = ""



    'The first function takes a complete SQL SELECT query statement and returns an ADO.net datatable. 
    'This function is responsible for managing the database connection as far as opening the connection, 
    'retrieving the data, putting the data into a datatable, closing the connection and disposing of the 
    'database objects. Disposal is necessary to free up memory and connection ports that are no longer needed. Failure to close connection ports will result in database timeouts in a very short order.

    Public Shared Function SqlQry(ByVal sql As String) As DataTable
        Dim db As New SqlClient.SqlConnection(dbConnect)
        Dim dt As New DataTable
        'just do a simple select
        Dim adp As New SqlClient.SqlDataAdapter(sql, db)
        Try
            adp.Fill(dt)
            Return dt
        Catch ex As Exception
            Throw New Exception(ex.Message & " (" & sql & ")")
        Finally
            'Cleanup
            db.Close()
            db.Dispose()
            adp.Dispose()
        End Try
    End Function

    'The SqlExec function takes a complete INSERT, UPDATE or DELETE statement and executes it against 
    'the database. It returns the number of records affected by the statement so you can check to 
    'see if anything was done.

    Private Shared Function SqlExec(ByVal sql As String) As Integer 'Number of records affected
        Dim db As New SqlClient.SqlConnection(dbConnect)
        Dim cmd As New SqlClient.SqlCommand(sql, db)
        Dim RecsAff As Integer = 0
        db.Open()
        Try
            RecsAff = cmd.ExecuteNonQuery
        Catch ex As Exception
            Throw New Exception(ex.Message & " (" & sql & ")")
        Finally
            'Cleanup
            db.Close()
            db.Dispose()
            cmd.Dispose()
        End Try
        Return RecsAff
    End Function

    'The SqlFix function is used by those functions that take user input and form SQL statements from them. 
    'You'll see those functions below. Passing all user input through this function will escape any 
    'apostrophes, preventing the server from seeing them as quoted text. This will also defeat 
    'most SQL injection attacks.

    Private Shared Function SqlFix(ByVal InputText As String) As String
        SqlFix = Replace(InputText, "'", "''")
    End Function

    'The PKFieldGet function is used by the SQL statement-forming functions to get the name of 
    'the Primary Key field for the passed in table. As stated in the comments for the function, this 
    'only works for tables that have only a single-field primary key and that field is the first field in 
    'the table.

    Public Shared Function PKFieldGet(ByVal TableName As String) As String
        'This only works if you have only one field as the Primary Key and it is the 
        '   first column in the table
        Dim sql As String = "SELECT TOP 1 * FROM " & TableName & ";"
        Dim dt As DataTable = SqlQry(sql)
        Dim PK As String = dt.Columns(0).ColumnName
        dt.Dispose()
        dt = Nothing
        Return PK
    End Function

    Public Shared Sub usp(NomeProcedureStored As String)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Connection.Open()
        Command.ExecuteNonQuery()
        Connection.Close()
    End Sub

    Public Shared Sub usp2(ByVal NomeProcedureStored As String, _
                          ByVal iVar1 As String, ByVal iVar2 As String, _
                          ByVal iParam1 As String, ByVal iParam2 As String)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Command.Parameters.AddWithValue(iVar1, iParam1)
        Command.Parameters.AddWithValue(iVar2, iParam2)

        Connection.Open()
        Command.ExecuteNonQuery()
        Connection.Close()
    End Sub

    Public Shared Sub usp1(ByVal NomeProcedureStored As String, _
                        ByVal iVar1 As String, _
                        ByVal iParam1 As String, iTimeOut As Int32)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Command.Parameters.AddWithValue(iVar1, iParam1)

        Connection.Open()
        Command.CommandTimeout = iTimeOut
        Command.ExecuteNonQuery()
        Connection.Close()
    End Sub

    Public Shared Sub uspAnoMes(NomeProcedureStored As String, iAno As Integer, iMes As Integer, iTimeOut As Int32)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Dim Parameter1 As New SqlClient.SqlParameter("@Ano", iAno)
        Parameter1.Direction = ParameterDirection.Input
        Parameter1.DbType = DbType.Int32
        Command.Parameters.Add(Parameter1)

        Dim Parameter2 As New SqlClient.SqlParameter("@Mes", iMes)
        Parameter2.Direction = ParameterDirection.Input
        Parameter2.DbType = DbType.Int32
        Command.Parameters.Add(Parameter2)

        Connection.Open()
        Command.CommandTimeout = iTimeOut
        Command.ExecuteNonQuery()
        Connection.Close()
    End Sub

    Public Shared Sub uspAnoMesWithTimeOut(NomeProcedureStored As String, iNomeCampoAno As String, iNomeCampoMesInicial As String, iAno As Int16, iMesInicial As Byte, iTimeOut As Int16)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Dim Parameter1 As New SqlClient.SqlParameter(iNomeCampoMesInicial, iAno)
        Parameter1.Direction = ParameterDirection.Input
        Parameter1.DbType = DbType.Int32
        Command.Parameters.Add(Parameter1)

        Dim Parameter2 As New SqlClient.SqlParameter(iNomeCampoMesInicial, iMesInicial)
        Parameter2.Direction = ParameterDirection.Input
        Parameter2.DbType = DbType.Int32
        Command.Parameters.Add(Parameter2)

        Connection.Open()
        Command.CommandTimeout = iTimeOut
        Command.ExecuteNonQuery()
        Connection.Close()
    End Sub

    Public Shared Sub uspAnoMesFilialWithTimeOut(NomeProcedureStored As String, iNomeCampoAno As String, iNomeCampoMes As String, iNomeCampoFilial As String, iAno As Int16, iMesInicial As Byte, iFilial As Byte, iTimeOut As Int16)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Dim Parameter1 As New SqlClient.SqlParameter(iNomeCampoAno, iAno)
        Parameter1.Direction = ParameterDirection.Input
        Parameter1.DbType = DbType.Int32
        Command.Parameters.Add(Parameter1)

        Dim Parameter2 As New SqlClient.SqlParameter(iNomeCampoMes, iMesInicial)
        Parameter2.Direction = ParameterDirection.Input
        Parameter2.DbType = DbType.Int32
        Command.Parameters.Add(Parameter2)

        Dim Parameter3 As New SqlClient.SqlParameter(iNomeCampoFilial, iFilial)
        Parameter3.Direction = ParameterDirection.Input
        Parameter3.DbType = DbType.Int16
        Command.Parameters.Add(Parameter3)

        Connection.Open()
        Command.CommandTimeout = iTimeOut
        Command.ExecuteNonQuery()
        Connection.Close()
    End Sub

    Public Shared Sub uspAnoMesWithTimeOut(NomeProcedureStored As String, iNomeCampoAno As String, iNomeCampoMesInicial As String, iNomeCampoMesFinal As String, iNomeCampoUsuario As String, iAno As Int16, iMesInicial As Byte, iMesFinal As Byte, iUsuario As String, iTimeOut As Int16)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Dim Parameter1 As New SqlClient.SqlParameter(iNomeCampoAno, iAno)
        Parameter1.Direction = ParameterDirection.Input
        Parameter1.DbType = DbType.Int16
        Command.Parameters.Add(Parameter1)

        Dim Parameter2 As New SqlClient.SqlParameter(iNomeCampoMesInicial, iMesInicial)
        Parameter2.Direction = ParameterDirection.Input
        Parameter2.DbType = DbType.Byte
        Command.Parameters.Add(Parameter2)

        Dim Parameter3 As New SqlClient.SqlParameter(iNomeCampoMesFinal, iMesFinal)
        Parameter3.Direction = ParameterDirection.Input
        Parameter3.DbType = DbType.Byte
        Command.Parameters.Add(Parameter3)

        Dim Parameter4 As New SqlClient.SqlParameter(iNomeCampoUsuario, iUsuario)
        Parameter4.Direction = ParameterDirection.Input
        Parameter4.DbType = DbType.String
        Command.Parameters.Add(Parameter4)

        Connection.Open()
        Command.CommandTimeout = iTimeOut
        Command.ExecuteNonQuery()
        Connection.Close()
    End Sub


    Public Shared Sub uspDia(ByVal NomeProcedureStored As String, ByVal iDiaInicial As Date)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Dim Parameter1 As New SqlClient.SqlParameter("@dia", iDiaInicial)
        Parameter1.Direction = ParameterDirection.Input
        Parameter1.DbType = DbType.Date
        Command.Parameters.Add(Parameter1)

        Connection.Open()
        Try
            Command.ExecuteNonQuery()
            Connection.Close()
        Catch ex As Exception

        Finally
            Connection.Close()
        End Try


    End Sub

    Public Shared Sub uspDiaUSer(ByVal NomeProcedureStored As String, ByVal iDiaInicial As Date, iUser As String)
        Dim oVem As New VendaEmpresaMes
        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Dim Parameter1 As New SqlClient.SqlParameter("@Dia", iDiaInicial)
        Parameter1.Direction = ParameterDirection.Input
        Parameter1.DbType = DbType.Date
        Command.Parameters.Add(Parameter1)

        Dim Parameter2 As New SqlClient.SqlParameter("@IPuser", iUser)
        Parameter2.Direction = ParameterDirection.Input
        Parameter2.DbType = DbType.String
        Command.Parameters.Add(Parameter2)

        Connection.Open()
        Try
            Command.ExecuteNonQuery()
            Connection.Close()
        Catch ex As Exception
            oVem.varDesc = Err.Description
        Finally
            Connection.Close()
        End Try


    End Sub

    Public Shared Sub uspFilialDias(ByVal NomeProcedureStored As String, ByVal iFilial As Byte, ByVal iDiaInicial As Date, ByVal iDiaFinal As Date, ByVal iUsuario As String)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Dim Parameter0 As New SqlClient.SqlParameter("@idFilial", iFilial)
        Parameter0.Direction = ParameterDirection.Input
        Parameter0.DbType = DbType.Int16
        Command.Parameters.Add(Parameter0)

        Dim Parameter1 As New SqlClient.SqlParameter("@diaInicialAT", iDiaInicial)
        Parameter1.Direction = ParameterDirection.Input
        Parameter1.DbType = DbType.Date
        Command.Parameters.Add(Parameter1)

        Dim Parameter2 As New SqlClient.SqlParameter("@diaFinalAT", iDiaFinal)
        Parameter2.Direction = ParameterDirection.Input
        Parameter2.DbType = DbType.Date
        Command.Parameters.Add(Parameter2)

        Dim Parameter3 As New SqlClient.SqlParameter("@usuario", iUsuario)
        Parameter3.Direction = ParameterDirection.Input
        Parameter3.DbType = DbType.String
        Command.Parameters.Add(Parameter3)

        Connection.Open()
        Try
            Command.ExecuteNonQuery()
            Connection.Close()
        Catch ex As Exception

        Finally
            Connection.Close()
        End Try


    End Sub

    Public Shared Sub uspSecaoDias(ByVal NomeProcedureStored As String, ByVal iSecao As Int16, ByVal iDiaInicial As Date, ByVal iDiaFinal As Date, ByVal iUsuario As String)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Dim Parameter0 As New SqlClient.SqlParameter("@idSecao", iSecao)
        Parameter0.Direction = ParameterDirection.Input
        Parameter0.DbType = DbType.Int32
        Command.Parameters.Add(Parameter0)

        Dim Parameter1 As New SqlClient.SqlParameter("@diaInicialAT", iDiaInicial)
        Parameter1.Direction = ParameterDirection.Input
        Parameter1.DbType = DbType.Date
        Command.Parameters.Add(Parameter1)

        Dim Parameter2 As New SqlClient.SqlParameter("@diaFinalAT", iDiaFinal)
        Parameter2.Direction = ParameterDirection.Input
        Parameter2.DbType = DbType.Date
        Command.Parameters.Add(Parameter2)

        Dim Parameter3 As New SqlClient.SqlParameter("@usuario", iUsuario)
        Parameter3.Direction = ParameterDirection.Input
        Parameter3.DbType = DbType.String
        Command.Parameters.Add(Parameter3)

        Connection.Open()
        Try
            Command.ExecuteNonQuery()
            Connection.Close()
        Catch ex As Exception

        Finally
            Connection.Close()
        End Try

    End Sub

    Public Shared Sub uspGrupoDias(ByVal NomeProcedureStored As String, ByVal iSecao As Int32, ByVal iGrupo As Int32, ByVal iDiaInicial As Date, ByVal iDiaFinal As Date, ByVal iUsuario As String, iTimeOut As Int16)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Dim Parameter0 As New SqlClient.SqlParameter("@idSecao", iSecao)
        Parameter0.Direction = ParameterDirection.Input
        Parameter0.DbType = DbType.Int32
        Command.Parameters.Add(Parameter0)

        Dim Parameter1 As New SqlClient.SqlParameter("@idGrupo", iGrupo)
        Parameter1.Direction = ParameterDirection.Input
        Parameter1.DbType = DbType.Int32
        Command.Parameters.Add(Parameter1)

        Dim Parameter2 As New SqlClient.SqlParameter("@diaInicialAT", iDiaInicial)
        Parameter2.Direction = ParameterDirection.Input
        Parameter2.DbType = DbType.Date
        Command.Parameters.Add(Parameter2)

        Dim Parameter3 As New SqlClient.SqlParameter("@diaFinalAT", iDiaFinal)
        Parameter3.Direction = ParameterDirection.Input
        Parameter3.DbType = DbType.Date
        Command.Parameters.Add(Parameter3)

        Dim Parameter4 As New SqlClient.SqlParameter("@usuario", iUsuario)
        Parameter4.Direction = ParameterDirection.Input
        Parameter4.DbType = DbType.String
        Command.Parameters.Add(Parameter4)

        Connection.Open()
        Command.CommandTimeout = iTimeOut
        Try
            Command.ExecuteNonQuery()
            Connection.Close()
        Catch ex As Exception

        Finally
            Connection.Close()
        End Try

    End Sub

    Public Shared Sub uspSecaoDiasFilial(ByVal NomeProcedureStored As String, ByVal iFilial As Int16, ByVal iDiaInicial As Date, ByVal iDiaFinal As Date, ByVal iUsuario As String)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Dim Parameter0 As New SqlClient.SqlParameter("@idFilial", iFilial)
        Parameter0.Direction = ParameterDirection.Input
        Parameter0.DbType = DbType.Int32
        Command.Parameters.Add(Parameter0)

        Dim Parameter1 As New SqlClient.SqlParameter("@diaInicialAT", iDiaInicial)
        Parameter1.Direction = ParameterDirection.Input
        Parameter1.DbType = DbType.Date
        Command.Parameters.Add(Parameter1)

        Dim Parameter2 As New SqlClient.SqlParameter("@diaFinalAT", iDiaFinal)
        Parameter2.Direction = ParameterDirection.Input
        Parameter2.DbType = DbType.Date
        Command.Parameters.Add(Parameter2)

        Dim Parameter3 As New SqlClient.SqlParameter("@usuario", iUsuario)
        Parameter3.Direction = ParameterDirection.Input
        Parameter3.DbType = DbType.String
        Command.Parameters.Add(Parameter3)

        Connection.Open()
        Try
            Command.ExecuteNonQuery()
            Connection.Close()
        Catch ex As Exception

        Finally
            Connection.Close()
        End Try


    End Sub


    Public Shared Sub uspTotalDias(ByVal NomeProcedureStored As String, ByVal iDiaInicial As Date, ByVal iDiaFinal As Date, ByVal iUsuario As String)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Dim Parameter0 As New SqlClient.SqlParameter("@diaInicialAT", iDiaInicial)
        Parameter0.Direction = ParameterDirection.Input
        Parameter0.DbType = DbType.Date
        Command.Parameters.Add(Parameter0)

        Dim Parameter1 As New SqlClient.SqlParameter("@diaFinalAT", iDiaFinal)
        Parameter1.Direction = ParameterDirection.Input
        Parameter1.DbType = DbType.Date
        Command.Parameters.Add(Parameter1)

        Dim Parameter2 As New SqlClient.SqlParameter("@usuario", iUsuario)
        Parameter2.Direction = ParameterDirection.Input
        Parameter2.DbType = DbType.String
        Command.Parameters.Add(Parameter2)

        Connection.Open()
        Try
            Command.ExecuteNonQuery()
            Connection.Close()
        Catch ex As Exception

        Finally
            Connection.Close()
        End Try

    End Sub

    Public Shared Sub uspSecaoDiasSemana(ByVal NomeProcedureStored As String, ByVal iSecao As Int32, ByVal iDiaInicial As Date, ByVal iDiaFinal As Date, ByVal iUsuario As String, ByVal iSemana As Byte)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Dim Parameter0 As New SqlClient.SqlParameter("@idSecao", iSecao)
        Parameter0.Direction = ParameterDirection.Input
        Parameter0.DbType = DbType.Int32
        Command.Parameters.Add(Parameter0)

        Dim Parameter1 As New SqlClient.SqlParameter("@diaInicialAT", iDiaInicial)
        Parameter1.Direction = ParameterDirection.Input
        Parameter1.DbType = DbType.Date
        Command.Parameters.Add(Parameter1)

        Dim Parameter2 As New SqlClient.SqlParameter("@diaFinalAT", iDiaFinal)
        Parameter2.Direction = ParameterDirection.Input
        Parameter2.DbType = DbType.Date
        Command.Parameters.Add(Parameter2)

        Dim Parameter3 As New SqlClient.SqlParameter("@usuario", iUsuario)
        Parameter3.Direction = ParameterDirection.Input
        Parameter3.DbType = DbType.String
        Command.Parameters.Add(Parameter3)

        Dim Parameter4 As New SqlClient.SqlParameter("@idSemana", iSemana)
        Parameter4.Direction = ParameterDirection.Input
        Parameter4.DbType = DbType.Int16
        Command.Parameters.Add(Parameter4)

        Connection.Open()
        Try
            Command.ExecuteNonQuery()
            Connection.Close()
        Catch ex As Exception

        Finally
            Connection.Close()
        End Try


    End Sub

    'The following TableGet and TableListGet functions all return a datatable based on passed-in parameters. 
    'Each variation of the function takes a different number of parameters depending on the degree of detail 
    'you need or how specific your input is. For instance, the first TableGet function is used if you already 
    'know the record ID for the record you want to return. The second TableGet function is used if you want
    ' to specify a WHERE clause or an ORDER BY parameter. The third TableGet function is used if you want to 
    'retrieve a set of records based on the value of a specific field. The TableListGet function is used if 
    'you want to retrieve only specific fields, filtered and sorted.

    Public Shared Function TableGet(ByVal TableName As String, ByVal RecID As String) As DataTable
        Dim where As String = ""
        If RecID <> "" Then where = " WHERE [" & PKFieldGet(TableName) & "]=" & RecID
        Dim sql As String = "SELECT * FROM " & TableName & where & ";"
        Dim dt As DataTable = SqlQry(sql)
        dt.TableName = TableName
        Return dt
    End Function

    Public Shared Function TableGet(ByVal TableName As String, ByVal Filter As String, _
            ByVal Sort As String) As DataTable
        If Sort <> "" Then Sort = " ORDER BY " & Sort
        If Filter <> "" Then Filter = " WHERE " & Filter
        Dim sql As String = "SELECT * FROM " & TableName & Filter & Sort & ";"
        Dim dt As DataTable = SqlQry(sql)
        dt.TableName = TableName
        Return dt
    End Function

    Public Shared Function TableGet(ByVal TableName As String, ByVal KeyField As String, _
            ByVal RecID As String, ByVal Filter As String, ByVal Sort As String) As DataTable
        If Sort <> "" Then Sort = " ORDER BY " & Sort
        If Filter <> "" Then Filter = Filter & " AND "
        If Not IsNumeric(RecID) Then RecID = "'" & RecID & "'"
        Dim sql As String = "SELECT * FROM " & TableName & " WHERE " & Filter & KeyField & _
            "=" & RecID & Sort & ";"
        Dim dt As DataTable = SqlQry(sql)
        dt.TableName = TableName
        Return dt
    End Function

    Public Shared Function TableListGet(ByVal TableName As String, ByVal Fields As String, _
            ByVal Filter As String, ByVal Sort As String) As DataTable
        If Sort <> "" Then Sort = " ORDER BY " & Sort
        If Filter <> "" Then Filter = " WHERE " & Filter
        Dim sql As String = "SELECT " & Fields & " FROM " & TableName & Filter & Sort & ";"
        Dim dt As DataTable = SqlQry(sql)
        dt.TableName = TableName
        Return dt
    End Function

    'The TableDel function is used to delete records from a specified table based on the value of a 
    'specific field. This will usually be the primary key field, but it can also be used to do bulk deletes.

    Public Shared Function TableDel(ByVal TableName As String, ByVal KeyField As String, _
        ByVal RecID As String) As String
        Dim sql As String = "DELETE FROM " & TableName & " WHERE " & KeyField & "=" & _
            RecID & ";"
        SqlExec(sql)
        Return ""
    End Function

    'The RecordPut function is arguably the most complicated function in this class. It takes a datatable as 
    'input and is used for both INSERTs and UPDATEs. The easiest way to populate the datatable before calling 
    'this function is to call the TableGet function, passing the tablename and a RecID of 0 to get a 
    'ready-built empty table with all of the necessary fields. You can then create a new datarow based on 
    'that table, populate the fields with your data and add the datarow to the datatable. Then call the 
    'RecordPut function passing the table. You can see an example of this usage in the EmployeeSave Sub in the 
    'code page of EmployeeDetail.aspx.vb later in this demo. The primary key field is expected to be the first 
    'field in the datatable. If the value of this field is 0, the record will be inserted into the database as 
    'a new record otherwise the database record specified by the key value will be updated.
    'The function iterates through all the fields in the datatable, extracting the field name, data type and 
    'data value. For inserts, it creates three strings: one for the field names as they will appear in the 
    'INSERT statement, one for the data values, appropriately quoted as they will appear in the INSERT 
    'statement, and one for name-value pairs to be used in the WHERE clause of a separate SELECT statement. 
    '(I'll explain that later.) Once the function has finished iterating through the fields, it concatenates
    ' the first and second strings into an INSERT statement and calls the SqlExec function, passing the 
    'completed INSERT statement. It then concatenates the third string into a SELECT statement containing 
    'all the same information, calls SqlQry passing the completed SELECT statement, and then extracting the 
    'record ID from the returned datatable and setting the RecID variable to that value which then gets
    ' passed back to the calling function. That last step is necessary for MS Access and several other 
    'databases that do not have a built-in function for getting the ID of the most recently inserted record. 
    'Getting that ID is often necessary for additional processing to take place in the application.
    'For updates, the function simply iterates through the fields, builds the name-value pairs, concatenates 
    'an UPDATE statement, calls SqlExec passing the completed UPDATE statement, and returns the existing RecID.

    Public Shared Function RecordPut(ByVal dt As DataTable) As String
        Dim sql As String = "", I As Integer, quot As String = ""
        Dim RecID As String = dt.Rows(0).Item(0)
        If RecID = 0 Then
            Dim sql1 As String = ""
            Dim sql2 As String = ""
            Dim sql3 As String = ""
            For I = 1 To dt.Columns.Count - 1
                Select Case dt.Columns(I).DataType.Name
                    Case "String"
                        quot = "'"
                    Case "Integer", "Int32"
                        quot = ""
                    Case "Date", "DateTime"
                        quot = mdstDateDelim
                    Case "Boolean"
                        quot = ""
                        'dt.Rows(0).Item(I)
                End Select
                If sql1 <> "" Then sql1 = sql1 & ","
                sql1 = sql1 & "[" & dt.Columns(I).ColumnName & "]"
                If sql2 <> "" Then sql2 = sql2 & ","
                sql2 = sql2 & quot & SqlFix(dt.Rows(0).Item(I) & "") & quot
                If sql3 <> "" Then sql3 = sql3 & " AND "
                sql3 = sql3 & "[" & dt.Columns(I).ColumnName & "]=" & quot & _
                    SqlFix(dt.Rows(0).Item(I) & "") & quot
            Next
            sql = "INSERT INTO " & dt.TableName & " (" & sql1 & ") VALUES (" & sql2 & ");"
            SqlExec(sql)
            sql = "SELECT [" & PKFieldGet(dt.TableName) & "] FROM " & dt.TableName & _
                " WHERE " & sql3 & ";"
            Dim dt2 As DataTable = SqlQry(sql)
            RecID = dt2.Rows(0).Item(0)
        Else
            For I = 1 To dt.Columns.Count - 1
                If sql <> "" Then sql = sql & ","
                sql = sql & "[" & dt.Columns(I).ColumnName & "]='" & _
                    SqlFix(dt.Rows(0).Item(I) & "") & "'"
            Next
            sql = "UPDATE " & dt.TableName & " SET " & sql & " WHERE [" & _
                PKFieldGet(dt.TableName) & "]=" & RecID & ";"
            SqlExec(sql)
        End If
        Return RecID
    End Function

    'The RecordDel function is an abbreviated form of the TableDel function where you only need to specify 
    'the tablename and the primary key ID of the record you want to delete. It cannot be used for bulk deletes.

    Public Shared Function RecordDel(ByVal TableName As String, ByVal RecID As String) As String
        Dim sql As String = "DELETE FROM " & TableName & " WHERE [" & _
            PKFieldGet(TableName) & "]=" & RecID & ";"
        SqlExec(sql)
        Return ""
    End Function

    'The FieldValueGet function is used to retrieve the value of one field in one record specified 
    'by the record's primary key value.

    Public Shared Function FieldValueGet(ByVal TableName As String, ByVal RecID As String, _
            ByVal FieldName As String) As String
        Dim sql As String = "SELECT " & FieldName & " FROM " & TableName & " WHERE [" & _
            PKFieldGet(TableName) & "]=" & RecID & ";"
        Dim dt As DataTable = SqlQry(sql)
        Return dt.Rows(0).Item(0)
    End Function

    'The FieldValuePut function is used to update the value of one field in one record specified by its 
    'primary key value. This is useful when you only want to update a date or a status for a record.

    Public Shared Sub FieldValuePut(ByVal TableName As String, ByVal RecID As String, _
           ByVal FieldName As String, ByVal FieldValue As String)
        Dim sql As String = "UPDATE " & TableName & " SET " & FieldName & "='" & _
            FieldValue & "' WHERE [" & PKFieldGet(TableName) & "]=" & RecID & ";"
        SqlExec(sql)
    End Sub

    Public Shared Sub usp3(ByVal NomeProcedureStored As String, _
                     ByVal iVar1 As String, ByVal iVar2 As String, ByVal iVar3 As String, _
                     ByVal iParam1 As String, ByVal iParam2 As String, ByVal iParam3 As String)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Command.Parameters.AddWithValue(iVar1, iParam1)
        Command.Parameters.AddWithValue(iVar2, iParam2)
        Command.Parameters.AddWithValue(iVar3, iParam3)

        Connection.Open()
        Command.ExecuteNonQuery()
        Connection.Close()
    End Sub

    Public Shared Sub usp4(ByVal NomeProcedureStored As String, _
                    ByVal iVar1 As String, ByVal iVar2 As String, ByVal iVar3 As String, ByVal iVar4 As String, _
                    ByVal iParam1 As String, ByVal iParam2 As String, ByVal iParam3 As String, ByVal iParam4 As String)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Command.Parameters.AddWithValue(iVar1, iParam1)
        Command.Parameters.AddWithValue(iVar2, iParam2)
        Command.Parameters.AddWithValue(iVar3, iParam3)
        Command.Parameters.AddWithValue(iVar4, iParam4)

        Connection.Open()
        Command.ExecuteNonQuery()
        Connection.Close()
    End Sub

    Public Shared Sub usp5(ByVal NomeProcedureStored As String, _
                     ByVal iVar1 As String, ByVal iVar2 As String, ByVal iVar3 As String, ByVal iVar4 As String, ByVal iVar5 As String, _
                     ByVal iParam1 As String, ByVal iParam2 As String, ByVal iParam3 As String, _
                     ByVal iParam4 As String, ByVal iParam5 As String)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Command.Parameters.AddWithValue(iVar1, iParam1)
        Command.Parameters.AddWithValue(iVar2, iParam2)
        Command.Parameters.AddWithValue(iVar3, iParam3)
        Command.Parameters.AddWithValue(iVar4, iParam4)
        Command.Parameters.AddWithValue(iVar5, iParam5)

        Connection.Open()
        Command.ExecuteNonQuery()
        Connection.Close()
    End Sub

    Public Shared Sub usp5_TM(ByVal NomeProcedureStored As String, _
                   ByVal iVar1 As String, ByVal iVar2 As String, ByVal iVar3 As String, ByVal iVar4 As String, ByVal iVar5 As String, _
                   ByVal iParam1 As String, ByVal iParam2 As String, ByVal iParam3 As String, _
                   ByVal iParam4 As String, ByVal iParam5 As String, iTimeOut As Int16)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Command.Parameters.AddWithValue(iVar1, iParam1)
        Command.Parameters.AddWithValue(iVar2, iParam2)
        Command.Parameters.AddWithValue(iVar3, iParam3)
        Command.Parameters.AddWithValue(iVar4, iParam4)
        Command.Parameters.AddWithValue(iVar5, iParam5)

        Connection.Open()
        Command.CommandTimeout = iTimeOut
        Command.ExecuteNonQuery()
        Connection.Close()
    End Sub

    Public Shared Sub usp4_TM(ByVal NomeProcedureStored As String, _
                ByVal iVar1 As String, ByVal iVar2 As String, ByVal iVar3 As String, ByVal iVar4 As String, _
                ByVal iParam1 As String, ByVal iParam2 As String, ByVal iParam3 As String, _
                ByVal iParam4 As String, iTimeOut As Int16)

        Dim Connection As New SqlClient.SqlConnection(dbConnect)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = NomeProcedureStored
        Command.CommandType = CommandType.StoredProcedure

        Command.Parameters.AddWithValue(iVar1, iParam1)
        Command.Parameters.AddWithValue(iVar2, iParam2)
        Command.Parameters.AddWithValue(iVar3, iParam3)
        Command.Parameters.AddWithValue(iVar4, iParam4)

        Connection.Open()
        Command.CommandTimeout = iTimeOut
        Command.ExecuteNonQuery()
        Connection.Close()
    End Sub

    'That's everything for the DAC. This class could also contain a Region for functions specific to 
    'this database or to this application such as join queries, but what I've shown here can be picked 
    'up and dropped into any database-enabled application. Let's try it out.

End Class
