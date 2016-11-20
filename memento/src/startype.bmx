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
bbdoc: StarType enumeration
End Rem
Type TStarType

	Const SUN:Int = 0
	Const RED_GIANT:Int = 1
	Const WHITE_DWARF:Int = 2
	Const SUPERNOVA:Int = 3
	Const DEAD:Int = 4
	Const UNDEFINED:Int = 5
	
	Function title:String(starType:Int)
		Select starType
			Case SUN
				Return "sun"
			Case RED_GIANT
				Return "red giant"
			Case WHITE_DWARF
				Return "white dwarf"
			Case SUPERNOVA
				Return "supernova"
			Case DEAD
				Return "dead"
			Case UNDEFINED
				Return ""
		End Select
	End Function

End Type

