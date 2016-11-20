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

Import "dragonslayer.bmx"
Import "meleestrategy.bmx"
Import "projectilestrategy.bmx"
Import "spellstrategy.bmx"

' 
' The Strategy pattern (also known as the policy pattern) is a software design pattern that enables
' an algorithm's behavior to be selected at runtime.
'
' In this example #IDragonSlayingStrategy encapsulates an algorithm. The containing object
' #TDragonSlayer can alter its behavior by changing its strategy.
' 

Print "Green dragon spotted ahead!"
Local dragonSlayer:TDragonSlayer = New TDragonSlayer(New TMeleeStrategy)
dragonSlayer.goToBattle()
Print "Red dragon emerges."
dragonSlayer.changeStrategy(New TProjectileStrategy)
dragonSlayer.goToBattle()
Print "Black dragon lands before you."
dragonSlayer.changeStrategy(New TSpellStrategy)
dragonSlayer.goToBattle()
