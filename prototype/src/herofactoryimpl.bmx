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

Import "herofactory.bmx"


Rem
bbdoc: Concrete factory class.
End Rem
Type THeroFactoryImpl Implements IHeroFactory

	Field mage:TMage
	Field warlord:TWarlord
	Field beast:TBeast
	
	Rem
	bbdoc: Constructor
	End Rem
	Method New(mage:TMage, warlord:TWarlord, beast:TBeast)
		Self.mage = mage
		Self.warlord = warlord
		Self.beast = beast
	End Method
	
	Rem
	bbdoc: Create mage
	End Rem
	Method createMage:TMage()
		Return mage.clone()
	End Method
	
	Rem
	bbdoc: Create warlord
	End Rem
	Method createWarlord:TWarlord()
		Return warlord.clone()
	End Method
	
	Rem
	bbdoc: Create beast
	End Rem
	Method createBeast:TBeast()
		Return beast.clone()
	End Method

End Type
