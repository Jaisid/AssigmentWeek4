<html>
    <head>
        <title> List Page </title>    
    </head>

    <body>
       <h1>Prime or not</h1>
        <form method="post">
            ENTER A NUMBER:
            <input type="text" name="num" required>
            <input type="submit" value="CHECK">
        </form>

        <cfif structKeyExists(form,"num")>
            <cfset variables.number = form.num>
            <cfset variables.isPrime = true>

            <!--- Any number less then 1 is not prime --->
            <cfif variables.number LTE 1>
                <cfset variables.isPrime = false>
            <cfelse>
                <cfloop from="2" to ="#variables.number -1#" index="i">
                    <cfif variables.number MOD i EQ 0>
                        <cfset variables.isPrime = false>
                        <cfbreak>
                    </cfif>
                </cfloop>
            </cfif>
            <cfoutput>
            <cfif variables.isPrime>
                <p style="color:green">#variables.number# is a prime number.</p>
            <cfelse>
                <p style="color:red">#variables.number# is not a prime number.</p>
            </cfif> 
            </cfoutput>
        </cfif>

        <H1>reverse a String</H1>
         <form method="post">
            ENTER A STRING:
            <input type="text" name="str" required>
            <input type="submit" value="REVERSE">
        </form>

        <cfif structKeyExists(form,"str")>
            <cfset variables.originalString = form.str>
            <cfset variables.RevesedString ="">
            <cfloop from ="#len(variables.originalString)#" to="1" step="-1" index="j">
                <cfset variables.RevesedString = variables.RevesedString & Mid(variables.originalString,j,1)>
            </cfloop>
            <cfoutput>
                <p>Original String: #variables.originalString#</p>
                <p>Reversed String: #variables.RevesedString#</p>
            </cfoutput>
        </cfif>

        <cfdump var="#variables#">
        <h1>Palindorm or not</h1>
        <form method="post">
            ENTER A STRING:
            <input type="text" name="palindrome" required>
            <input type="submit" value="CHECK">
        </form>
        <cfif structKeyExists(form,"palindrome")>
            <cfset  variables.inputstring = form.palindrome>
            <cfset variables.reversedstring = "">
            <cfloop from ="#len(variables.inputstring)#" to = "1" step = "-1" index="k">
                <cfset variables.reversedstring = variables.reversedstring & Mid(variables.inputstring,k,1)>
            </cfloop>

            <cfoutput>
                <cfif variables.inputstring EQ variables.reversedstring>
                    <p style="color:green">#variables.inputstring# is a palindrome.😊</p>
                <cfelse>
                    <p style="color:red">#variables.inputstring# is not a palindrome.😔</p>
                </cfif>
            </cfoutput>
        </cfif>

        <input type="button" value="Go Back" onclick="history.back()">
    </body>
</html>
    