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

Import "ivorytower.bmx"
?threaded
Import "threadsafedoublechecklocking.bmx"
?


'
' Singleton pattern ensures that the class can have only one existing instance and provides global access to it.
'
' There are many ways to implement the Singleton. The first one is the eagerly initialized instance
' in #TIvoryTower. Eager initialization implies that the implementation is thread safe. If
' you can afford giving up control of the instantiation moment, then this implementation will suit
' you fine.
'

'eagerly initialized singleton
Local ivoryTower1:TIvoryTower = TIvoryTower.getInstance()
Local ivoryTower2:TIvoryTower = TIvoryTower.getInstance()
Print "ivoryTower1 = " + ivoryTower1.ToString()
Print "ivoryTower2 = " + ivoryTower2.ToString()


?threaded
' double checked locking
Local dcl1:TThreadSafeDoubleCheckLocking = TThreadSafeDoubleCheckLocking.getInstance()
Print "dcl1 = " + dcl1.ToString()
Local dcl2:TThreadSafeDoubleCheckLocking = TThreadSafeDoubleCheckLocking.getInstance()
Print "dcl2 = " + dcl2.ToString()
?


