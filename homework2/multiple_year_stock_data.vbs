Sub sum_vol()

'define variables
Dim total_vol As Double     ' temporary variable for the sum of vol
Dim current_row As Double   ' current row for test
Dim ticker_row As Double    ' position from ticker list
Dim last_pos As Double      ' last position of ticker list
Dim open_value As Double    ' temporary variable for open value

' default values
total_vol = 0
current_row = 2
last_pos = Cells(Rows.Count, 9).End(xlUp).Row
open_value = Cells(2, 3).Value

'generate ticker list
Columns("I").Value = Columns("A").Value
Columns("I").SpecialCells(2).RemoveDuplicates Columns:=1, Header:=xlYes

'generate header
Cells(1, 9).Value = "Ticker"
Cells(1, 10).Value = "Yearly Change"
Cells(1, 11).Value = "Percent Change"
Cells(1, 12).Value = "Total Stock Volume"



For ticker_row = 2 To last_pos
    Do While Cells(current_row, 1).Value = Cells(ticker_row, 9).Value
        ' calculate yearly change
        Cells(ticker_row, 10).Value = Cells(current_row, 6) - open_value
        Cells(ticker_row, 11).Value = (Cells(current_row, 6) - open_value) / open_value
        
    
        'calculate sum of vol
        total_vol = total_vol + Cells(current_row, 7).Value
        Cells(ticker_row, 12).Value = total_vol
        current_row = current_row + 1
    Loop
    
    open_value = Cells(current_row, 3)
    total_vol = 0
    
Next ticker_row

End Sub
    