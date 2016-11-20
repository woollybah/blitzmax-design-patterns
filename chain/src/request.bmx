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

Import "requesttype.bmx"


Rem
bbdoc: Request
End Rem
Type TRequest

	Rem
	bbdoc: The type of this request, used by each item in the chain to see if they should or can handle this particular request
	End Rem
	Field requestType:Int
	Rem
	bbdoc: A description of the request
	End Rem
	Field requestDescription:String
	Rem
	bbdoc: Indicates if the request is handled or not.
	about: A request can only switch state from unhandled to handled, there's no way to 'unhandle' a request
	End Rem
	Field handled:Int
	
		Rem
		bbdoc: Creates a new request of the given type and accompanying description.
		End Rem
		Method New(requestType:Int, requestDescription:String)
			Self.requestType = requestType
			Self.requestDescription = requestDescription
		End Method

	Rem
	bbdoc: Gets a description of the request
	End Rem
	Method getRequestDescription:String()
		Return requestDescription
	End Method
	
	Rem
	bbdoc: Gets the type of this request, used by each person in the chain of command to see if they should or can handle this particular request
	End Rem
	Method getRequestType:Int()
		Return requestType
	End Method
	
	Rem
	bbdoc: Marks the request as handled
	End Rem
	Method markHandled()
		handled = True
	End Method
	
	Rem
	bbdoc: Indicates if this request is handled or not
	End Rem
	Method isHandled:Int()
		Return handled
	End Method
	
	Method ToString:String()
		Return getRequestDescription()
	End Method
	
End Type
