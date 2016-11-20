'
' The MIT License
' Copyright (c) 2014 Ilkka Seppälä
' Copyright (c) 2016 Bruce A Henderson
'
' Permission is hereby granted, free of charge, to any person obtaining a copy
' of this software and associated documentation files (the "Software"), to deal
' in the Software without restriction, including without limitation the rights
' to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
' copies of the Software, and to permit persons to whom the Software is
' furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in
' all copies or substantial portions of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
' IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
' FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
' AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
' LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
' OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
' THE SOFTWARE.
'
SuperStrict

Framework BRL.Standardio
Import BRL.LinkedList

Import "plusexpression.bmx"
Import "minusexpression.bmx"
Import "multiplyexpression.bmx"
Import "numberexpression.bmx"

' 
' The Interpreter pattern is a design pattern that specifies how to evaluate sentences in a
' language. The basic idea is to have a class for each symbol (terminal or nonterminal) in a
' specialized computer language. The syntax tree of a sentence in the language is an instance of
' the composite pattern and is used to evaluate (interpret) the sentence for a client.
'
' In this example we use the Interpreter pattern to break sentences into expressions
' TExpression that can be evaluated and as a whole form the result.
' 

Local tokenString:String = "4 3 2 - 1 + *"

Local stack:TList = New TList

Local tokenList:String[] = tokenString.split(" ")

For Local s:String = EachIn tokenList
	If isOperator(s) Then
		Local rightExpression:TExpression = TExpression(stack.RemoveFirst())
		Local leftExpression:TExpression = TExpression(stack.RemoveFirst())
		Print "popped from stack left: " + leftExpression.interpret() + " right: " + rightExpression.interpret()
		
		Local op:TExpression = getOperatorInstance(s, leftExpression, rightExpression)
		Print "operator: " + op.ToString()
		Local result:Int = op.interpret()
		Local resultExpression:TNumberExpression = New TNumberExpression(result)
		stack.AddFirst(resultExpression)
		Print "push result to stack: " + resultExpression.interpret()
	Else
		Local i:TExpression = New TNumberExpression(s)
		stack.AddFirst(i)
		Print "push to stack: " + i.interpret()
	End If
Next

Print "result: " + TExpression(stack.RemoveFirst()).interpret()



Function isOperator:Int(s:String)
	Return s = "+" Or s = "-" Or s = "*"
End Function

Function getOperatorInstance:TExpression(s:String, leftExpression:TExpression, rightExpression:TExpression)
	Select s
		Case "+"
			Return New TPlusExpression(leftExpression, rightExpression)
		Case "-"
			Return New TMinusExpression(leftExpression, rightExpression)
		Case "*"
			Return New TMultiplyExpression(leftExpression, rightExpression)
		Default
			Return New TMultiplyExpression(leftExpression, rightExpression)
	End Select
End Function

