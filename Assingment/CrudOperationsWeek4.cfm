<html>
    <head>
        <title style="text-align:center">Crud Operation</title>
        <style>
           .btnInsert{
            width:50%;
            height:30px;
            margin-left:80px;
            background:blue;
            color:white;
            border-radius:3px

           }
           .btnUpdate{
            width:70px;
            height:30px;
            background:blue;
            color:white;
            border-radius:3px;
           }
            .btnCount{
            width:70px;
            height:30px;
            background:blue;
            color:white;
            border-radius:3px;
            margin-top:10px;
            margin-left:270px;
           }
           .btnDelete {
            width:70px;
            height:30px;
            background:red;
            color:white;
            border-radius:3px;
           }

           .btnInsert[type="submit"]:hover{
            transform :scale(1.1);
            background:rgb(14, 11, 173);
            cursor:pointer;
            transition:0.3s;
            color:black;
           }
           .btnUpdate[type="submit"]:hover{
            transform :scale(1.1);
            background:rgb(14, 11, 173);
            cursor:pointer;
            transition:0.3s;
            color:black;
           }
           .btnCount[type="submit"]:hover{
            transform :scale(1.1);
            background:rgb(14, 11, 173);
            cursor:pointer;
            transition:0.3s;
            color:black;
           }
           .btnDelete[type="submit"]:hover{
            transform :scale(1.1);
            background:rgb(241, 4, 4);
            cursor:pointer;
            transition:0.3s;
            color:black;
           }
           .inputData{
            width:100%;
            padding:8px;
            margin:8px
           }
           .form{
            border:1px solid #ccc;
            padding:20px;
            width:380px;
            margin:auto;
            margin-top:100px;
            border-radius:10px;
            box-shadow: 0px 8px 20px black;
           }
           
        </style>
    </head>
    <body>
        <form method="POST" class="form">
            <input type="text" name="Name" placeholder="Enter the Name" required style="width:100%;padding:8px;margin:8px">
            <input type="Number" name="Age" placeholder="Enter the Age" required style="width:100%;padding:8px;margin:8px">
            <input type="submit" name="action" value="Insert" class="btnInsert">
        </form>
         <!--- -----------------Insert data------------------------ --->
         <cfset errorMsg = "">

<cfif structKeyExists(form,"action") AND form.action EQ "Insert">

    <!--- Validate Name: Only letters allowed --->  
    <cfif NOT reFind("^[A-Za-z ]+$", trim(form.Name))>

        <cfset errorMsg = "❌ Name must contain only letters (A-Z).">

    <cfelse>

        <!--- Insert into Database --->  
        <cfquery datasource="Simple_data">
            INSERT INTO Students1 (Name, Age)
            VALUES (
                <cfqueryparam value="#form.Name#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#form.Age#" cfsqltype="cf_sql_integer">
            )
        </cfquery>

        <script>
            alert("✅ Student Inserted Successfully!");
        </script>

    </cfif>

</cfif>


        <!--- -----------------Update data------------------->
        <cfif structKeyExists(form,"action")AND form.action EQ "Update">
                <cfstoredproc procedure="UpdateStuData" datasource="Simple_Data">
                    <cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" value="#form.id#">
                    <cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" value="#form.Name#">
                    <cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" value="#form.Age#">
                </cfstoredproc>
            <script>
                alert("✅ Student data Updated Successfully!")
            </script>
        </cfif>

        <!--- -----------------Delete data------------------->
        <cfif structKeyExists(form,"action") AND form.action EQ "Delete">

        <cfstoredproc procedure="DeleteStudData" datasource="Simple_data">
            <cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" value="#form.id#">
        </cfstoredproc>

        <script>alert("Deleted Successfully!")</script>
        </cfif>


        <!------------Display data from table----------> 
        <h1 style="text-align:center">Display data </h1>
            <cfstoredproc procedure="GetAllStudentData" datasource="Simple_data">
                <cfprocresult name="getStu">
            </cfstoredproc>
      

<table border="1" style="width:800px;text-align:center;margin:auto; box-shadow:0px 8px 20px black">
            <tr style="background:#007bff;color:white;">
                <th>StudentID</th>
                <th>StudentName</th>
                <th>StudentAge</th>
                <th>Operation</th>
            </tr>
                    <cfoutput query="getStu">
                <form method="post">
                <tr>
                    <td>#ID#</td>

                    <td>
                        <input type="text" name="Name" value="#Name#"
                            style="border:none;width:100%;text-align:center;">
                    </td>

                    <td>
                        <input type="number" name="Age" value="#val(Age)#"
                            style="border:none;width:100%;text-align:center;">
                    </td>

                    <td>
                        <input type="hidden" name="id" value="#ID#">

                        <input type="submit" name="action" value="Update" class="btnUpdate">
                        <input type="submit" name="action" value="Delete" class="btnDelete"
                        onclick="return confirm('Are you sure you want to delete?');">
                    </td>
                </tr>
                </form>
                </cfoutput>

</table>

    <form method="post">
        <input type="submit" name="action" value="GetCount" class="btnCount">
    </form>

    <cfif structKeyExists(form,"action") AND form.action EQ "GetCount">
        <cfstoredproc procedure="Total_Count" datasource="Simple_data">
            <cfprocresult name="ResultCount">
        </cfstoredproc>
         <cfoutput>
        <div style="text-align:center;
                    margin-top:20px;
                    font-size:20px;
                    font-weight:bold;
                    color:green;">
            Total Records: #ResultCount.TOTAL_COUNT#
        </div>
    </cfoutput>
    </cfif>
    </body>
</html>