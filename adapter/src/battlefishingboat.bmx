'
' The MIT License
' Copyright (c) 2014 Ilkka Sepp�l�
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

Import "battleship.bmx"
Import "fishingboat.bmx"

Rem
bbdoc: Adapter class.
about: Adapts the interface of the device #TFishingBoat into #IBattleShip interface expected by the client #TCaptain}).
In this case we added a new function fire to suit the interface. We are reusing the #TFishingBoat without changing itself.
The Adapter class can just map the functions of the Adaptee or add, delete features of the Adaptee.
End Rem
Type TBattleFishingBoat Implements IBattleShip

	Field boat:TFishingBoat
	
	Method New()
		boat = New TFishingBoat
	End Method
	
	Method fire()
		Print "fire!"
	End Method
	
	Method move()
		boat.sail()
	End Method

End Type

