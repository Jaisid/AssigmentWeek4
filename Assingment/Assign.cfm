<!DOCTYPE html>
<html>
<head>
    <title>Programs Page</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6fb;
            margin: 20px;
        }

        h1 {
            color: #007bff;
        }

        form {
            background: white;
            padding: 15px;
            margin-bottom: 25px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.15);
        }

        input[type="text"] {
            width: 90%;
            padding: 8px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        input[type="submit"], input[type="button"] {
            padding: 8px 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            background: #007bff;
            color: white;
        }

        input[type="submit"]:hover {
            background: #0056b3;
        }

        .result {
            font-weight: bold;
            margin-top: 10px;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }
    </style>
</head>

<body>

<!-- ===================================================== -->
<!-- ✅ UDF: Reverse String Function -->
<!-- ===================================================== -->
<cffunction name="reverseText" returnType="string">
    <cfargument name="text" type="string" required="yes">

    <cfset var reversed = "">

    <cfloop from="#len(arguments.text)#" to="1" step="-1" index="i">
        <cfset reversed &= mid(arguments.text, i, 1)>
    </cfloop>

    <cfreturn reversed>
</cffunction>


<!-- ===================================================== -->
<!-- ✅ PRIME NUMBER CHECK -->
<!-- ===================================================== -->
<h1>Prime Number Checker</h1>

<form method="post">
    Enter a Number:
    <input type="text" name="num" required>
    <input type="submit" value="Check Prime">
</form>

<cfif structKeyExists(form, "num")>

    <cfset number = val(form.num)>
    <cfset isPrime = true>

    <!--- Prime Logic --->
    <cfif number LTE 1>
        <cfset isPrime = false>
    <cfelse>
        <cfloop from="2" to="#number-1#" index="i">
            <cfif number MOD i EQ 0>
                <cfset isPrime = false>
                <cfbreak>
            </cfif>
        </cfloop>
    </cfif>

    <!--- Output Result --->
    <cfoutput>
        <p class="result #isPrime ? 'success' : 'error'#">
            #number# is 
            <cfif isPrime> a Prime Number ✅ <cfelse> NOT a Prime Number ❌ </cfif>
        </p>
    </cfoutput>

</cfif>


<!-- ===================================================== -->
<!-- ✅ STRING REVERSE -->
<!-- ===================================================== -->
<h1>Reverse a String</h1>

<form method="post">
    Enter a String:
    <input type="text" name="str" required>
    <input type="submit" value="Reverse">
</form>

<cfif structKeyExists(form, "str")>

    <cfset originalString = form.str>
    <cfset reversedString = reverseText(originalString)>

    <cfoutput>
        <p class="result success">
            Original: #originalString#
        </p>
        <p class="result success">
            Reversed: #reversedString#
        </p>
    </cfoutput>

</cfif>


<!-- ===================================================== -->
<!-- ✅ PALINDROME CHECK -->
<!-- ===================================================== -->
<h1>Palindrome Checker</h1>

<form method="post">
    Enter a String:
    <input type="text" name="palindrome" required>
    <input type="submit" value="Check Palindrome">
</form>

<cfif structKeyExists(form, "palindrome")>

    <cfset inputString = form.palindrome>
    <cfset reversedInput = reverseText(inputString)>

    <cfoutput>
        <cfif inputString EQ reversedInput>
            <p class="result success">
                #inputString# is a Palindrome 😊
            </p>
        <cfelse>
            <p class="result error">
                #inputString# is NOT a Palindrome 😔
            </p>
        </cfif>
    </cfoutput>

</cfif>


<!-- ===================================================== -->
<!-- ✅ Back Button -->
<!-- ===================================================== -->
<br>
<input type="button" value="⬅ Go Back" onclick="history.back()">

</body>
</html>
