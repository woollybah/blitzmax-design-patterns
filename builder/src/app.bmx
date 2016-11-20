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

Import "hero.bmx"

' 
' The intention of the Builder pattern is to find a solution to the telescoping constructor
' anti-pattern. The telescoping constructor anti-pattern occurs when the increase of object
' constructor parameter combination leads to an exponential list of constructors. Instead of using
' numerous constructors, the builder pattern uses another object, a builder, that receives each
' initialization parameter step by step and then returns the resulting constructed object at once.
'
' The Builder pattern has another benefit. It can be used for objects that contain flat data (html
' code, SQL query, X.509 certificate...), that is to say, data that can't be easily edited. This
' type of data cannot be edited step by step and must be edited at once. The best way to construct
' such an object is to use a builder class.
'
' In this example we have the Builder pattern variation as described by Joshua Bloch in Effective
' Java 2nd Edition.
'
' We want to build #THero objects, but its construction is complex because of the many
' parameters needed. To aid the user we introduce #THeroBuilder class. #THeroBuilder
' takes the minimum parameters to build #THero object in its constructor. After that
' additional configuration for the #THero object can be done using the fluent
' #THeroBuilder interface. When configuration is ready the build method is called to receive
' the final #THero object.
' 

Local mage:THero = New THeroBuilder(TProfession.MAGE, "Riobard").withHairColor(THairColor.BLACK).withWeapon(TWeapon.DAGGER).build()
Print mage.ToString()

Local warrior:THero = New THeroBuilder(TProfession.WARRIOR, "Amberjill").withHairColor(THairColor.BLOND).withHairType(THairType.LONG_CURLY).withArmor(TArmor.CHAIN_MAIL).withWeapon(TWeapon.SWORD).build()
Print warrior.ToString()

Local thief:THero = New THeroBuilder(TProfession.THIEF, "Desmond").withHairType(THairType.BALD).withWeapon(TWeapon.BOW).build()
Print thief.ToString()
