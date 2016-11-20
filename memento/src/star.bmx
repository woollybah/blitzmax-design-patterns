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

Import "startype.bmx"
Import "starmemento.bmx"


Rem
bbdoc: Star uses "mementos" to store and restore state.
End Rem
Type TStar

	Field starType:Int
	Field ageYears:Int
	Field massTons:Int
	
	Method New(startType:Int, startAge:Int, startMass:Int)
		Self.starType = startType
		Self.ageYears = startAge
		Self.massTons = startMass
	End Method
	
	Rem
	bbdoc: Makes time pass for the star
	End Rem
	Method timePasses()
		ageYears :* 2
		massTons :* 8
		Select starType
			Case TStarType.RED_GIANT
				starType = TStarType.WHITE_DWARF
			Case TStarType.SUN
				starType = TStarType.RED_GIANT
			Case TStarType.SUPERNOVA
				starType = TStarType.DEAD
			Case TStarType.WHITE_DWARF
				starType = TStarType.SUPERNOVA
			Case TStarType.DEAD
				ageYears :* 2
				massTons = 0
		End Select
	End Method
	
	Method getMemento:IStarMemento()
		Local state:TStarMementoInternal = New TStarMementoInternal
		state.setAgeYears(ageYears)
		state.setMassTons(massTons)
		state.setType(starType)
		Return state
	End Method
	
	Method setMemento(memento:IStarMemento)
		Local state:TStarMementoInternal = TStarMementoInternal(memento)
		starType = state.getType()
		ageYears = state.getAgeYears()
		massTons = state.getMassTons()
	End Method
	
	Method ToString:String()
		Return TStarType.title(starType) + " age: " + ageYears + " years mass: " + massTons + " tons"
	End Method

End Type


Rem
bbdoc: StarMemento implementation
End Rem
Type TStarMementoInternal Implements IStarMemento

	Field starType:Int
	Field ageYears:Int
	Field massTons:Int
	
	Method getType:Int()
		Return starType
	End Method
	
	Method setType(starType:Int)
		Self.starType = starType
	End Method
	
	Method getAgeYears:Int()
		Return ageYears
	End Method
	
	Method setAgeYears(ageYears:Int)
		Self.ageYears = ageYears
	End Method
	
	Method getMassTons:Int()
		Return massTons
	End Method
	
	Method setMassTons(massTons:Int)
		Self.massTons = massTons
	End Method

End Type

