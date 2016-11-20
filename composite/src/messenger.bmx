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

Import "sentence.bmx"


Rem
bbdoc: Messenger
End Rem
Type TMessenger

	Method messageFromOrcs:TLetterComposite()
		Local words:TList = New TList
		
		words.AddLast(New TWord([New TLetter(Asc("W")), New TLetter(Asc("h")), New TLetter(Asc("e")), New TLetter(Asc("r")), New TLetter(Asc("e"))]))
		words.AddLast(New TWord([New TLetter(Asc("t")), New TLetter(Asc("h")), New TLetter(Asc("e")), New TLetter(Asc("r")), New TLetter(Asc("e"))]))
		words.AddLast(New TWord([New TLetter(Asc("i")), New TLetter(Asc("s"))]))
		words.AddLast(New TWord([New TLetter(Asc("a"))]))
		words.AddLast(New TWord([New TLetter(Asc("w")), New TLetter(Asc("h")), New TLetter(Asc("i")), New TLetter(Asc("p"))]))
		words.AddLast(New TWord([New TLetter(Asc("t")), New TLetter(Asc("h")), New TLetter(Asc("e")), New TLetter(Asc("r")), New TLetter(Asc("e"))]))
		words.AddLast(New TWord([New TLetter(Asc("i")), New TLetter(Asc("s"))]))
		words.AddLast(New TWord([New TLetter(Asc("a"))]))
		words.AddLast(New TWord([New TLetter(Asc("w")), New TLetter(Asc("a")), New TLetter(Asc("y"))]))
		
		Return New TSentence(words)
	End Method

	Method messageFromElves:TLetterComposite()
		Local words:TList = New TList
		
		words.AddLast(New TWord([New TLetter(Asc("M")), New TLetter(Asc("u")), New TLetter(Asc("c")), New TLetter(Asc("h"))]))
		words.AddLast(New TWord([New TLetter(Asc("w")), New TLetter(Asc("i")), New TLetter(Asc("n")), New TLetter(Asc("d"))]))
		words.AddLast(New TWord([New TLetter(Asc("p")), New TLetter(Asc("o")), New TLetter(Asc("u")), New TLetter(Asc("r")), New TLetter(Asc("s"))]))
		words.AddLast(New TWord([New TLetter(Asc("f")), New TLetter(Asc("r")), New TLetter(Asc("o")), New TLetter(Asc("m"))]))
		words.AddLast(New TWord([New TLetter(Asc("y")), New TLetter(Asc("o")), New TLetter(Asc("u")), New TLetter(Asc("r"))]))
		words.AddLast(New TWord([New TLetter(Asc("m")), New TLetter(Asc("o")), New TLetter(Asc("u")), New TLetter(Asc("t")), New TLetter(Asc("h"))]))
		
		Return New TSentence(words)
	End Method
	
End Type
