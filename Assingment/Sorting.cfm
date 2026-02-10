<html>
    <head>
        <title> List Page </title>    
    </head>

    <body>
        <h1>Sorting Array and List</h1>
        <cfset myArray = [5, 2, 9, 1, 5, 6]>
        <cfset n = arrayLen(myArray)>
        <cfloop from = "1" to ="#n#" index="i">
            <cfloop from = "1" to =#n-i# index="j">
                <cfif myarray[j] GT myarray[j+1]>
                    <cfset temp = myArray[j]>
                    <cfset myArray[j]= myArray[j+1]>
                    <cfset myArray[j+1]= temp>
                </cfif>
            </cfloop> 
        </cfloop>
        <cfoutput>
            <p>Sorted Array: 
            <cfloop index="k" from="1" to="#n#">
                #myArray[k]# 
            </cfloop>
            </p>
        </cfoutput>
        <cfset SortedList = arrayToList(myArray)>
        <cfoutput>
            <p>Sorted List: #SortedList#</p>    
        </cfoutput>

        

        <cfloop index="k" from="1" to="#n#">
            <cfoutput>
                <p>Sorted Array from List: #SortedList[k]#</p>
            </cfoutput>
        </cfloop>
    </body>