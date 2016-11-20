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

Rem
bbdoc: TDwarvenMineWorker is one of the goldmine subsystems.
End Rem
Type TDwarvenMineWorker

	Method goToSleep()
		Print name() + " goes to sleep."
	End Method
	
	Method wakeUp()
		Print name() + " wakes up."
	End Method
	
	Method goHome()
		Print name() + " goes home."
	End Method
	
	Method goToMine()
		Print name() + " goes to the mine."
	End Method
	
	Method action(act:Int)
		Select act
			Case TAction.GO_TO_SLEEP
				goToSleep()
			Case TAction.WAKE_UP
				wakeUp()
			Case TAction.GO_HOME
				goHome()
			Case TAction.GO_TO_MINE
				goToMine()
			Case TAction.WORK
				work()
			Default
				Print "Undefined action"
		End Select
	End Method
	
	Method action(actions:Int[])
		For Local act:Int = EachIn actions
			action(act)
		Next
	End Method
	
	Method work() Abstract
	
	Method name:String() Abstract
	
End Type

Type TAction
	Const GO_TO_SLEEP:Int = 0
	Const WAKE_UP:Int = 1
	Const GO_HOME:Int = 2
	Const GO_TO_MINE:Int = 3
	Const WORK:Int = 4
End Type

