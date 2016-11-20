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

Import "profession.bmx"
Import "hairtype.bmx"
Import "haircolor.bmx"
Import "weapon.bmx"
Import "armor.bmx"


Rem
bbdoc: Hero, the class with many parameters.
End Rem
Type THero Final

	Field profession:Int
	Field name:String
	Field hairType:Int
	Field hairColor:Int
	Field armor:Int
	Field weapon:Int
	
	Method New(builder:THeroBuilder)
		Self.profession = builder.profession
		Self.name = builder.name
		Self.hairColor = builder.hairColor
		Self.hairType = builder.hairType
		Self.weapon = builder.weapon
		Self.armor = builder.armor
	End Method

	Method getProfession:Int()
		Return profession
	End Method
	
	Method getName:String()
		Return name
	End Method
	
	Method getHairType:Int()
		Return hairType
	End Method
	
	Method getHairColor:Int()
		Return hairColor
	End Method
	
	Method getArmor:Int()
		Return armor
	End Method
	
	Method getWeapon:Int()
		Return weapon
	End Method
	
	Method ToString:String()
		Local s:String = "This is a " + professionToString(profession) + " named " + name
		If hairColor  >= 0 Or hairType >= 0 Then
			s :+ " with "
			If hairColor >= 0 Then
				s :+ hairColorToString(hairColor) + " "
			End If
			
			If hairType >= 0 Then
				s :+ hairTypeToString(hairType) + " "
			End If
			
			If hairType <> THairType.BALD Then
				s :+ "hair"
			Else
				s :+ "head"
			End If
		End If
		
		If armor >= 0 Then
			s :+ " wearing " + armorToString(armor)
		End If
		
		If weapon >= 0 Then
			s :+ " and wielding a " + weaponToString(weapon)
		End If
		
		s :+ "."
		
		Return s
	End Method
	
End Type


Rem
bbdoc: The builder class.
End Rem
Type THeroBuilder

	Field profession:Int
	Field name:String
	Field hairType:Int = -1
	Field hairColor:Int = -1
	Field armor:Int = -1
	Field weapon:Int = -1

	Method New(profession:Int = -1, name:String = Null)
		If profession < 0 Or Not name Then
			Throw TRuntimeException.Create("profession and name can not be null")
		End If
		
		Self.profession = profession
		Self.name = name
	End Method

	Method withHairType:THeroBuilder(hairType:Int)
		Self.hairType = hairType
		Return Self
	End Method
	
	Method withHairColor:THeroBuilder(hairColor:Int)
		Self.hairColor = hairColor
		Return Self
	End Method
	
	Method withArmor:THeroBuilder(armor:Int)
		Self.armor = armor
		Return Self
	End Method
	
	Method withWeapon:THeroBuilder(weapon:Int)
		Self.weapon = weapon
		Return Self
	End Method
	
	Method build:THero()
		Return New THero(Self)
	End Method
	
End Type
