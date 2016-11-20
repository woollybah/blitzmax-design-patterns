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

Import "hostile.bmx"

Rem
bbdoc: SmartHostile is a decorator for #IHostile objects.
about: The calls to the #IHostile interface are intercepted and decorated.
Finally the calls are delegated to the decorated #IHostile object.
End Rem
Type TSmartHostile Implements IHostile

	Field decorated:IHostile
	
	Method New(decorated:IHostile)
		Self.decorated = decorated
	End Method
	
	Method attack()
		Print "It throws a rock at you!"
		decorated.attack()
	End Method
	
	Method getAttackPower:Int()
		' decorated hostile's power + 20 because it is smart
		Return decorated.getAttackPower() + 20
	End Method
	
	Method fleeBattle()
		Print "It calls for help!"
		decorated.fleeBattle()
	End Method

End Type
