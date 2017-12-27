<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Perspective</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://apis.google.com/js/api:client.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="stilizare.css">

    <script>
        function signOut() {
            var auth2 = gapi.auth2.getAuthInstance();
            auth2.signOut().then(function () {
                console.log('User signed out.');
                sessionStorage.clear();
                window.location = "https://setwfh.appspot.com";
            });
        }
    </script>
    <script>
        $(function(){
            var hash = window.location.hash;
            hash && $('ul.nav a[href="' + hash + '"]').tab('show');

            $('.nav-pills a').click(function (e) {
                $(this).tab('show');
                var scrollmem = $('body').scrollTop() || $('html').scrollTop();
                window.location.hash = this.hash;
                $('html,body').scrollTop(scrollmem);
            });
        });



        function NASort(a, b) {
            if (a.innerHTML == 'Echipa') {
                return 1;
            }
            else if (b.innerHTML == 'Echipa') {
                return -1;
            }
            return (a.innerHTML > b.innerHTML) ? 1 : -1;
        };

        $('select option').sort(NASort).appendTo('select');

    </script>

    <script>
        $(function(){
            var nav = $('#fixme');
            if (nav.length) {
                var stickyHeaderTop = nav.offset().top;

                $(window).scroll(function () {
                    if ($(window).scrollTop() > stickyHeaderTop) {
                        $('#fixme').css({position: 'fixed', top: '0px'});
                        $('#sticky').css('display', 'block');
                        $('#cont').css({'padding-right': '0px','padding-left': '0px','margin-right': '0px', 'margin-left': '0px'});

                    } else {
                        $('#fixme').css({position: 'static', top: '0px'});
                        $('#sticky').css('display', 'none');
                        $('#cont').css({'padding-right': '15px','padding-left': '15px','margin-right': 'auto', 'margin-left': 'auto','width':'78%'});
                    }
                });
            }
        });

    </script>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default navbar-fixed-top ">



    <div class="navbar-header">

        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/home"><img src="iPerformLogo.png" style="margin-top: -14px;height: 46px;"></a>
    </div>


    <div class="collapse navbar-collapse " id="myNavbar">
        <ul class="nav navbar-nav navbar-left">
            <li class="home"><a href="/home">Rezultatele mele</a></li>
            <li class="butonfaq"><a href="/perspective">Perspective</a></li>
            <li class="butonfaq"><a href="/valori">Valori</a></li>
            <c:if test="${not empty verifechipa}">
            <li class="butonfaq"><a href="/echipamea">Echipa Mea</a></li>
            </c:if>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <div class = "row">
                <div class = "col-md-12">
                    <a class="nume"> ${Name}</a>
                </div>

            </div>
            <div class = "row">
                <div class = "col-md-12">
                    <a href="index.jsp"  class="nume" onclick="signOut();">Logout</a>
                </div>

            </div>

        </ul>
        <ul class="nav navbar-nav navbar-right">
            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: -6px;">

        </ul>


    </div>

</nav>

<br>
<br>
<br>
<c:if test="${not empty emailechipa}">

<div id="cont" >

    <nav class="navbar navbar-default " id = "fixme" >

        <div class="collapse navbar-collapse ">
            <ul class="nav navbar-nav navbar-right">
                <li class="home"><a href="/home">Rezultatele mele</a></li>
                <li class="butonfaq"><a href="/perspective">Perspective</a></li>
                <li class="butonfaq"><a href="/valori">Valori</a></li>
                <li class="butonfaq"><a href="/echipamea">Echipa Mea</a></li>
                <li class="butonfaq"><a href="/Iesire">
                    <span class="glyphicon glyphicon-remove" style="color:red"></span>

                </a></li>

            </ul>
            <ul class="nav navbar-nav navbar-left">
                <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: -6px;">

            </ul>
            <ul class="nav navbar-nav navbar-left">
                <div class = "row">
                    <div class = "col-md-12">
                        <a class="nume" style="font-size: 24px;"> ${Name}</a>
                    </div>

                </div>

            </ul>



        </div>

    </nav>

