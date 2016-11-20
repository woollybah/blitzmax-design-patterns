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

Import BRL.LinkedList

Import "command.bmx"


Rem
bbdoc: Wizard is the invoker of the commands
End Rem
Type TWizard

	Field undoStack:TList = New TList
	Field redoStack:TList = New TList

	Rem
	bbdoc: Cast spell
	End Rem
	Method castSpell(command:TCommand, target:TTarget)
		Print ToString() + " casts " + command.ToString() + " at " + target.ToString()
		command.execute(target)
		undoStack.addLast(command)
	End Method
	
	Rem
	bbdoc: Undo last spell
	End Rem
	Method undoLastSpell()
		If Not undoStack.IsEmpty() Then
			Local previousSpell:TCommand = TCommand(undoStack.RemoveLast())
			redoStack.addLast(previousSpell)
			Print ToString() + " undoes " + previousSpell.ToString()
			previousSpell.undo()
		End If
	End Method
	
	Rem
	bbdoc: Redo last spell
	End Rem
	Method redoLastSpell()
		If Not redoStack.IsEmpty() Then
			Local previousSpell:TCommand = TCommand(redoStack.RemoveLast())
			undoStack.addLast(previousSpell)
			Print ToString() + " redoes " + previousSpell.ToString()
			previousSpell.redo()
		End If
	End Method
	
	Method ToString:String()
		Return "Wizard"
	End Method
	
End Type

