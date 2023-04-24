Imports System
Imports System.Collections.Generic
Imports Twilio
Imports Twilio.Rest.Api.V2010.Account
Imports Twilio.Types


Partial Class MemberPages_Default6
    Inherits System.Web.UI.Page


    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click


        Dim accountSid = "ACb135a19b9b43f5c0fcb64981a26b05dd"
        Dim authToken = "35a96697a2c7ce1646518006f013a806"
        TwilioClient.Init(accountSid, authToken)
        Dim messageOptions = New CreateMessageOptions(New PhoneNumber("whatsapp:+554196718959"))
        messageOptions.From = New PhoneNumber("whatsapp:+14155238886")
        messageOptions.Body = "Your appointment is coming up on July 21 at 3PM Eliseu"
        Dim message = MessageResource.Create(messageOptions)
        Console.WriteLine(message.Body)

    End Sub
End Class