</div>

<br>
<div id="sticky"></div>
<div class = "container">
    <div class = "row">
        <div class = "col-md-1">
            <h1 style="font-size:20px;">Echipa:</h1>
        </div>

        <div class = "col-md-11">
            <div class = "row">
                <div class = "col-md-2">
                    <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: -6px;">
                </div>
            </div>
        </div>
    </div>

</div>
</c:if>
<br>
<h2>  </h2>
<div class = "container">
    <div class = "valori">Perspective</div>

</div>

<div class="container">

    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#home" id ="obiective-button" style="width: 220px;">
            <div class="form-group row">

                <div class="col-md-6 " style = "text-align:center">
                    <label  class ="meniu" >Financiar</label>

                </div>
                <div class="col-md-4 "style = "text-align:center">

                    <input class="form-control" id="ex2" type="text">
                </div>
                <div class="col-md-2 " style = "text-align:center">
                    <label class ="meniu" >%</label>

                </div>

            </div>
        </a></li>
        <li><a data-toggle="tab" href="#menu1" style="width: 220px;">
            <div class="form-group row">
            <div class="col-md-6 " style = "text-align:center">
                <label class ="meniu">Clienti</label>

            </div>
            <div class="col-md-4 "style = "text-align:center">

                <input class="form-control" id="ex2" type="text">
            </div>
            <div class="col-md-2 meniu" style = "text-align:center">
                <label class ="meniu" >%</label>

            </div>
            </div>



        </a></li>
        <li><a data-toggle="tab" href="#menu2"  style="width: 220px;">
            <div class="form-group row">
            <div class="col-md-6" style = "text-align:center">
                <label  class ="meniu">Procese</label>

            </div>
            <div class="col-md-4 "style = "text-align:center">

                <input class="form-control" id="ex2" type="text">
            </div>
            <div class="col-md-2" style = "text-align:center">
                <label  class ="meniu">%</label>

            </div>
            </div>

        </a></li>
        <li><a data-toggle="tab" href="#menu3"  style="width: 82%;">
            <div class="form-group row">
            <div class="col-md-7 " style = "text-align:center">
                <label  class ="meniu" >Invatare si dezvoltare</label>

            </div>
            <div class="col-md-3 "style = "text-align:right;padding-left: 4%;">

                <input class="form-control" id="ex2" type="text">
            </div>
            <div class="col-md-2 " style = "text-align:center">
                <label  class ="meniu">%</label>

            </div>

            </div>

        </a></li>
    </ul>

    <div class="tab-content tab-backgroud">
        <div id="home" class="tab-pane fade in active">
            <div class ="row">
                <div class ="col-md-10">
                    <button type="button" class="adauga" id = "diverse-button" style="margin-left: 2%;margin-bottom: 1%;margin-top: 2%;">Diverse</button>
                    <button type="button" class="detalii" style="margin-left: 2%;margin-bottom: 1%;margin-top: 2%;">Obiectivul 1</button>

                </div>
                <div class ="col-md-2" style = "text-align:right">
                    <button type="button" class="adauga" style = "margin-right:5%;margin-top:10%">Adauga obiectiv</button>

                </div>

            </div>
            <div class ="mare2">

            </div>



        </div>
        <div id="menu1" class="tab-pane fade">
            <div class ="row">
                <div class ="col-md-10">
                    <button type="button" class="detalii" style="margin-left: 2%;margin-bottom: 1%;margin-top: 2%;">Obiectivul 1</button>

                </div>
                <div class ="col-md-2" style = "text-align:right">
                    <button type="button" class="adauga" style = "margin-right:5%;margin-top:10%">Adauga obiectiv</button>

                </div>

            </div>
            <div class ="mare2">

            </div>
        </div>
        <div id="menu2" class="tab-pane fade">
            <div class ="row">
                <div class ="col-md-10">
                    <button type="button" class="detalii" style="margin-left: 2%;margin-bottom: 1%;margin-top: 2%;">Obiectivul 1</button>

                </div>
                <div class ="col-md-2" style = "text-align:right">
                    <button type="button" class="adauga" style = "margin-right:5%;margin-top:10%">Adauga obiectiv</button>

                </div>

            </div>
            <div class ="mare2">

            </div>
        </div>
        <div id="menu3" class="tab-pane fade">
            <div class ="row">
                <div class ="col-md-10">
                    <button type="button" class="detalii" style="margin-left: 2%;margin-bottom: 1%;margin-top: 2%;">Obiectivul 1</button>

                </div>
                <div class ="col-md-2" style = "text-align:right">
                    <button type="button" class="adauga" style = "margin-right:5%;margin-top:10%">Adauga obiectiv</button>

                </div>

            </div>
            <div class ="mare2">

            </div>
        </div>
    </div>
