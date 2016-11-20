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

Import "elfkingdomfactory.bmx"
Import "orckingdomfactory.bmx"


' 
' The Abstract Factory pattern provides a way to encapsulate a group of individual factories that have a common theme
' without specifying their concrete classes. In normal usage, the client software creates a concrete implementation of
' the abstract factory and then uses the generic interface of the factory to create the concrete objects that are part
' of the theme. The client does not know (or care) which concrete objects it gets from each of these internal
' factories, since it uses only the generic interfaces of their products. This pattern separates the details of
' implementation of a set of objects from their general usage and relies on object composition, as object creation is
' implemented in methods exposed in the factory interface.
'
' The essence of the Abstract Factory pattern is a factory interface #IKingdomFactory and its implementations (
' #TElfKingdomFactory, #TOrcKingdomFactory). The example uses both concrete implementations to create a
' king, a castle and an army.
' 


Local app:TApp = New TApp

Print "Elf Kingdom"
app.createKingdom(New TElfKingdomFactory)
Print app.getArmy().getDescription()
Print app.getCastle().getDescription()
Print app.getKing().getDescription()

Print "~nOrc Kingdom"
app.createKingdom(New TOrcKingdomFactory)
Print app.getArmy().getDescription()
Print app.getCastle().getDescription()
Print app.getKing().getDescription()


Type TApp

	Field king:IKIng
	Field castle:ICastle
	Field army:IArmy
	
	Rem
	bbdoc: Creates kingdom
	End Rem
	Method createKingdom(factory:IKingdomFactory)
		setKing(factory.createKing())
		setCastle(factory.createCastle())
		setArmy(factory.createArmy())
	End Method
	
	Method getKing:IKing(factory:IKingdomFactory)
		factory.createKing()
	End Method
	
	Method getKing:IKing()
		Return king
	End Method
	
	Method setKing(king:IKing)
		Self.king = king
	End Method

	Method getCastle:ICastle(factory:IKingdomFactory)
		factory.createCastle()
	End Method
	
	Method getCastle:ICastle()
		Return castle
	End Method
	
	Method setCastle(castle:ICastle)
		Self.castle = castle
	End Method

	Method getArmy:IArmy(factory:IKingdomFactory)
		factory.createArmy()
	End Method
	
	Method getArmy:IArmy()
		Return army
	End Method
	
	Method setarmy(army:IArmy)
		Self.army = army
	End Method

End Type
