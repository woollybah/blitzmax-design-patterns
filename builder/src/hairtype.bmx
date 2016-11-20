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
bbdoc: HairType enumeration
End Rem
Type THairType

	Const BALD:Int = 0
	Const CROP:Int = 1
	Const CURLY:Int = 2
	Const LONG_STRAIGHT:Int = 3
	Const LONG_CURLY:Int = 4

End Type

Function hairTypeToString:String(hairType:Int)
	Select hairType
		Case THairType.BALD
			Return "bald"
		Case THairType.CROP
			Return "crop"
		Case THairType.CURLY
			Return "curly"
		Case THairType.LONG_STRAIGHT
			Return "long straight"
		Case THairType.LONG_CURLY
			Return "long curly"
	End Select
End Function