</div>
<h2>  </h2>

<div id ="obiective">
<div class = "container">
    <div class = "valori">
        Detalii obiectiv 1

    </div>

</div>

<div class="container">



    <div class="mare">



        <div class="qanda">

            <div class = "row">
                <div class = "col-md-1">
                    <label>Q1</label>
                </div>

                <div class="col-md-11">
                </div>
            </div>
            <div class = "row">
                <div class = "col-md-3">
                    <div class = "row">
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="p1">Preconizat</h8>
                                <input class="form-control casuta" id="p1" type="text">
                            </div>
                        </div>
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="r1">Realizat</h8>
                                <input class="form-control casuta" id="r1" type="text">
                            </div>
                        </div>
                    </div>

                    <div class = "row">
                        <div class = "col-xs-6">
                            <h8>Procent realizare:</h8>
                        </div>
                        <div class = "col-xs-6">
                            <input class="form-control casuta"  type="text">
                        </div>

                    </div>



                </div>

                <div class = "col-md-9">
                    <div class="form-group">
                        <h8 for="comment">Detalii obiectiv:</h8>
                        <textarea class="form-control" rows="4" id="comment" style="height: 83px;"></textarea>
                    </div>
                </div>


            </div>

        </div>
    </div>



</div>
<h2>  </h2>

<div class="container">



    <div class="mare">



        <div class="qanda">

            <div class = "row">
                <div class = "col-md-1">
                    <label>Q2</label>
                </div>

                <div class="col-md-11">
                </div>
            </div>
            <div class = "row">
                <div class = "col-md-3">
                    <div class = "row">
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="p1">Preconizat</h8>
                                <input class="form-control casuta" id="p1" type="text">
                            </div>
                        </div>
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="r1">Realizat</h8>
                                <input class="form-control casuta" id="r1" type="text">
                            </div>
                        </div>
                    </div>

                    <div class = "row">
                        <div class = "col-xs-6">
                            <h8>Procent realizare:</h8>
                        </div>
                        <div class = "col-xs-6">
                            <input class="form-control casuta"  type="text">
                        </div>

                    </div>



                </div>

                <div class = "col-md-9">
                    <div class="form-group">
                        <h8 for="comment">Detalii obiectiv:</h8>
                        <textarea class="form-control" rows="4" id="comment" style="height: 83px;"></textarea>
                    </div>
                </div>


            </div>

        </div>
    </div>



</div>
<h2>  </h2>

