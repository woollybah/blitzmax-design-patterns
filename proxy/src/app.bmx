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

Import "wizardtowerproxy.bmx"

' 
' A proxy, in its most general form, is a class functioning as an interface to something else. The
' proxy could interface to anything: a network connection, a large object in memory, a file, or
' some other resource that is expensive or impossible to duplicate. In short, a proxy is a wrapper
' or agent object that is being called by the client to access the real serving object behind the
' scenes.
'
' The Proxy design pattern allows you to provide an interface to other objects by creating a
' wrapper class as the proxy. The wrapper class, which is the proxy, can add additional
' functionality to the object of interest without changing the object's code.
'
' In this example the proxy #TWizardTowerProxy controls access to the actual object #TWizardTower.
' 

Local tower:TWizardTowerProxy = New TWizardTowerProxy
tower.enter(New TWizard("Red wizard"))
tower.enter(New TWizard("White wizard"))
tower.enter(New TWizard("Black wizard"))
tower.enter(New TWizard("Green wizard"))
tower.enter(New TWizard("Brown wizard"))

