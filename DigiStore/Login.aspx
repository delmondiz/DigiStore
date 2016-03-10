<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DigiStore.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Foundation Starter Template</title>
    <link rel="stylesheet" href="css/foundation.css" />

    <script src="js/vendor/jquery.min.js"></script>
    <script src="js/vendor/what-input.min.js"></script>
    <script src="js/foundation.min.js"></script>

</head>
<body>
    <div class="large-3 large-centered columns">
        <div class="login-box">
            <div class="row">
                <div class="large-12 columns">
                    <form>
                        <div class="row">
                            <div class="large-12 columns">
                                <input type="text" name="username" placeholder="Username" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-12 columns">
                                <input type="password" name="password" placeholder="Password" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-12 large-centered columns">
                                <input type="submit" class="button expand" value="Log In" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
