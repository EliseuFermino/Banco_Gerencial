Imports Microsoft.VisualBasic
Imports System.Globalization

Public Class myDateTimes

    ' PRIMEIRO DIA DO MÊS ----
    Public Shared Function GetFirstDayOfMonth(ByVal dtDate As DateTime) As DateTime
        Dim dtFrom As DateTime = dtDate
        dtFrom = dtFrom.AddDays(-(dtFrom.Day - 1))
        Return dtFrom
    End Function

    ' ÚLTIMO DIA DO MÊS ------
    Public Shared Function GetLastDayOfMonth(ByVal dtDate As DateTime) As DateTime
        Dim dtTo As New DateTime(dtDate.Year, dtDate.Month, 1)
        dtTo = dtTo.AddMonths(1)
        dtTo = dtTo.AddDays(-(dtTo.Day))
        Return dtTo

    End Function

    ' PRIMEIRO DIA DO MÊS - ANO ANTERIOR ----
    Public Shared Function GetFirstDayOfMonth_MesAnterior(ByVal dtDate As DateTime) As DateTime
        Dim dtFrom As DateTime = dtDate
        dtFrom = dtFrom.AddDays(-(dtFrom.Day - 1))
        dtFrom = dtFrom.AddMonths(-1)
        Return dtFrom
    End Function

    ' DIA DE ONTEM ----
    Public Shared Function YesterdayDate() As DateTime
        YesterdayDate = DateAdd(DateInterval.Day, -1, DateAndTime.Now())
    End Function

    ' NUMERO DO DIA DA SEMANA ----
    Public Shared Function GetWeekNumber(dtDate As Date) As Byte
        Dim oDb As New clDataDb
        Dim weekNum As Byte = oDb.ExecuteStoredProcedure_Scalar("Date.usp_NumeroDaSemana", Conexao.gerKnowledge_str, "Dia", dtDate)
        Return weekNum
    End Function

    ' PRIMEIRO DIA DA SEMANA ----  
    Public Shared Function FirstDateOfWeek(year As Integer, weekNumber As Integer) As Date
        Dim startDate As New DateTime(year, 1, 1)
        Dim weekDate As DateTime = DateAdd(DateInterval.WeekOfYear, weekNumber - 2, startDate)
        Return DateAdd(DateInterval.Day, (-weekDate.DayOfWeek) + 1, weekDate)
    End Function

    Public Shared Function GetFirstDayOfMonth_baseYearMonth(ByVal iMes As Byte, ByVal iAno As Int16) As Date

        GetFirstDayOfMonth_baseYearMonth = DateSerial(Today.Year, iMes, 1)

    End Function

    Public Shared Function GetFirstDayOfYear_baseYear(ByVal iAno As Int16) As DateTime
        Dim dtFrom As DateTime
        dtFrom = CType("01/01/" & iAno, Date)
        Return dtFrom
    End Function

    Public Function GetLastDayOfMonth_baseYearMonth(ByVal iMes As Byte, ByVal iAno As Int16) As Date

        GetLastDayOfMonth_baseYearMonth = DateSerial(iAno, iMes + 1, 0)

    End Function

    ''' <summary>
    ''' Retorna o Ano Atual. O Ano de hoje
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function YearToday() As Int16
        YearToday = Year(DateAndTime.Today)
    End Function

    ''' <summary>
    ''' Retorna o Ano Anterior
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function YearAA() As Int16
        YearAA = Year(DateAndTime.Today.AddYears(-1))
    End Function




End Class
