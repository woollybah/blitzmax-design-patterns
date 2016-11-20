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
Import "potionfactory.bmx"


Rem
bbdoc: AlchemistShop holds potions on its shelves.
about: It uses #TPotionFactory to provide the potions.
End Rem
Type TAlchemistShop

	Field topShelf:TList
	Field bottomShelf:TList

	Method New()
		topShelf = New TList
		bottomShelf = New TList
		fillShelves()
	End Method
	
	Method fillShelves()
		Local factory:TPotionFactory = New TPotionFactory()
		
		topShelf.AddLast(factory.createPotion(TPotionType.INVISIBILITY))
		topShelf.AddLast(factory.createPotion(TPotionType.INVISIBILITY))
		topShelf.AddLast(factory.createPotion(TPotionType.STRENGTH))
		topShelf.AddLast(factory.createPotion(TPotionType.HEALING))
		topShelf.AddLast(factory.createPotion(TPotionType.INVISIBILITY))
		topShelf.AddLast(factory.createPotion(TPotionType.STRENGTH))
		topShelf.AddLast(factory.createPotion(TPotionType.HEALING))
		topShelf.AddLast(factory.createPotion(TPotionType.HEALING))
		
		bottomShelf.AddLast(factory.createPotion(TPotionType.POISON))
		bottomShelf.AddLast(factory.createPotion(TPotionType.POISON))
		bottomShelf.AddLast(factory.createPotion(TPotionType.POISON))
		bottomShelf.AddLast(factory.createPotion(TPotionType.HOLY_WATER))
		bottomShelf.AddLast(factory.createPotion(TPotionType.HOLY_WATER))

	End Method

	Method getTopShelf:TList()
		Return topShelf
	End Method
	
	Method getBottomShelf:TList()
		Return bottomShelf
	End Method
	
	Method enumerate()
		Print "Enumerating top shelf potions~n"
		
		For Local p:IPotion = EachIn topShelf
			p.drink()
		Next
		
		Print "~nEnumerating bottom shelf potions~n"
		
		For Local p:IPotion = EachIn bottomShelf
			p.drink()
		Next
	End Method

End Type

