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

Import "itemiterator.bmx"


Rem
bbdoc: TreasureChest, the collection class.
End Rem
Type TTreasureChest

	Field items:TList
	
	Method New()
		items = New TList
		items.AddLast(New TItem(TItemType.POTION, "Potion of courage"))
		items.AddLast(New TItem(TItemType.RING, "Ring of shadows"))
		items.AddLast(New TItem(TItemType.POTION, "Potion of wisdom"))
		items.AddLast(New TItem(TItemType.POTION, "Potion of blood"))
		items.AddLast(New TItem(TItemType.WEAPON, "Sword of silver +1"))
		items.AddLast(New TItem(TItemType.POTION, "Potion of rust"))
		items.AddLast(New TItem(TItemType.POTION, "Potion of healing"))
		items.AddLast(New TItem(TItemType.RING, "Ring of armor"))
		items.AddLast(New TItem(TItemType.WEAPON, "Steel halberd"))
		items.AddLast(New TItem(TItemType.WEAPON, "Dagger of poison"))
	End Method
	
	Method iterator:IItemIterator(itemType:Int)
		Return New TTreasureChestItemIterator(Self, itemType)
	End Method
	
	Method getItems:TList()
		Return items.Copy()
	End Method


End Type



Type TTreasureChestItemIterator Implements IItemIterator

	Field chest:TTreasureChest
	Field index:Int
	Field itemType:Int

	Method New(chest:TTreasureChest, itemType:Int)
		Self.chest = chest
		Self.itemType = itemType
		index = -1
	End Method
	
	Method hasNext:Int()
		Return findNextIndex() <> -1
	End Method
	
	Method nextItem:TItem()
		index = findNextIndex()
		If index <> -1 Then
			Return TItem(chest.getItems().ValueAtIndex(index))
		End If
		Return Null
	End Method
	
	Method findNextIndex:Int()
		Local items:TList = chest.getItems()
		Local found:Int
		Local tempIndex:Int = index
		
		While Not found
		
			tempIndex :+ 1
			
			If tempIndex >= items.Count() Then
				tempIndex = -1
				Exit
			End If
			
			If (itemType = TItemType.ANY) Or (TItem(items.ValueAtIndex(tempIndex)).getType() = itemType) Then
				found = True
			End If
		
		Wend
		
		Return tempIndex
	End Method

End Type

