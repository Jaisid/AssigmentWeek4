<!DOCTYPE html>
<html>
<head>
    <title>Calculator App</title>

    <style>
        /* ===== Global ===== */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6fb;
        }

        /* ===== Header ===== */
        .header {
            height: 60px;
            background: #007bff;
            color: white;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 20px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.2);
        }

        .header h1 {
            font-size: 20px;
            margin: 0;
        }

        .header .user {
            font-size: 15px;
            font-weight: bold;
        }

        /* ===== Layout Container ===== */
        .container {
            display: flex;
            height: calc(100vh - 60px);
        }

        /* ===== Sidebar ===== */
        .sidebar {
            width: 220px;
            background: #1e1e2f;
            color: white;
            padding: 20px;
        }

        .sidebar h2 {
            font-size: 18px;
            margin-bottom: 20px;
            border-bottom: 1px solid gray;
            padding-bottom: 10px;
        }

        .sidebar a {
            display: block;
            text-decoration: none;
            color: white;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 10px;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background: #007bff;
        }

        /* ===== Main Content ===== */
        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* ===== Calculator Card ===== */
        .form {
            background: white;
            width: 350px;
            padding: 25px;
            border-radius: 15px;

            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15);
        }

        .form h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        input, select {
            width: 100%;
            padding: 10px;
            font-size: 16px;

            border: 1px solid #ccc;
            border-radius: 8px;
            margin-bottom: 15px;
            outline: none;
        }

        input:focus, select:focus {
            border-color: #007bff;
            box-shadow: 0px 0px 5px rgba(0, 123, 255, 0.4);
        }

        input[type="submit"] {
            background: #007bff;
            color: white;
            font-weight: bold;
            cursor: pointer;
            border: none;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: #0056b3;
        }

        /* ===== Result Box ===== */
        .result-box {
            margin-top: 15px;
            padding: 12px;
            background: #e9f7ef;
            border: 1px solid #2ecc71;
            border-radius: 10px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</head>

<body>

    <!-- ===== Header ===== -->
    <div class="header">
        <h1>Calculator Dashboard</h1>
        <div class="user">Welcome, Jai 👋</div>
    </div>

    <!-- ===== Layout ===== -->
    <div class="container">

        <!-- ===== Sidebar ===== -->
        <div class="sidebar">
            <h2>Menu</h2>
            <a href="#">🏠 Programs </a>
            <a href="Assign.cfm">📝 Prime or Not</a>
            <a href="Assign.cfm">📝 Reverse the string</a>
            <a href="Assign.cfm">📝 Palindorm</a>
            <a href="Sorting.cfm">📝 Sorting </a>
        </div>

        <!-- ===== Main Content ===== -->
        <div class="main-content">

            <!-- Calculator Form -->
            <form method="post" class="form">

                <h2>Calculator App</h2>

                <input type="number" name="number1" placeholder="Enter Number 1" required>

                <input type="number" name="number2" placeholder="Enter Number 2" required>

                <select name="operations" required>
                    <option value="">Select Operation</option>
                    <option value="add">ADD</option>
                    <option value="subtract">SUBTRACT</option>
                    <option value="multiply">MULTIPLY</option>
                    <option value="divide">DIVIDE</option>
                </select>

                <input type="submit" value="Calculate">

                <!-- CFML Logic -->
                <cfif structKeyExists(form,"operations")>

                    <cfset num1 = form.number1>
                    <cfset num2 = form.number2>
                    <cfset ops  = form.operations>

                    <cfif ops EQ "add">
                        <cfset result = num1 + num2>

                    <cfelseif ops EQ "subtract">
                        <cfset result = num1 - num2>

                    <cfelseif ops EQ "multiply">
                        <cfset result = num1 * num2>

                    <cfelseif ops EQ "divide">
                        <cfif num2 EQ 0>
                            <cfset result = "Error: Division by zero">
                        <cfelse>
                            <cfset result = num1 / num2>
                        </cfif>
                    </cfif>

                    <cfoutput>
                        <div class="result-box">
                            Result: #result#
                        </div>
                    </cfoutput>

                </cfif>

            </form>

        </div>
    </div>
<cfinclude template="Includes/footer.cfm">
</body>
</html>