<div class="container">



    <div class="mare">



        <div class="qanda">

            <div class = "row">
                <div class = "col-md-1">
                    <label>Q3</label>
                </div>

                <div class="col-md-11">
                </div>
            </div>
            <div class = "row">
                <div class = "col-md-3">
                    <div class = "row">
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="p1">Preconizat</h8>
                                <input class="form-control casuta" id="p1" type="text">
                            </div>
                        </div>
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="r1">Realizat</h8>
                                <input class="form-control casuta" id="r1" type="text">
                            </div>
                        </div>
                    </div>

                    <div class = "row">
                        <div class = "col-xs-6">
                            <h8>Procent realizare:</h8>
                        </div>
                        <div class = "col-xs-6">
                            <input class="form-control casuta"  type="text">
                        </div>

                    </div>



                </div>

                <div class = "col-md-9">
                    <div class="form-group">
                        <h8 for="comment">Detalii obiectiv:</h8>
                        <textarea class="form-control" rows="4" id="comment" style="height: 83px;"></textarea>
                    </div>
                </div>


            </div>

        </div>
    </div>



</div>
<h2>  </h2>

<div class="container">



    <div class="mare">



        <div class="qanda">

            <div class = "row">
                <div class = "col-md-1">
                    <label>Q4</label>
                </div>

                <div class="col-md-11">
                </div>
            </div>
            <div class = "row">
                <div class = "col-md-3">
                    <div class = "row">
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="p1">Preconizat</h8>
                                <input class="form-control casuta" id="p1" type="text">
                            </div>
                        </div>
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="r1">Realizat</h8>
                                <input class="form-control casuta" id="r1" type="text">
                            </div>
                        </div>
                    </div>

                    <div class = "row">
                        <div class = "col-xs-6">
                            <h8>Procent realizare:</h8>
                        </div>
                        <div class = "col-xs-6">
                            <input class="form-control casuta"  type="text">
                        </div>

                    </div>



                </div>

                <div class = "col-md-9">
                    <div class="form-group">
                        <h8 for="comment">Detalii obiectiv:</h8>
                        <textarea class="form-control" rows="4" id="comment" style="height: 83px;"></textarea>
                    </div>
                </div>


            </div>

        </div>
    </div>



</div>
<h2>  </h2>

</div>

<div id = "diverse"  style="display: none;">
    <div class = "container">
        <div class = "valori">
           Diverse

        </div>

    </div>
    <div class="container">



        <div class="mare">



            <div class="qanda">


                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Abilitati</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>

                    <div class = "row">
                        <div class ="col-md-12">
                            <textarea class="form-control" rows="5" id="comment"></textarea>
                        </div>
                    </div>

            </div>
        </div>
    </div>
    <h2></h2>
    <div class="container">



        <div class="mare">



            <div class="qanda">


                <div class = "row">
                    <div class = "col-md-1">
                        <h1>Subactivitati</h1>
                    </div>
                    <div class = "col-md-1">
                        <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                    </div>
                    <div class="col-md-10">
                    </div>
                </div>

                <div class = "row">
                    <div class ="col-md-12">
                        <textarea class="form-control" rows="5" id="comment"></textarea>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <h2></h2>
    <div class="container">



        <div class="mare">



            <div class="qanda">
                <div class = "row">
                    <div class = "col-md-2">
                        <h1>Perspective N+1</h1>
                    </div>
                    <div class = "col-md-1">
                        <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                    </div>
                    <div class="col-md-9">
                    </div>
                </div>

                <div class = "row">
                    <div class = "col-md-6">
                        <div class="form-group">
                            <h8 for="comment">Voi continua</h8>
                            <textarea class="form-control" rows="5" id="comment" style ="width:96%"></textarea>
                        </div>
                    </div>
                    <div class = "col-md-6">
                        <div class="form-group">
                            <h8 for="comment" style = "margin-left: 4%">Voi avea in considerare</h8>
                            <textarea class="form-control" rows="5" id="comment" style="width: 96%; margin-left: 4%;"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(function(){
        $('#obiective-button').click(function(){
            $('#diverse').hide();
            $('#obiective').show();
        });

        $('#diverse-button').click(function(){
            $('#obiective').hide();
            $('#diverse').show();
        });
    });
</script>
</body>
</html>