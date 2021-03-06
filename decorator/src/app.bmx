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

Import "smarthostile.bmx"
Import "troll.bmx"

'
' The Decorator pattern is a more flexible alternative to subclassing. The Decorator 
' implements the same interface as the target and uses aggregation to "decorate" calls to the
' target. Using the Decorator pattern it is possible to change the behavior of the class during
' runtime.
'
' In this example we show how the simple TTroll first attacks and then flees the battle.
' Then we decorate the TTroll with a TSmartHostile and perform the attack again. You
' can see how the behavior changes after the decoration.
'


' simple troll
Print "A simple looking troll approaches."
Local troll:IHostile = New TTroll
troll.attack()
troll.fleeBattle()
Print "Simple troll power " + troll.getAttackPower() + "."


' change the behavior of the simple troll by adding a decorator
Print "~nA smart looking troll surprises you."
Local smart:IHostile = New TSmartHostile(troll)
smart.attack()
smart.fleeBattle()
Print "Smart troll power " + smart.getAttackPower() + "."


