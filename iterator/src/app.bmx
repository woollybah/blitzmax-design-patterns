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

Framework BRL.Standardio

Import "treasurechest.bmx"


' 
' The Iterator pattern is a design pattern in which an iterator is used to traverse a container and
' access the container's elements. The Iterator pattern decouples algorithms from containers.
'
' In this example the Iterator #IItemIterator adds abstraction layer on top of a collection
' #TTreasureChest. This way the collection can change its internal implementation without
' affecting its clients.
' 

Local chest:TTreasureChest = New TTreasureChest

Local ringIterator:IItemIterator = chest.iterator(TItemType.RING)
While ringIterator.hasNext()
	Print ringIterator.nextItem().ToString()
Wend

Print "----------"

Local potionIterator:IItemIterator = chest.iterator(TItemType.POTION)
While potionIterator.hasNext()
	Print potionIterator.nextItem().ToString()
Wend

Print "----------"

Local weaponIterator:IItemIterator = chest.iterator(TItemType.WEAPON)
While weaponIterator.hasNext()
	Print weaponIterator.nextItem().ToString()
Wend

Print "----------"

Local it:IItemIterator = chest.iterator(TItemType.ANY)
While it.hasNext()
	Print it.nextItem().ToString()
Wend

