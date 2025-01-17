Sub moderate_bonus_solution():

    Dim total As Double
    Dim i As Long
    Dim change As Single
    Dim j As Integer
    Dim start As Long
    Dim rowCount As Long
    Dim percentChange As Double
    Dim days As Integer
    Dim dailyChange As Single
    Dim averageChange As Single
    Dim ws As Worksheet

    For Each ws In Worksheets
       
        j = 0
        total = 0
        change = 0
        start = 2
        dailyChange = 0

    
        ws.Range("I1").Value = "Ticker"
        ws.Range("J1").Value = "Yearly Change"
        Range("K1").Value = "Percent Change"
        ws.Range("L1").Value = "Total Stock Volume"

        rowCount = Cells(Rows.Count, "A").End(xlUp).Row

        For i = 2 To rowCount

       
            If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then

             
                total = total + ws.Cells(i, 7).Value

                If total = 0 Then
                    
                    ws.Range("I" & 2 + j).Value = Cells(i, 1).Value
                    ws.Range("J" & 2 + j).Value = 0
                    ws.Range("K" & 2 + j).Value = "%" & 0
                    ws.Range("L" & 2 + j).Value = 0

                Else
                   
                    If ws.Cells(start, 3) = 0 Then
                        For find_value = start To i
                            If ws.Cells(find_value, 3).Value <> 0 Then
                                start = find_value
                                Exit For
                            End If
                        Next find_value
                    End If

                    
                    change = (ws.Cells(i, 6) - ws.Cells(start, 3))
                    percentChange = Round((change / ws.Cells(start, 3) * 100), 2)

                    start = i + 1

                    
                    ws.Range("I" & 2 + j).Value = ws.Cells(i, 1).Value
                    ws.Range("J" & 2 + j).Value = Round(change, 2)
                    ws.Range("K" & 2 + j).Value = "%" & percentChange
                    ws.Range("L" & 2 + j).Value = total

                
                    Select Case change
                        Case Is > 0
                            ws.Range("J" & 2 + j).Interior.ColorIndex = 4
                        Case Is < 0
                            ws.Range("J" & 2 + j).Interior.ColorIndex = 3
                        Case Else
                            ws.Range("J" & 2 + j).Interior.ColorIndex = 0
                    End Select

                End If

            
                total = 0
                change = 0
                j = j + 1
                days = 0
                dailyChange = 0

    
            Else
                total = total + ws.Cells(i, 7).Value

            End If

        Next i

    Next ws

End Sub
