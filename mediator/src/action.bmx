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


Type TAction

	Const HUNT:Int = 0
	Const TALE:Int = 1
	Const GOLD:Int = 2
	Const ENEMY:Int = 3
	Const NONE:Int = 4

	Function title:String(action:Int)
		Select action
			Case HUNT
				Return "hunted a rabbit"
			Case TALE
				Return "tells a tale"
			Case GOLD
				Return "found gold"
			Case ENEMY
				Return "spotted enemies"
			Case NONE
				Return ""
		End Select
	End Function
	
	Function description:String(action:Int)
		Select action
			Case HUNT
				Return "arrives for dinner"
			Case TALE
				Return "comes to listen"
			Case GOLD
				Return "takes his share of the gold"
			Case ENEMY
				Return "runs for cover"
			Case NONE
				Return ""
		End Select
	End Function

End Type

