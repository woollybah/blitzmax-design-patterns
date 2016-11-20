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

Import BRL.Map

Import "healingpotion.bmx"
Import "holywaterpotion.bmx"
Import "invisibilitypotion.bmx"
Import "poisonpotion.bmx"
Import "strengthpotion.bmx"
Import "potiontype.bmx"


Rem
bbdoc: PotionFactory is the Flyweight in this example.
about: It minimizes memory use by sharing object instances. It holds a map of potion instances and new potions are created only when none of the
type already exists.
End Rem
Type TPotionFactory

	Field potions:TIntMap

	Method New()
		potions = New TIntMap
	End Method

	Method createPotion:IPotion(potionType:Int)
		Local potion:IPotion = IPotion(potions.ValueForKey(potionType))
		If Not potion Then
		
			Select potionType
				Case TPotionType.HEALING
					potion = New THealingPotion
					potions.Insert(potionType, potion)
				Case TPotionType.HOLY_WATER
					potion = New THolyWaterPotion
					potions.Insert(potionType, potion)
				Case TPotionType.INVISIBILITY
					potion = New TInvisibilityPotion
					potions.Insert(potionType, potion)
				Case TPotionType.POISON
					potion = New TPoisonPotion
					potions.Insert(potionType, potion)
				Case TPotionType.STRENGTH
					potion = New TStrengthPotion
					potions.Insert(potionType, potion)
			End Select
		End If
		
		Return potion
	End Method
	
End Type

