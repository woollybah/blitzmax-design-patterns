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

Import "dwarvencartoperator.bmx"
Import "dwarvengolddigger.bmx"
Import "dwarventunneldigger.bmx"


Rem
bbdoc: TDwarvenGoldmineFacade provides a single interface through which users can operate the subsystems.
about: This makes the goldmine easier to operate and cuts the dependencies from the goldmine user to the subsystems.
End Rem
Type TDwarvenGoldmineFacade

	Field workers:TList
	
	Method New()
		workers = New TList
		workers.AddLast(New TDwarvenGoldDigger)
		workers.AddLast(New TDwarvenCartOperator)
		workers.AddLast(New TDwarvenTunnelDigger)
	End Method

	Method startNewDay()
		makeActions(workers, [TAction.WAKE_UP, TAction.GO_TO_MINE])
	End Method
	
	Method digOutGold()
		makeActions(workers, [TAction.WORK])
	End Method
	
	Method endDay()
		makeActions(workers, [TAction.GO_HOME, TAction.GO_TO_SLEEP])
	End Method
	
	Function makeActions(workers:TList, actions:Int[])
		For Local worker:TDwarvenMineWorker = EachIn workers
			worker.action(actions)
		Next
	End Function

End Type

