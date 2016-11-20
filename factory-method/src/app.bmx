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

'
' The Factory Method is a creational design pattern which uses factory methods to deal with the
' problem of creating objects without specifying the exact class of object that will be created.
' This is done by creating objects via calling a factory method either specified in an interface
' and implemented by child classes, or implemented in a base class and optionally overridden by
' derived classes—rather than by calling a constructor.
'
' In this Factory Method example we have an interface IBlacksmith with a method for
' creating objects TBlacksmith#manufactureWeapon. The concrete subclasses 
' TOrcBlacksmith}, TElfBlacksmith then override the method to produce objects of
' their liking.
'

Import "elfblacksmith.bmx"
Import "orcblacksmith.bmx"


' Let's go to war with Orc weapons
Local app:TApp = New TApp(New TOrcBlacksmith)
app.manufactureWeapons()

' Let's go to war with Elf weapons
app = New TApp(New TElfBlacksmith)
app.manufactureWeapons()


Rem
bbdoc: Creates an instance of TApp which will use @blacksmith to manufacture the weapons for war.
about: TApp is unaware which concrete implementation of #IBlacksmith it is using.
The decision of which blacksmith implementation to use may depend on configuration, or the type of rival in war.
End Rem
Type TApp

	Field blacksmith:IBlacksmith
	
	Method New(blacksmith:IBlacksmith)
		Self.blacksmith = blacksmith
	End Method

	Method manufactureWeapons()
		Local weapon:IWeapon
		
		weapon = blacksmith.manufactureWeapon(SPEAR)
		Print weapon.ToString()
		
		weapon = blacksmith.manufactureWeapon(AXE)
		Print weapon.ToString()
		
	End Method

End Type
