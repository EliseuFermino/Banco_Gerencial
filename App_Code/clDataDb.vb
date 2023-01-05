Imports System.Configuration.ConfigurationManager
Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Text
Imports System.IO



Public Class clDataDb

    'Public Shared dbConnect As String = ConnectionStrings("NorthwindConnectionString").ConnectionString
    'Public Shared mdstDateDelim As String = "#"
    'Public Shared mdstSqlConcat As String = "&"
    'Public Shared gdstUsername As String = ""

    Private vQtde As String
    Private vVlr As String
    Private vPerc As String

    Dim oCon As New Conexao
    Private vDesc As String

    Public Property varDesc() As String
        Get
            varDesc = vDesc
        End Get
        Set(ByVal value As String)
            vDesc = value
        End Set
    End Property

    Public Property qtde() As String
        Get
            qtde = vQtde
        End Get
        Set(ByVal value As String)
            vQtde = value
        End Set
    End Property

    Public Property vlr() As String
        Get
            vlr = vVlr
        End Get
        Set(ByVal value As String)
            vVlr = value
        End Set
    End Property

    Public Property perc() As String
        Get
            perc = vPerc
        End Get
        Set(ByVal value As String)
            vPerc = value
        End Set
    End Property

    '#Region " Codigos Originais"


    '    'The first function takes a complete SQL SELECT query statement and returns an ADO.net datatable. 
    '    'This function is responsible for managing the database connection as far as opening the connection, 
    '    'retrieving the data, putting the data into a datatable, closing the connection and disposing of the 
    '    'database objects. Disposal is necessary to free up memory and connection ports that are no longer needed. Failure to close connection ports will result in database timeouts in a very short order.

    '    Private Shared Function SqlQry(ByVal sql As String) As DataTable
    '        Dim db As New SqlClient.SqlConnection(dbConnect)
    '        Dim dt As New DataTable
    '        'just do a simple select
    '        Dim adp As New SqlClient.SqlDataAdapter(sql, db)
    '        Try
    '            adp.Fill(dt)
    '            Return dt
    '        Catch ex As Exception
    '            Throw New Exception(ex.Message & " (" & sql & ")")
    '        Finally
    '            'Cleanup
    '            db.Close()
    '            db.Dispose()
    '            adp.Dispose()
    '        End Try
    '    End Function

    '    'The SqlExec function takes a complete INSERT, UPDATE or DELETE statement and executes it against 
    '    'the database. It returns the number of records affected by the statement so you can check to 
    '    'see if anything was done.

    '    Private Shared Function SqlExec(ByVal sql As String) As Integer 'Number of records affected
    '        Dim db As New SqlClient.SqlConnection(dbConnect)
    '        Dim cmd As New SqlClient.SqlCommand(sql, db)
    '        Dim RecsAff As Integer = 0
    '        db.Open()
    '        Try
    '            RecsAff = cmd.ExecuteNonQuery
    '        Catch ex As Exception
    '            Throw New Exception(ex.Message & " (" & sql & ")")
    '        Finally
    '            'Cleanup
    '            db.Close()
    '            db.Dispose()
    '            cmd.Dispose()
    '        End Try
    '        Return RecsAff
    '    End Function

    '    'The SqlFix function is used by those functions that take user input and form SQL statements from them. 
    '    'You'll see those functions below. Passing all user input through this function will escape any 
    '    'apostrophes, preventing the server from seeing them as quoted text. This will also defeat 
    '    'most SQL injection attacks.

    '    Private Shared Function SqlFix(ByVal InputText As String) As String
    '        SqlFix = Replace(InputText, "'", "''")
    '    End Function

    '    'The PKFieldGet function is used by the SQL statement-forming functions to get the name of 
    '    'the Primary Key field for the passed in table. As stated in the comments for the function, this 
    '    'only works for tables that have only a single-field primary key and that field is the first field in 
    '    'the table.

    '    Public Shared Function PKFieldGet(ByVal TableName As String) As String
    '        'This only works if you have only one field as the Primary Key and it is the 
    '        '   first column in the table
    '        Dim sql As String = "SELECT TOP 1 * FROM " & TableName & ";"
    '        Dim dt As DataTable = SqlQry(sql)
    '        Dim PK As String = dt.Columns(0).ColumnName
    '        dt.Dispose()
    '        dt = Nothing
    '        Return PK
    '    End Function

    '    'The following TableGet and TableListGet functions all return a datatable based on passed-in parameters. 
    '    'Each variation of the function takes a different number of parameters depending on the degree of detail 
    '    'you need or how specific your input is. For instance, the first TableGet function is used if you already 
    '    'know the record ID for the record you want to return. The second TableGet function is used if you want
    '    ' to specify a WHERE clause or an ORDER BY parameter. The third TableGet function is used if you want to 
    '    'retrieve a set of records based on the value of a specific field. The TableListGet function is used if 
    '    'you want to retrieve only specific fields, filtered and sorted.

    '    Public Shared Function TableGet(ByVal TableName As String, ByVal RecID As String) As DataTable
    '        Dim where As String = ""
    '        If RecID <> "" Then where = " WHERE [" & PKFieldGet(TableName) & "]=" & RecID
    '        Dim sql As String = "SELECT * FROM " & TableName & where & ";"
    '        Dim dt As DataTable = SqlQry(sql)
    '        dt.TableName = TableName
    '        Return dt
    '    End Function

    '    Public Shared Function TableGet(ByVal TableName As String, ByVal Filter As String, _
    '            ByVal Sort As String) As DataTable
    '        If Sort <> "" Then Sort = " ORDER BY " & Sort
    '        If Filter <> "" Then Filter = " WHERE " & Filter
    '        Dim sql As String = "SELECT * FROM " & TableName & Filter & Sort & ";"
    '        Dim dt As DataTable = SqlQry(sql)
    '        dt.TableName = TableName
    '        Return dt
    '    End Function

    '    Public Shared Function TableGet(ByVal TableName As String, ByVal KeyField As String, _
    '            ByVal RecID As String, ByVal Filter As String, ByVal Sort As String) As DataTable
    '        If Sort <> "" Then Sort = " ORDER BY " & Sort
    '        If Filter <> "" Then Filter = Filter & " AND "
    '        If Not IsNumeric(RecID) Then RecID = "'" & RecID & "'"
    '        Dim sql As String = "SELECT * FROM " & TableName & " WHERE " & Filter & KeyField & _
    '            "=" & RecID & Sort & ";"
    '        Dim dt As DataTable = SqlQry(sql)
    '        dt.TableName = TableName
    '        Return dt
    '    End Function

    '    Public Shared Function TableListGet(ByVal TableName As String, ByVal Fields As String, _
    '            ByVal Filter As String, ByVal Sort As String) As DataTable
    '        If Sort <> "" Then Sort = " ORDER BY " & Sort
    '        If Filter <> "" Then Filter = " WHERE " & Filter
    '        Dim sql As String = "SELECT " & Fields & " FROM " & TableName & Filter & Sort & ";"
    '        Dim dt As DataTable = SqlQry(sql)
    '        dt.TableName = TableName
    '        Return dt
    '    End Function

    '    'The TableDel function is used to delete records from a specified table based on the value of a 
    '    'specific field. This will usually be the primary key field, but it can also be used to do bulk deletes.

    '    Public Shared Function TableDel(ByVal TableName As String, ByVal KeyField As String, _
    '        ByVal RecID As String) As String
    '        Dim sql As String = "DELETE FROM " & TableName & " WHERE " & KeyField & "=" & _
    '            RecID & ";"
    '        SqlExec(sql)
    '        Return ""
    '    End Function

    '    'The RecordPut function is arguably the most complicated function in this class. It takes a datatable as 
    '    'input and is used for both INSERTs and UPDATEs. The easiest way to populate the datatable before calling 
    '    'this function is to call the TableGet function, passing the tablename and a RecID of 0 to get a 
    '    'ready-built empty table with all of the necessary fields. You can then create a new datarow based on 
    '    'that table, populate the fields with your data and add the datarow to the datatable. Then call the 
    '    'RecordPut function passing the table. You can see an example of this usage in the EmployeeSave Sub in the 
    '    'code page of EmployeeDetail.aspx.vb later in this demo. The primary key field is expected to be the first 
    '    'field in the datatable. If the value of this field is 0, the record will be inserted into the database as 
    '    'a new record otherwise the database record specified by the key value will be updated.
    '    'The function iterates through all the fields in the datatable, extracting the field name, data type and 
    '    'data value. For inserts, it creates three strings: one for the field names as they will appear in the 
    '    'INSERT statement, one for the data values, appropriately quoted as they will appear in the INSERT 
    '    'statement, and one for name-value pairs to be used in the WHERE clause of a separate SELECT statement. 
    '    '(I'll explain that later.) Once the function has finished iterating through the fields, it concatenates
    '    ' the first and second strings into an INSERT statement and calls the SqlExec function, passing the 
    '    'completed INSERT statement. It then concatenates the third string into a SELECT statement containing 
    '    'all the same information, calls SqlQry passing the completed SELECT statement, and then extracting the 
    '    'record ID from the returned datatable and setting the RecID variable to that value which then gets
    '    ' passed back to the calling function. That last step is necessary for MS Access and several other 
    '    'databases that do not have a built-in function for getting the ID of the most recently inserted record. 
    '    'Getting that ID is often necessary for additional processing to take place in the application.
    '    'For updates, the function simply iterates through the fields, builds the name-value pairs, concatenates 
    '    'an UPDATE statement, calls SqlExec passing the completed UPDATE statement, and returns the existing RecID.

    '    Public Shared Function RecordPut(ByVal dt As DataTable) As String
    '        Dim sql As String = "", I As Integer, quot As String = ""
    '        Dim RecID As String = dt.Rows(0).Item(0)
    '        If RecID = 0 Then
    '            Dim sql1 As String = ""
    '            Dim sql2 As String = ""
    '            Dim sql3 As String = ""
    '            For I = 1 To dt.Columns.Count - 1
    '                Select Case dt.Columns(I).DataType.Name
    '                    Case "String"
    '                        quot = "'"
    '                    Case "Integer", "Int32"
    '                        quot = ""
    '                    Case "Date", "DateTime"
    '                        quot = mdstDateDelim
    '                    Case "Boolean"
    '                        quot = ""
    '                        'dt.Rows(0).Item(I)
    '                End Select
    '                If sql1 <> "" Then sql1 = sql1 & ","
    '                sql1 = sql1 & "[" & dt.Columns(I).ColumnName & "]"
    '                If sql2 <> "" Then sql2 = sql2 & ","
    '                sql2 = sql2 & quot & SqlFix(dt.Rows(0).Item(I) & "") & quot
    '                If sql3 <> "" Then sql3 = sql3 & " AND "
    '                sql3 = sql3 & "[" & dt.Columns(I).ColumnName & "]=" & quot & _
    '                    SqlFix(dt.Rows(0).Item(I) & "") & quot
    '            Next
    '            sql = "INSERT INTO " & dt.TableName & " (" & sql1 & ") VALUES (" & sql2 & ");"
    '            SqlExec(sql)
    '            sql = "SELECT [" & PKFieldGet(dt.TableName) & "] FROM " & dt.TableName & _
    '                " WHERE " & sql3 & ";"
    '            Dim dt2 As DataTable = SqlQry(sql)
    '            RecID = dt2.Rows(0).Item(0)
    '        Else
    '            For I = 1 To dt.Columns.Count - 1
    '                If sql <> "" Then sql = sql & ","
    '                sql = sql & "[" & dt.Columns(I).ColumnName & "]='" & _
    '                    SqlFix(dt.Rows(0).Item(I) & "") & "'"
    '            Next
    '            sql = "UPDATE " & dt.TableName & " SET " & sql & " WHERE [" & _
    '                PKFieldGet(dt.TableName) & "]=" & RecID & ";"
    '            SqlExec(sql)
    '        End If
    '        Return RecID
    '    End Function

    '    'The RecordDel function is an abbreviated form of the TableDel function where you only need to specify 
    '    'the tablename and the primary key ID of the record you want to delete. It cannot be used for bulk deletes.

    '    Public Shared Function RecordDel(ByVal TableName As String, ByVal RecID As String) As String
    '        Dim sql As String = "DELETE FROM " & TableName & " WHERE [" & _
    '            PKFieldGet(TableName) & "]=" & RecID & ";"
    '        SqlExec(sql)
    '        Return ""
    '    End Function

    '    'The FieldValueGet function is used to retrieve the value of one field in one record specified 
    '    'by the record's primary key value.

    '    Public Shared Function FieldValueGet(ByVal TableName As String, ByVal RecID As String, _
    '            ByVal FieldName As String) As String
    '        Dim sql As String = "SELECT " & FieldName & " FROM " & TableName & " WHERE [" & _
    '            PKFieldGet(TableName) & "]=" & RecID & ";"
    '        Dim dt As DataTable = SqlQry(sql)
    '        Return dt.Rows(0).Item(0)
    '    End Function

    '    'The FieldValuePut function is used to update the value of one field in one record specified by its 
    '    'primary key value. This is useful when you only want to update a date or a status for a record.

    '    Public Shared Sub FieldValuePut(ByVal TableName As String, ByVal RecID As String, _
    '           ByVal FieldName As String, ByVal FieldValue As String)
    '        Dim sql As String = "UPDATE " & TableName & " SET " & FieldName & "='" & _
    '            FieldValue & "' WHERE [" & PKFieldGet(TableName) & "]=" & RecID & ";"
    '        SqlExec(sql)
    '    End Sub

    '    'That's everything for the DAC. This class could also contain a Region for functions specific to 
    '    'this database or to this application such as join queries, but what I've shown here can be picked 
    '    'up and dropped into any database-enabled application. Let's try it out.


    '#End Region

    ' *********************************** MY CODES ************************************************************************

    Public Function GetDataDB_Parameter1(ByVal nameStoredProcedure As String, myVariable1 As String, myParameter1 As String) As Boolean

        Dim connection As New SqlConnection(Conexao.gerPerdas)
        Using connection
            connection.Open()
            Dim command As New SqlCommand(nameStoredProcedure, connection)
            command.CommandType = CommandType.StoredProcedure

            command.Parameters.AddWithValue(myVariable1, myParameter1)

            Dim idStatus As Boolean = command.ExecuteScalar()

            GetDataDB_Parameter1 = idStatus

        End Using
    End Function



    Public Sub GetDataDB_Parameter4(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As String,
                             myVariable2 As String, myParameter2 As String,
                             myVariable3 As String, myParameter3 As String,
                             myVariable4 As String, myParameter4 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)

        vlr = 0
        perc = 0

        Try
            connection.Open()
            Dim reader5 As SqlDataReader
            reader5 = command.ExecuteReader()
            While reader5.Read
                vlr = 0
                perc = 0

                vlr = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                perc = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
            End While
        Catch ex As Exception
            varDesc = "Classe: BuscaGrupoMes - " & ex.Message
        Finally
            connection.Close()
        End Try
    End Sub

    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub


    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As String,
                             myVariable2 As String, myParameter2 As String,
                             myVariable3 As String, myParameter3 As String,
                             myVariable4 As String, myParameter4 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure_Projetos(ByVal nameStoredProcedure As String, nameConnections As String,
                                  myVariable1 As String, myParameter1 As Integer,
                                  myVariable2 As String, myParameter2 As Date,
                                  myVariable3 As String, myParameter3 As Date,
                                  myVariable4 As String, myParameter4 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure_Projetos(ByVal nameStoredProcedure As String, nameConnections As String,
                                 myVariable1 As String, myParameter1 As Integer,
                                 myVariable2 As String, myParameter2 As String,
                                 myVariable3 As String, myParameter3 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure_Projetos(ByVal nameStoredProcedure As String, nameConnections As String,
                                  myVariable1 As String, myParameter1 As Integer,
                                  myVariable2 As String, myParameter2 As Date,
                                  myVariable3 As String, myParameter3 As Date,
                                  myVariable4 As String, myParameter4 As String,
                                  myVariable5 As String, myParameter5 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As String,
                      myVariable2 As String, myParameter2 As String,
                      myVariable3 As String, myParameter3 As String,
                      myVariable4 As String, myParameter4 As String,
                      myVariable5 As String, myParameter5 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As String,
                         myVariable2 As String, myParameter2 As String,
                         myVariable3 As String, myParameter3 As String,
                         myVariable4 As String, myParameter4 As String,
                         myVariable5 As String, myParameter5 As String,
                         myVariable6 As String, myParameter6 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)
        command.Parameters.AddWithValue(myVariable6, myParameter6)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As String,
                        myVariable2 As String, myParameter2 As String,
                        myVariable3 As String, myParameter3 As String,
                        myVariable4 As String, myParameter4 As String,
                        myVariable5 As String, myParameter5 As String,
                        myVariable6 As String, myParameter6 As String,
                        myVariable7 As String, myParameter7 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)
        command.Parameters.AddWithValue(myVariable6, myParameter6)
        command.Parameters.AddWithValue(myVariable7, myParameter7)


        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As String,
                        myVariable2 As String, myParameter2 As String,
                        myVariable3 As String, myParameter3 As String,
                        myVariable4 As String, myParameter4 As String,
                        myVariable5 As String, myParameter5 As String,
                        myVariable6 As String, myParameter6 As String,
                        myVariable7 As String, myParameter7 As String,
                        myVariable8 As String, myParameter8 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)
        command.Parameters.AddWithValue(myVariable6, myParameter6)
        command.Parameters.AddWithValue(myVariable7, myParameter7)
        command.Parameters.AddWithValue(myVariable8, myParameter8)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As String,
                         myVariable2 As String, myParameter2 As String,
                         myVariable3 As String, myParameter3 As String,
                         myVariable4 As String, myParameter4 As String,
                         myVariable5 As String, myParameter5 As String,
                         myVariable6 As String, myParameter6 As String,
                         myVariable7 As String, myParameter7 As String,
                         myVariable8 As String, myParameter8 As String,
                         myVariable9 As String, myParameter9 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)
        command.Parameters.AddWithValue(myVariable6, myParameter6)
        command.Parameters.AddWithValue(myVariable7, myParameter7)
        command.Parameters.AddWithValue(myVariable8, myParameter8)
        command.Parameters.AddWithValue(myVariable9, myParameter9)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As String,
                      myVariable2 As String, myParameter2 As String,
                      myVariable3 As String, myParameter3 As String,
                      myVariable4 As String, myParameter4 As String,
                      myVariable5 As String, myParameter5 As String,
                      myVariable6 As String, myParameter6 As String,
                      myVariable7 As String, myParameter7 As String,
                      myVariable8 As String, myParameter8 As String,
                      myVariable9 As String, myParameter9 As String,
                      myVariable10 As String, myParameter10 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)
        command.Parameters.AddWithValue(myVariable6, myParameter6)
        command.Parameters.AddWithValue(myVariable7, myParameter7)
        command.Parameters.AddWithValue(myVariable8, myParameter8)
        command.Parameters.AddWithValue(myVariable9, myParameter9)
        command.Parameters.AddWithValue(myVariable10, myParameter10)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As String,
                      myVariable2 As String, myParameter2 As String,
                      myVariable3 As String, myParameter3 As String,
                      myVariable4 As String, myParameter4 As String,
                      myVariable5 As String, myParameter5 As String,
                      myVariable6 As String, myParameter6 As String,
                      myVariable7 As String, myParameter7 As String,
                      myVariable8 As String, myParameter8 As String,
                      myVariable9 As String, myParameter9 As String,
                      myVariable10 As String, myParameter10 As String,
                      myVariable11 As String, myParameter11 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)
        command.Parameters.AddWithValue(myVariable6, myParameter6)
        command.Parameters.AddWithValue(myVariable7, myParameter7)
        command.Parameters.AddWithValue(myVariable8, myParameter8)
        command.Parameters.AddWithValue(myVariable9, myParameter9)
        command.Parameters.AddWithValue(myVariable10, myParameter10)
        command.Parameters.AddWithValue(myVariable11, myParameter11)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As String,
                  myVariable2 As String, myParameter2 As String,
                  myVariable3 As String, myParameter3 As String,
                  myVariable4 As String, myParameter4 As String,
                  myVariable5 As String, myParameter5 As String,
                  myVariable6 As String, myParameter6 As String,
                  myVariable7 As String, myParameter7 As String,
                  myVariable8 As String, myParameter8 As String,
                  myVariable9 As String, myParameter9 As String,
                  myVariable10 As String, myParameter10 As String,
                  myVariable11 As String, myParameter11 As String,
                  myVariable12 As String, myParameter12 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)
        command.Parameters.AddWithValue(myVariable6, myParameter6)
        command.Parameters.AddWithValue(myVariable7, myParameter7)
        command.Parameters.AddWithValue(myVariable8, myParameter8)
        command.Parameters.AddWithValue(myVariable9, myParameter9)
        command.Parameters.AddWithValue(myVariable10, myParameter10)
        command.Parameters.AddWithValue(myVariable11, myParameter11)
        command.Parameters.AddWithValue(myVariable12, myParameter12)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As String,
                  myVariable2 As String, myParameter2 As String,
                  myVariable3 As String, myParameter3 As String,
                  myVariable4 As String, myParameter4 As String,
                  myVariable5 As String, myParameter5 As String,
                  myVariable6 As String, myParameter6 As String,
                  myVariable7 As String, myParameter7 As String,
                  myVariable8 As String, myParameter8 As String,
                  myVariable9 As String, myParameter9 As String,
                  myVariable10 As String, myParameter10 As String,
                  myVariable11 As String, myParameter11 As String,
                  myVariable12 As String, myParameter12 As String,
                  myVariable13 As String, myParameter13 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)
        command.Parameters.AddWithValue(myVariable6, myParameter6)
        command.Parameters.AddWithValue(myVariable7, myParameter7)
        command.Parameters.AddWithValue(myVariable8, myParameter8)
        command.Parameters.AddWithValue(myVariable9, myParameter9)
        command.Parameters.AddWithValue(myVariable10, myParameter10)
        command.Parameters.AddWithValue(myVariable11, myParameter11)
        command.Parameters.AddWithValue(myVariable12, myParameter12)
        command.Parameters.AddWithValue(myVariable13, myParameter13)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As String,
               myVariable2 As String, myParameter2 As String,
               myVariable3 As String, myParameter3 As String,
               myVariable4 As String, myParameter4 As String,
               myVariable5 As String, myParameter5 As String,
               myVariable6 As String, myParameter6 As String,
               myVariable7 As String, myParameter7 As String,
               myVariable8 As String, myParameter8 As String,
               myVariable9 As String, myParameter9 As String,
               myVariable10 As String, myParameter10 As String,
               myVariable11 As String, myParameter11 As String,
               myVariable12 As String, myParameter12 As String,
               myVariable13 As String, myParameter13 As String,
               myVariable14 As String, myParameter14 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)
        command.Parameters.AddWithValue(myVariable6, myParameter6)
        command.Parameters.AddWithValue(myVariable7, myParameter7)
        command.Parameters.AddWithValue(myVariable8, myParameter8)
        command.Parameters.AddWithValue(myVariable9, myParameter9)
        command.Parameters.AddWithValue(myVariable10, myParameter10)
        command.Parameters.AddWithValue(myVariable11, myParameter11)
        command.Parameters.AddWithValue(myVariable12, myParameter12)
        command.Parameters.AddWithValue(myVariable13, myParameter13)
        command.Parameters.AddWithValue(myVariable14, myParameter14)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As String,
               myVariable2 As String, myParameter2 As String,
               myVariable3 As String, myParameter3 As String,
               myVariable4 As String, myParameter4 As String,
               myVariable5 As String, myParameter5 As String,
               myVariable6 As String, myParameter6 As String,
               myVariable7 As String, myParameter7 As String,
               myVariable8 As String, myParameter8 As String,
               myVariable9 As String, myParameter9 As String,
               myVariable10 As String, myParameter10 As String,
               myVariable11 As String, myParameter11 As String,
               myVariable12 As String, myParameter12 As String,
               myVariable13 As String, myParameter13 As String,
               myVariable14 As String, myParameter14 As String,
               myVariable15 As String, myParameter15 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)
        command.Parameters.AddWithValue(myVariable6, myParameter6)
        command.Parameters.AddWithValue(myVariable7, myParameter7)
        command.Parameters.AddWithValue(myVariable8, myParameter8)
        command.Parameters.AddWithValue(myVariable9, myParameter9)
        command.Parameters.AddWithValue(myVariable10, myParameter10)
        command.Parameters.AddWithValue(myVariable11, myParameter11)
        command.Parameters.AddWithValue(myVariable12, myParameter12)
        command.Parameters.AddWithValue(myVariable13, myParameter13)
        command.Parameters.AddWithValue(myVariable14, myParameter14)
        command.Parameters.AddWithValue(myVariable15, myParameter15)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As Date,
                    myVariable2 As String, myParameter2 As String,
                    myVariable3 As String, myParameter3 As String,
                    myVariable4 As String, myParameter4 As String,
                    myVariable5 As String, myParameter5 As String,
                    myVariable6 As String, myParameter6 As String,
                    myVariable7 As String, myParameter7 As String,
                    myVariable8 As String, myParameter8 As String,
                    myVariable9 As String, myParameter9 As String,
                    myVariable10 As String, myParameter10 As String,
                    myVariable11 As String, myParameter11 As String,
                    myVariable12 As String, myParameter12 As String,
                    myVariable13 As String, myParameter13 As Byte)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)
        command.Parameters.AddWithValue(myVariable6, myParameter6)
        command.Parameters.AddWithValue(myVariable7, myParameter7)
        command.Parameters.AddWithValue(myVariable8, myParameter8)
        command.Parameters.AddWithValue(myVariable9, myParameter9)
        command.Parameters.AddWithValue(myVariable10, myParameter10)
        command.Parameters.AddWithValue(myVariable11, myParameter11)
        command.Parameters.AddWithValue(myVariable12, myParameter12)
        command.Parameters.AddWithValue(myVariable13, myParameter13)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As Date,
                    myVariable2 As String, myParameter2 As String,
                    myVariable3 As String, myParameter3 As String,
                    myVariable4 As String, myParameter4 As String,
                    myVariable5 As String, myParameter5 As String,
                    myVariable6 As String, myParameter6 As String,
                    myVariable7 As String, myParameter7 As String,
                    myVariable8 As String, myParameter8 As String,
                    myVariable9 As String, myParameter9 As String,
                    myVariable10 As String, myParameter10 As String,
                    myVariable11 As String, myParameter11 As String,
                    myVariable12 As String, myParameter12 As String,
                    myVariable13 As String, myParameter13 As String,
                    myVariable14 As String, myParameter14 As Byte)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)
        command.Parameters.AddWithValue(myVariable6, myParameter6)
        command.Parameters.AddWithValue(myVariable7, myParameter7)
        command.Parameters.AddWithValue(myVariable8, myParameter8)
        command.Parameters.AddWithValue(myVariable9, myParameter9)
        command.Parameters.AddWithValue(myVariable10, myParameter10)
        command.Parameters.AddWithValue(myVariable11, myParameter11)
        command.Parameters.AddWithValue(myVariable12, myParameter12)
        command.Parameters.AddWithValue(myVariable13, myParameter13)
        command.Parameters.AddWithValue(myVariable14, myParameter14)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Sub ExecuteStoredProcedure_TimedOut(ByVal nameStoredProcedure As String, nameConnections As String, _
                 myVariable1 As String, myParameter1 As Date,
                  iTimeOut As Int16)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)


        Try
            connection.Open()
            command.CommandTimeout = iTimeOut
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Sub ExecuteStoredProcedure_TimedOut(ByVal nameStoredProcedure As String, nameConnections As String, _
                 myVariable1 As String, myParameter1 As String,
                  myVariable2 As String, myParameter2 As String,
                  myVariable3 As String, myParameter3 As String,
                  iTimeOut As Int16)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)

        Try
            connection.Open()
            command.CommandTimeout = iTimeOut
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Sub ExecuteStoredProcedure_TimedOut(ByVal nameStoredProcedure As String, nameConnections As String, _
                 myVariable1 As String, myParameter1 As String,
                  myVariable2 As String, myParameter2 As String,
                  myVariable3 As String, myParameter3 As String,
                  myVariable4 As String, myParameter4 As String,
                  myVariable5 As String, myParameter5 As String,
                  myVariable6 As String, myParameter6 As String,
                  iTimeOut As Int16)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)
        command.Parameters.AddWithValue(myVariable6, myParameter6)

        Try
            connection.Open()
            command.CommandTimeout = iTimeOut
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub


    Public Overloads Sub ExecuteStoredProcedure(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As String,
                  myVariable2 As String, myParameter2 As String,
                  myVariable3 As String, myParameter3 As String,
                  myVariable4 As String, myParameter4 As String,
                  myVariable5 As String, myParameter5 As String,
                  myVariable6 As String, myParameter6 As String,
                  myVariable7 As String, myParameter7 As String,
                  myVariable8 As String, myParameter8 As String,
                  myVariable9 As String, myParameter9 As String,
                  myVariable10 As String, myParameter10 As String,
                  myVariable11 As String, myParameter11 As String,
                  myVariable12 As String, myParameter12 As String,
                  myVariable13 As String, myParameter13 As String,
                  myVariable14 As String, myParameter14 As String,
                  myVariable15 As String, myParameter15 As String,
                  myVariable16 As String, myParameter16 As String,
                  myVariable17 As String, myParameter17 As String,
                  myVariable18 As String, myParameter18 As String,
                  myVariable19 As String, myParameter19 As String,
                  myVariable20 As String, myParameter20 As String,
                  myVariable21 As String, myParameter21 As String,
                  myVariable22 As String, myParameter22 As String,
                  myVariable23 As String, myParameter23 As String,
                  myVariable24 As String, myParameter24 As String)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)
        command.Parameters.AddWithValue(myVariable6, myParameter6)
        command.Parameters.AddWithValue(myVariable7, myParameter7)
        command.Parameters.AddWithValue(myVariable8, myParameter8)
        command.Parameters.AddWithValue(myVariable9, myParameter9)
        command.Parameters.AddWithValue(myVariable10, myParameter10)
        command.Parameters.AddWithValue(myVariable11, myParameter11)
        command.Parameters.AddWithValue(myVariable12, myParameter12)
        command.Parameters.AddWithValue(myVariable13, myParameter13)
        command.Parameters.AddWithValue(myVariable14, myParameter14)
        command.Parameters.AddWithValue(myVariable15, myParameter15)
        command.Parameters.AddWithValue(myVariable16, myParameter16)
        command.Parameters.AddWithValue(myVariable17, myParameter17)
        command.Parameters.AddWithValue(myVariable18, myParameter18)
        command.Parameters.AddWithValue(myVariable19, myParameter19)
        command.Parameters.AddWithValue(myVariable20, myParameter20)
        command.Parameters.AddWithValue(myVariable21, myParameter21)
        command.Parameters.AddWithValue(myVariable22, myParameter22)
        command.Parameters.AddWithValue(myVariable23, myParameter23)
        command.Parameters.AddWithValue(myVariable24, myParameter24)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message
        Finally
            connection.Close()
        End Try

    End Sub

    Public Sub ExecuteStoredProcedure_Posto(ByVal nameStoredProcedure As String, nameConnections As String, myVariable1 As String, myParameter1 As Int16,
                  myVariable2 As String, myParameter2 As Date,
                  myVariable3 As String, myParameter3 As Int16,
                  myVariable4 As String, myParameter4 As Decimal,
                  myVariable5 As String, myParameter5 As Decimal)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)
        command.Parameters.AddWithValue(myVariable4, myParameter4)
        command.Parameters.AddWithValue(myVariable5, myParameter5)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: InsertDataDB_Parameter - " & ex.Message & " - " & myParameter2
        Finally
            connection.Close()
        End Try

    End Sub


    Public Function GetDataDB_ExecuteScalar_Parameter2(ByVal nameStoredProcedure As String, nameConnections As String,
                                                   myVariable1 As String, myParameter1 As String,
                                                   myVariable2 As String, myParameter2 As String) As String

        Dim connection As New SqlConnection(nameConnections)
        Using connection
            connection.Open()
            Dim command As New SqlCommand(nameStoredProcedure, connection)
            command.CommandType = CommandType.StoredProcedure

            command.Parameters.AddWithValue(myVariable1, myParameter1)
            command.Parameters.AddWithValue(myVariable2, myParameter2)


            Dim idStatus As Decimal = command.ExecuteScalar()

            GetDataDB_ExecuteScalar_Parameter2 = idStatus

        End Using
    End Function

    Public Shared Function ExecuteStoredProcedure_Scalar(ByVal nameStoredProcedure As String, nameConnections As String) As String

        Dim connection As New SqlConnection(nameConnections)
        Using connection
            connection.Open()
            Dim command As New SqlCommand(nameStoredProcedure, connection)
            command.CommandType = CommandType.StoredProcedure



            Dim idStatus As String = command.ExecuteScalar()

            ExecuteStoredProcedure_Scalar = idStatus

        End Using
    End Function



    Public Function ExecuteStoredProcedure_Scalar(ByVal nameStoredProcedure As String, nameConnections As String,
                                                       myVariable1 As String, myParameter1 As String) As String

        Dim connection As New SqlConnection(nameConnections)
        Using connection
            connection.Open()
            Dim command As New SqlCommand(nameStoredProcedure, connection)
            command.CommandType = CommandType.StoredProcedure

            command.Parameters.AddWithValue(myVariable1, myParameter1)

            Dim idStatus As String = command.ExecuteScalar()

            ExecuteStoredProcedure_Scalar = idStatus

        End Using
    End Function

    Public Shared Function ExecuteStoredProcedure_Scalar(ByVal nameStoredProcedure As String, nameConnections As String,
                                                   myVariable1 As String, myParameter1 As Date) As String

        Dim connection As New SqlConnection(nameConnections)
        Using connection
            connection.Open()
            Dim command As New SqlCommand(nameStoredProcedure, connection)
            command.CommandType = CommandType.StoredProcedure

            command.Parameters.AddWithValue(myVariable1, myParameter1)

            Dim idStatus As String = command.ExecuteScalar()

            ExecuteStoredProcedure_Scalar = idStatus

        End Using
    End Function

    

    Public Function ExecuteStoredProcedure_Scalar_Permission(ByVal nameStoredProcedure As String, nameConnections As String,
                                                  myVariable1 As String, myParameter1 As String, myVariable2 As String, myParameter2 As Byte, myVariable3 As String, myParameter3 As Int16) As Int16

        Dim connection As New SqlConnection(nameConnections)
        Using connection
            connection.Open()
            Dim command As New SqlCommand(nameStoredProcedure, connection)
            command.CommandType = CommandType.StoredProcedure

            command.Parameters.AddWithValue(myVariable1, myParameter1)
            command.Parameters.AddWithValue(myVariable2, myParameter2)
            command.Parameters.AddWithValue(myVariable3, myParameter3)

            Dim idStatus As String = command.ExecuteScalar()

            ExecuteStoredProcedure_Scalar_Permission = idStatus

        End Using
    End Function

    

    Public Shared Function ExecuteStoredProcedure_Scalar(ByVal nameStoredProcedure As String, nameConnections As String,
                                                  myVariable1 As String, myParameter1 As Byte) As String

        Dim connection As New SqlConnection(nameConnections)
        Using connection
            connection.Open()
            Dim command As New SqlCommand(nameStoredProcedure, connection)
            command.CommandType = CommandType.StoredProcedure

            command.Parameters.AddWithValue(myVariable1, myParameter1)

            Dim idStatus As String = command.ExecuteScalar()

            ExecuteStoredProcedure_Scalar = idStatus

        End Using
    End Function


    Public Shared Function ExecuteStoredProcedure_Scalar(ByVal nameStoredProcedure As String, nameConnections As String,
                                                   myVariable1 As String, myParameter1 As String,
                                                   myVariable2 As String, myParameter2 As String) As String

        Dim connection As New SqlConnection(nameConnections)
        Using connection
            connection.Open()
            Dim command As New SqlCommand(nameStoredProcedure, connection)
            command.CommandType = CommandType.StoredProcedure

            command.Parameters.AddWithValue(myVariable1, myParameter1)
            command.Parameters.AddWithValue(myVariable2, myParameter2)

            Dim idStatus As String = command.ExecuteScalar()

            ExecuteStoredProcedure_Scalar = idStatus

        End Using
    End Function

    Public Shared Function ExecuteStoredProcedure_Scalar(ByVal nameStoredProcedure As String, nameConnections As String,
                                                   myVariable1 As String, myParameter1 As Date,
                                                   myVariable2 As String, myParameter2 As Date) As String

        Dim connection As New SqlConnection(nameConnections)
        Using connection
            connection.Open()
            Dim command As New SqlCommand(nameStoredProcedure, connection)
            command.CommandType = CommandType.StoredProcedure

            command.Parameters.AddWithValue(myVariable1, myParameter1)
            command.Parameters.AddWithValue(myVariable2, myParameter2)

            Dim idStatus As String = command.ExecuteScalar()

            ExecuteStoredProcedure_Scalar = idStatus

        End Using
    End Function

    Public Shared Function ExecuteStoredProcedure_Scalar(ByVal nameStoredProcedure As String, nameConnections As String,
                                                   myVariable1 As String, myParameter1 As Date,
                                                   myVariable2 As String, myParameter2 As String) As String

        Dim connection As New SqlConnection(nameConnections)
        Using connection
            connection.Open()
            Dim command As New SqlCommand(nameStoredProcedure, connection)
            command.CommandType = CommandType.StoredProcedure

            command.Parameters.AddWithValue(myVariable1, myParameter1)
            command.Parameters.AddWithValue(myVariable2, myParameter2)

            Dim idStatus As String = command.ExecuteScalar()

            ExecuteStoredProcedure_Scalar = idStatus

        End Using
    End Function

    Public Shared Function ExecuteStoredProcedure_Scalar(ByVal nameStoredProcedure As String, nameConnections As String,
                                                       myVariable1 As String, myParameter1 As String,
                                                       myVariable2 As String, myParameter2 As String,
                                                       myVariable3 As String, myParameter3 As String) As String

        Dim connection As New SqlConnection(nameConnections)
        Using connection
            connection.Open()
            Dim command As New SqlCommand(nameStoredProcedure, connection)
            command.CommandType = CommandType.StoredProcedure

            command.Parameters.AddWithValue(myVariable1, myParameter1)
            command.Parameters.AddWithValue(myVariable2, myParameter2)
            command.Parameters.AddWithValue(myVariable3, myParameter3)

            Dim idStatus As String = command.ExecuteScalar()

            ExecuteStoredProcedure_Scalar = idStatus

        End Using
    End Function

    Public Shared Function ExecuteStoredProcedure_Scalar(ByVal nameStoredProcedure As String, nameConnections As String,
                                                       myVariable1 As String, myParameter1 As String,
                                                       myVariable2 As String, myParameter2 As String,
                                                       myVariable3 As String, myParameter3 As String,
                                                       myVariable4 As String, myParameter4 As String) As String

        Dim connection As New SqlConnection(nameConnections)
        Using connection
            connection.Open()
            Dim command As New SqlCommand(nameStoredProcedure, connection)
            command.CommandType = CommandType.StoredProcedure

            command.Parameters.AddWithValue(myVariable1, myParameter1)
            command.Parameters.AddWithValue(myVariable2, myParameter2)
            command.Parameters.AddWithValue(myVariable3, myParameter3)
            command.Parameters.AddWithValue(myVariable4, myParameter4)

            Dim idStatus As String = command.ExecuteScalar()

            ExecuteStoredProcedure_Scalar = idStatus

        End Using
    End Function

    Public Shared Function ExecuteStoredProcedure_Scalar(ByVal nameStoredProcedure As String, nameConnections As String,
                                                   myVariable1 As String, myParameter1 As Byte,
                                                   myVariable2 As String, myParameter2 As Date,
                                                   myVariable3 As String, myParameter3 As Byte,
                                                   myVariable4 As String, myParameter4 As Byte,
                                                   myVariable5 As String, myParameter5 As Byte) As String

        Dim connection As New SqlConnection(nameConnections)
        Using connection
            connection.Open()
            Dim command As New SqlCommand(nameStoredProcedure, connection)
            command.CommandType = CommandType.StoredProcedure

            command.Parameters.AddWithValue(myVariable1, myParameter1)
            command.Parameters.AddWithValue(myVariable2, myParameter2)
            command.Parameters.AddWithValue(myVariable3, myParameter3)
            command.Parameters.AddWithValue(myVariable4, myParameter4)
            command.Parameters.AddWithValue(myVariable4, myParameter5)

            Dim idStatus As String = command.ExecuteScalar()

            ExecuteStoredProcedure_Scalar = idStatus

        End Using
    End Function



    Public Function GetDataDB_ExecuteScalar_Parameter3(ByVal nameStoredProcedure As String, nameConnections As String,
                                                   myVariable1 As String, myParameter1 As String,
                                                   myVariable2 As String, myParameter2 As String,
                                                   myVariable3 As String, myParameter3 As String) As String

        Dim connection As New SqlConnection(nameConnections)
        Using connection
            connection.Open()
            Dim command As New SqlCommand(nameStoredProcedure, connection)
            command.CommandType = CommandType.StoredProcedure

            command.Parameters.AddWithValue(myVariable1, myParameter1)
            command.Parameters.AddWithValue(myVariable2, myParameter2)
            command.Parameters.AddWithValue(myVariable3, myParameter3)

            Dim idStatus As Boolean = command.ExecuteScalar()

            GetDataDB_ExecuteScalar_Parameter3 = idStatus

        End Using
    End Function

    Public Sub Posto_BuscarDados(ByVal nameStoredProcedure As String, nameConnections As String,
                         myVariable1 As String, myParameter1 As Int16,
                         myVariable2 As String, myParameter2 As Date,
                         myVariable3 As String, myParameter3 As Byte)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)
        command.Parameters.AddWithValue(myVariable3, myParameter3)

        qtde = 0
        vlr = 0


        Try
            connection.Open()
            Dim reader5 As SqlDataReader
            reader5 = command.ExecuteReader()
            While reader5.Read

                'qtde = 0
                'vlr = 0

                qtde = CDbl(reader5.GetSqlMoney(0)).ToString("n2")
                vlr = CDbl(reader5.GetSqlMoney(1)).ToString("n2")

            End While
        Catch ex As Exception
            varDesc = "Classe: Posto_BuscarDados - " & ex.Message
        Finally
            connection.Close()
        End Try
    End Sub


    Public Sub Posto_ExcluirDados(ByVal nameStoredProcedure As String, nameConnections As String,
                   myVariable1 As String, myParameter1 As Int16,
                   myVariable2 As String, myParameter2 As Date)

        Dim connection As New SqlConnection(nameConnections)
        Dim command As New SqlCommand(nameStoredProcedure, connection)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue(myVariable1, myParameter1)
        command.Parameters.AddWithValue(myVariable2, myParameter2)

        Try
            connection.Open()
            command.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = "Classe: Posto_Excluir - " & ex.Message & " - " & myParameter2
        Finally
            connection.Close()
        End Try

    End Sub


End Class
