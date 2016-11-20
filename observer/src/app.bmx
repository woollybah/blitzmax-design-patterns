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

Import "weather.bmx"
Import "orcs.bmx"
Import "hobbits.bmx"


' 
' The Observer pattern is a software design pattern in which an object, called the subject,
' maintains a list of its dependents, called observers, and notifies them automatically of any
' state changes, usually by calling one of their methods. It is mainly used to implement
' distributed event handling systems. The Observer pattern is also a key part in the familiar
' model–view–controller (MVC) architectural pattern. The Observer pattern is implemented in
' numerous programming libraries and systems, including almost all GUI toolkits.
'
' In this example #TWeather has a state that can be observed. The #TOrcs and
' #THobbits register as observers and receive notifications when the #TWeather changes.
' 

Local weather:TWeather = New TWeather

weather.addObserver(New TOrcs)
weather.addObserver(New THobbits)

weather.timePasses()
weather.timePasses()
weather.timePasses()
weather.timePasses()
