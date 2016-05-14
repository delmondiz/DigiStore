<html class="" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Digital Store Front</title>
    <!-- All the sources needed and try and make it look pretty -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="//blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
    <link rel="stylesheet" href="css/bootstrap-image-gallery.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="../Styles/newcss.css">
    <link rel="stylesheet" href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
    <link href="Style/StyleSheet.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <style>
        body {
            background-image: url('../Images/Storefront1.jpg');
            background-size: 100% 100%;
        }
    </style>
</head>
<body>
    <!-- Creating a nav bar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <!-- Creating the drop down menu in the nav bar -->
        <ul class="dropdown menu" data-dropdown-menu="" role="menubar" data-dropdownmenu="bcfom2-dropdownmenu">
            <a class="navbar-brand" href="Home.aspx">DigiStore</a>
            <li class="has-submenu is-dropdown-submenu-parent is-down-arrow" role="menuitem" tabindex="0" title="Menu" aria-haspopup="true">
                <a href="#" tabindex="-1">Menu</a>
                <!-- Creating the items inside the dropdown menu in the nav bar -->
                <ul class="submenu menu vertical is-dropdown-submenu first-sub" data-submenu="" aria-hidden="true" tabindex="-1" role="menu">
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Login.aspx" tabindex="-1">Login</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="Register.aspx" tabindex="-1">Register</a></li>
                    <li role="menuitem" class="is-submenu-item is-dropdown-submenu-item" tabindex="0"><a href="ContactUs.aspx" tabindex="-1">Contact</a></li>
                </ul>
            </li>
        </ul>

    </nav>
    <br />
    <br />
    <div class="dropdown">
        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="width: 100%; background-color: red;">
            Select Location
    <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" style="width: 100%">
            <li class="text-center"><a href="#">Downtown Toronto</a></li>
            <li class="text-center"><a href="#">Brampton</a></li>
            <li class="text-center"><a href="#">Mississauga</a></li>
            <li class="text-center"><a href="#">Vaughn</a></li>
            <li class="text-center"><a href="#">Bolton</a></li>
            <li class="text-center"><a href="#">North York</a></li>
            <li class="text-center"><a href="#">Oakville</a></li>

        </ul>
    </div>
    

    
   
    <div id="container_demo">
        <div class="col-sm-4">
            <!-- title for this section -->
            <h4 style="color: red;">This Weeks Featured Stores</h4>
            <!-- this is the link to all the picture needed for the display//We can also add them locally to have out own display -->
            <div id="links">
                <a href="https://farm8.static.flickr.com/7111/26273035544_6237d0bbe7_b.jpg" title="Crimson Flower" data-gallery="">
                    <img src="https://farm8.static.flickr.com/7111/26273035544_6237d0bbe7_s.jpg" class="img-circle"></a><a href="https://farm8.static.flickr.com/7459/26614132050_605033e9d4_b.jpg" title="Shine a Light - Explore # 2" data-gallery=""><img src="https://farm8.static.flickr.com/7459/26614132050_605033e9d4_s.jpg" class="img-circle"></a><a href="https://farm8.static.flickr.com/7635/26859074676_bce1f41fcf_b.jpg" title="Happy Mother's Day!!!" data-gallery=""><img src="https://farm8.static.flickr.com/7635/26859074676_bce1f41fcf_s.jpg" class="img-circle"></a><a href="https://farm8.static.flickr.com/7548/26844176656_9aa41bfb27_b.jpg" title="Country Road Killdeer" data-gallery=""><img src="https://farm8.static.flickr.com/7548/26844176656_9aa41bfb27_s.jpg" class="img-circle"></a><a href="https://farm8.static.flickr.com/7691/26860556426_1c9990f48a_b.jpg" title="Blue Moon Butterfly" data-gallery=""><img src="https://farm8.static.flickr.com/7691/26860556426_1c9990f48a_s.jpg" class="img-circle"></a><a href="https://farm8.static.flickr.com/7001/26614711280_b0553988a2_b.jpg" title="Golden" data-gallery=""><img src="https://farm8.static.flickr.com/7001/26614711280_b0553988a2_s.jpg" class="img-circle"></a><a href="https://farm8.static.flickr.com/7580/26283695194_16345a4f4e_b.jpg" title="Muttertag" data-gallery=""><img src="https://farm8.static.flickr.com/7580/26283695194_16345a4f4e_s.jpg" class="img-circle"></a>
                <div id="blueimp-gallery" class="blueimp-gallery">
                    <!-- The container for the modal slides -->
                    <div class="slides"></div>
                    <!-- Controls for the borderless lightbox -->
                    <h3 class="title"></h3>
                    <a class="prev">‹</a>
                    <a class="next">›</a>
                    <a class="close">×</a>
                    <a class="play-pause"></a>
                    <ol class="indicator"></ol>
                    <!-- The modal dialog, which will be used to wrap the lightbox content -->
                    <div class="modal fade">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" aria-hidden="true">×</button>
                                    <h4 class="modal-title"></h4>
                                </div>
                                <div class="modal-body next"></div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default pull-left prev">
                                        <i class="glyphicon glyphicon-chevron-left"></i>
                                        Previous
                                    </button>
                                    <button type="button" class="btn btn-primary next">
                                        Next
                        <i class="glyphicon glyphicon-chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>




                <br>
            </div>
        </div>
        <div class="col-sm-4">
            <h4 style="color: red;">Can Do Something With this Column</h4>
        </div>


    </div>



    <!--simple footer  -->
    <footer>
        <div id="navcontainer">
            <ul id="navlist">
                <li id="active"><a href="#" id="current">Contact</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Employment</a></li>
                <li><a href="#">Legal</a></li>
            </ul>
        </div>
    </footer>
    <!-- more source codes needed to make page look pretty  -->
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
    <script>
        $(document).foundation();
    </script>
    <script type="text/javascript" src="https://intercom.zurb.com/scripts/zcom.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="//blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
    <script src="js/bootstrap-image-gallery.min.js"></script>


</body>
</html>
