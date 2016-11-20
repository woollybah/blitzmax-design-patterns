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

Import "blindingmagicweapon.bmx"
Import "flyingmagicweapon.bmx"
Import "souleatingmagicweapon.bmx"
Import "excalibur.bmx"
Import "mjollnir.bmx"
Import "stormbringer.bmx"

' 
' The Bridge pattern can also be thought of as two layers of abstraction. With Bridge, you can
' decouple an abstraction from its implementation so that the two can vary independently.
'
' In Bridge pattern both abstraction #TMagicWeapon and implementation 
' #TMagicWeaponImpl have their own class hierarchies. The interface of the implementations
' can be changed without affecting the clients.
' 


Local blindingMagicWeapon:TBlindingMagicWeapon = New TBlindingMagicWeapon(New TExcalibur)
blindingMagicWeapon.wield()
blindingMagicWeapon.blind()
blindingMagicWeapon.swing()
blindingMagicWeapon.unwield()

Local flyingMagicWeapon:TFlyingMagicWeapon = New TFlyingMagicWeapon(New TMjollnir)
flyingMagicWeapon.wield()
flyingMagicWeapon.fly()
flyingMagicWeapon.swing()
flyingMagicWeapon.unwield()

Local soulEatingMagicWeapon:TSoulEatingMagicWeapon = New TSoulEatingMagicWeapon(New TStormbringer)
soulEatingMagicWeapon.wield()
soulEatingMagicWeapon.swing()
soulEatingMagicWeapon.eatSoul()
soulEatingMagicWeapon.unwield()

