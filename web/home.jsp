<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: c026nenua
  Date: 15.06.2017
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rezultatele mele</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://apis.google.com/js/api:client.js"></script>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <link rel="stylesheet" type="text/css" href="stilizare.css">
    <script>
        window.onload = function() {

            var chart = new CanvasJS.Chart("chartContainer", {
                animationEnabled: true,
                backgroundColor: "#f0f0f0",
                data: [{
                    type: "pie",
                    startAngle: 240,
                    yValueFormatString: "##0.00\"%\"",
                    indexLabel: "{label} {y}",
                    dataPoints: [
                        {y: 30, label: "Financiar"},
                        {y: 15, label: "Clienti"},
                        {y: 20, label: "Procese"},
                        {y: 35, label: "Invatare si dezvoltare"}

                    ]
                }]
            });
            chart.render();

        }
    </script>

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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {

            var data = google.visualization.arrayToDataTable([
                ['Piloni', 'Procent'],
                ['Financiar',  25],
                ['Clienti',  25],
                ['Procese',  25],
                ['Invatare si dezvoltare', 25],

            ]);

            var options = {
                title: 'My Daily Activities',
                legend:'none',
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }
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
            <li class="home">
                <a href="/home">Rezultatele mele</a></li>
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


<div class = "row">
    <div class = "col-md-8">


            <div class="mare">
                <div class="qanda">
                    <h1>Rezultate evaluare 2018</h1>
                    <div class = "row">

                        <div class = "col-md-2"  style="text-align:center">

                        </div>
                        <div class = "col-md-2"  style="text-align:center">
                            <h1>Q1</h1>
                        </div>
                        <div class = "col-md-2"  style="text-align:center">
                            <h1>Q2</h1>
                        </div>
                        <div class = "col-md-2"  style="text-align:center">
                            <h1>Q3</h1>
                        </div>
                        <div class = "col-md-2"  style="text-align:center">
                            <h1>Q4</h1>
                        </div>

                        <div class = "col-md-2"  style="text-align:center">
                            <h1>Final</h1>
                        </div>
                    </div>


                    <div class = "row">

                        <div class = "col-md-2"  style="text-align:center">
                            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>

                        <div class ="col-md-2 school-options-dropdown text-center">


                            <select name="unit"class="drop">
                                <option value="1" selected disabled>Calificativ</option>
                                <option value="2" selected >Role Model</option>
                                <option value="3" selected >Deliver</option>
                                <option value="4" selected >Learn</option>
                            </select>
                        </div>
                        <div class ="col-md-2 school-options-dropdown text-center">


                            <select name="unit"class="drop">
                                <option value="1" selected disabled>Calificativ</option>
                                <option value="2" selected >Role Model</option>
                                <option value="3" selected >Deliver</option>
                                <option value="4" selected >Learn</option>
                            </select>
                        </div>
                        <div class ="col-md-2 school-options-dropdown text-center">


                            <select name="unit"class="drop">
                                <option value="1" selected disabled>Calificativ</option>
                                <option value="2" selected >Role Model</option>
                                <option value="3" selected >Deliver</option>
                                <option value="4" selected >Learn</option>
                            </select>
                        </div>
                        <div class ="col-md-2 school-options-dropdown text-center">


                            <select name="unit"class="drop">
                                <option value="1" selected disabled>Calificativ</option>
                                <option value="2" selected >Role Model</option>
                                <option value="3" selected >Deliver</option>
                                <option value="4" selected >Learn</option>
                            </select>
                        </div>
                        <div class ="col-md-2 school-options-dropdown text-center">


                            <select name="unit"class="drop">
                                <option value="1" selected disabled>Calificativ</option>
                                <option value="2" selected >Role Model</option>
                                <option value="3" selected >Deliver</option>
                                <option value="4" selected >Learn</option>
                            </select>
                        </div>

                    </div>

                    <div class = "row">
                        <div class = "col-md-12">
                            <hr>
                        </div>

                    </div>
                    <div class = "row">

                        <div class = "col-md-2"  style="text-align:center">
                            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>

                        <div class ="col-md-2 school-options-dropdown text-center">


                            <select name="unit"class="drop">
                                <option value="1" selected disabled>Calificativ</option>
                                <option value="2" selected >Role Model</option>
                                <option value="3" selected >Deliver</option>
                                <option value="4" selected >Learn</option>
                            </select>
                        </div>
                        <div class ="col-md-2 school-options-dropdown text-center">


                            <select name="unit"class="drop">
                                <option value="1" selected disabled>Calificativ</option>
                                <option value="2" selected >Role Model</option>
                                <option value="3" selected >Deliver</option>
                                <option value="4" selected >Learn</option>
                            </select>
                        </div>
                        <div class ="col-md-2 school-options-dropdown text-center">


                            <select name="unit"class="drop">
                                <option value="1" selected disabled>Calificativ</option>
                                <option value="2" selected >Role Model</option>
                                <option value="3" selected >Deliver</option>
                                <option value="4" selected >Learn</option>
                            </select>
                        </div>
                        <div class ="col-md-2 school-options-dropdown text-center">


                            <select name="unit"class="drop">
                                <option value="1" selected disabled>Calificativ</option>
                                <option value="2" selected >Role Model</option>
                                <option value="3" selected >Deliver</option>
                                <option value="4" selected >Learn</option>
                            </select>
                        </div>

                        <div class ="col-md-2 school-options-dropdown text-center">


                            <select name="unit"class="drop">
                                <option value="1" selected disabled>Calificativ</option>
                                <option value="2" selected >Role Model</option>
                                <option value="3" selected >Deliver</option>
                                <option value="4" selected >Learn</option>
                            </select>
                        </div>



                    </div>
                </div>
            </div>



    </div>
   <div class = "col-md-4">
        <div style="width: 268px;margin-left: 15%;padding-left: 10%;padding-right: 3%;padding-top: 8%;background-color: #80808024;height: 268px;border-radius: 50%;/* margin-bottom: 7%; */margin-top: -5%;/* color:grey */">
            <img src="integritate.png" class="img-circle" alt="Cinque Terre" width="70" height="70" >
            <img src="pasiune.png" class="img-circle" alt="Cinque Terre" width="70" height="70" >
            <img src="invatare.png" class="img-circle" alt="Cinque Terre" width="70" height="70" >
            <img src="discernamant.png" class="img-circle" alt="Cinque Terre" width="70" height="70" >
            <img src="respect.png" class="img-circle" alt="Cinque Terre" width="70" height="70" >
            <img src="colaborare.png" class="img-circle" alt="Cinque Terre" width="70" height="70">
            <img src="simplitate.bmp" class="img-circle" alt="Cinque Terre" width="70" height="70">
        </div>

   </div>

</div>

</div>

<h2></h2>

        <div class="container">
            <div class = "row">
                <div class = "col-md-8">
                     <div class="mare">



                <div class="obiective">
                    <div class = "row">
                        <div class = "col-md-12">
                            <div class="form-group">
                                <label for="comment">Obiective pe termen scurt:</label>
                                <textarea class="form-control" rows="5" id="comment"></textarea>
                            </div>
                        </div>
                    </div>


                    <div class = "row">
                        <div class = "col-md-12">
                            <div class="form-group">
                                <label for="comment">Obiective pe termen lung:</label>
                                <textarea class="form-control" rows="5" id="comment"></textarea>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
                </div>
                <div class = "col-md-4">

                    <div id="chartContainer" style="height: 370px; width: 100%;"></div>

                </div>
            </div>


        </div>





<h2>  </h2>


<div class = "container">
    <div class = "bunvenit">
       Financiar

    </div>

</div>

<div class="container">



    <div class="mare">



        <div class="qanda">
             <div class = "row">
                 <div class = "col-md-12">
                     <label>Nume obiectiv 1</label>
                     <button type="button" class="detalii">Detalii obiectiv</button>
                 </div>
             </div>

            <div class = "row">
                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                        <h1>Q1</h1>
                        </div>
                        <div class = "col-md-1">
                        <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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


                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q2</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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

                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q3</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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

                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q4</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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



            </div>

        </div>
    </div>



</div>
<h2>  </h2>

<div class = "container">
    <div class = "bunvenit">
        Clienti

    </div>

</div>

<div class="container">



    <div class="mare">



        <div class="qanda">
            <div class = "row">
                <div class = "col-md-12">
                    <label>Nume obiectiv 1</label>
                    <button type="button" class="detalii">Detalii obiectiv</button>
                </div>
            </div>

            <div class = "row">
                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q1</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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


                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q2</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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

                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q3</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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

                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q4</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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



            </div>

        </div>
    </div>



</div>
<h2>  </h2>

<div class = "container">
    <div class = "bunvenit">
        Procese

    </div>

</div>

<div class="container">



    <div class="mare">



        <div class="qanda">
            <div class = "row">
                <div class = "col-md-12">
                    <label>Nume obiectiv 1</label>
                    <button type="button" class="detalii">Detalii obiectiv</button>
                </div>
            </div>

            <div class = "row">
                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q1</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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


                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q2</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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

                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q3</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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

                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q4</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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



            </div>

        </div>
    </div>



</div>
<h2>  </h2>

<div class = "container">
    <div class = "bunvenit">
        Invatare si dezvoltare

    </div>

</div>

<div class="container">



    <div class="mare">



        <div class="qanda">
            <div class = "row">
                <div class = "col-md-12">
                    <label>Nume obiectiv 1</label>
                    <button type="button" class="detalii">Detalii obiectiv</button>
                </div>
            </div>

            <div class = "row">
                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q1</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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


                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q2</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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

                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q3</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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

                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q4</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="Nume complet obiectiv"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
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



            </div>

        </div>
    </div>



</div>
<h2>  </h2>
</body>
</html>