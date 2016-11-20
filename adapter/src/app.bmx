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

Import "captain.bmx"
Import "battlefishingboat.bmx"


'
' An adapter helps two incompatible interfaces to work together. This is the real world definition
' for an adapter. Interfaces may be incompatible but the inner functionality should suit the need.
' The Adapter design pattern allows otherwise incompatible classes to work together by converting
' the interface of one class into an interface expected by the clients.
'
' There are two variations of the Adapter pattern: The class adapter implements the adaptee's
' interface whereas the object adapter uses composition to contain the adaptee in the adapter
' object. This example uses the object adapter approach.
'
' The Adapter #TBattleFishingBoat converts the interface of the adaptee class 
' #TFishingBoat into a suitable one expected by the client #IBattleShip.
'
' The story of this implementation is this. <br>
' Pirates are coming! we need a #IBattleShip to fight! We have a #TFishingBoat and our
' captain. We have no time to make up a new ship! we need to reuse this #TFishingBoat. The
' captain needs a battleship which can fire and move. The spec is in #IBattleShip. We will
' use the Adapter pattern to reuse #TFishingBoat.
'

Local captain:TCaptain = New TCaptain(New TBattleFishingBoat)

captain.move()
captain.fire()
