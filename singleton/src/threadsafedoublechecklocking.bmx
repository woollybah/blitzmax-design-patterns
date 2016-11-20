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

Import BRL.Threads


Rem
bbdoc: Double check locking
End Rem
Type TThreadSafeDoubleCheckLocking Final

	Private
	
	Global INSTANCE:TThreadSafeDoubleCheckLocking
	Global guard:TMutex = TMutex.Create()

	Method New()
	End Method
	
	Public
	
	Function getInstance:TThreadSafeDoubleCheckLocking()
		
			Local result:TThreadSafeDoubleCheckLocking = INSTANCE
			
			' Check if singleton instance is initialized. If it is initialized then we can return the instance.
			If Not INSTANCE Then
			
				' It is not initialized but we cannot be sure because some other thread might have initialized it
				' in the meanwhile. So to make sure we need to lock on an object to get mutual exclusion.
				guard.Lock()
			
				' Again assign the instance to local variable to check if it was initialized by some other thread
				' while current thread was blocked to enter the locked zone. If it was initialized then we can
				' return the previously created instance just like the previous null check.	
				result = INSTANCE
				
				If Not result Then
					' The instance is still not initialized so we can safely (no other thread can enter this zone)
					' create an instance and make it our singleton instance.
					INSTANCE = New TThreadSafeDoubleCheckLocking
					result = INSTANCE
				End If
				
				guard.UnLock()
			
			End If
		
			Return result
			
	End Function
	

End Type

