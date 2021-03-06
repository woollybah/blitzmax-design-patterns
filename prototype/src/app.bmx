'
' The MIT License
' Copyright (c) 2014 Ilkka Sepp�l�
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

Import "herofactoryimpl.bmx"
Import "elfmage.bmx"
Import "elfwarlord.bmx"
Import "elfbeast.bmx"
Import "orcmage.bmx"
Import "orcwarlord.bmx"
Import "orcbeast.bmx"

' 
' The Prototype pattern is a creational design pattern in software development. It is used when the
' type of objects to create is determined by a prototypical instance, which is cloned to produce
' new objects. This pattern is used to: - avoid subclasses of an object creator in the client
' application, like the abstract factory pattern does. - avoid the inherent cost of creating a new
' object in the standard way (e.g., using the 'new' keyword)
'
' In this example we have a factory class THeroFactoryImpl producing objects by cloning
' the existing ones. The factory's prototype objects are given as constructor parameters.
' 

Local factory:THeroFactoryImpl
Local mage:TMage
Local warlord:TWarlord
Local beast:TBeast

factory = New THeroFactoryImpl(New TElfMage, New TElfWarlord, New TElfBeast)
mage = factory.createMage()
warlord = factory.createWarlord()
beast = factory.createBeast()
Print mage.ToString()
Print warlord.ToString()
Print beast.ToString()

factory = New THeroFactoryImpl(New TOrcMage, New TOrcWarlord, New TOrcBeast)
mage = factory.createMage()
warlord = factory.createWarlord()
beast = factory.createBeast()
Print mage.ToString()
Print warlord.ToString()
Print beast.ToString()

