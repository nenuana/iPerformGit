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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://apis.google.com/js/api:client.js"></script>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src ="https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


    <link rel="stylesheet" type="text/css" href="stilizare.css">



<script>
    var text_max = 200;
    $('#count_message').html(text_max + ' ramas');

    $('#termen_lung').keyup(function() {
        var text_length = $('#termen_lung').val().length;
        var text_remaining = text_max - text_length;

        $('#count_message').html(text_remaining + ' ramas');
    });


    var text_max2 = 200;
    $('#count_message2').html(text_max2 + ' ramas');

    $('#termen_scurt').keyup(function() {
        var text_length = $('#termen_scurt').val().length;
        var text_remaining = text_max - text_length;

        $('#count_message2').html(text_remaining + ' ramas');
    });
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


<body id="home" data-spy="scroll" data-target=".navbar" data-offset="60">

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
                <a href="/home"> <span class="glyphicon glyphicon-home"></span> Rezultatele mele</a></li>

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
                <li class="home"><a href="/home"> <span class="glyphicon glyphicon-home"></span> Rezultatele mele</a></li>
                <li class="butonfaq"><a href="/perspective">Perspective</a></li>
                <li class="butonfaq"><a href="/valori">Valori</a></li>
                <li class="butonfaq"><a href="/Iesire">
                    <span class="glyphicon glyphicon-remove" style="color:red"></span>

                </a></li>

            </ul>
            <ul class="nav navbar-nav navbar-left">
                <img src="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: -6px;">

            </ul>
            <ul class="nav navbar-nav navbar-left">
                <div class = "row">
                    <div class = "col-md-12">
                        <a class="nume" style="font-size: 24px;"> ${first_name_echipa} ${last_name_echipa}</a>
                    </div>

                </div>

            </ul>



        </div>

    </nav>

</div>

<br>

</c:if>
<br>
<h2>  </h2>

<c:forEach items="${valori}" var="val">
    <input type="hidden" id="nota_integritate" value="${val.nnota_integritate}">
    <input type="hidden" id="nota_pasiune" value="${val.nnota_pasiune}">
    <input type="hidden" id="nota_colaborare" value="${val.nnota_colaborare}">
    <input type="hidden" id="nota_invatare" value="${val.nnota_invatare}">
    <input type="hidden" id="nota_simplitate" value="${val.nnota_simplitate}">
    <input type="hidden" id="nota_discernamant" value="${val.nnota_discernamant}">
    <input type="hidden" id="nota_respect" value="${val.nnota_respect}">
</c:forEach>
<form method="POST" action="doInsertRezultate">
    <c:if test="${not empty rezultate}">

    <c:forEach items ="${rezultate}" var="r">


        <input type="hidden" id="financiar_procent" value="${r.financiar_procent}">
        <input type="hidden" id="clienti_procent" value="${r.clienti_procent}">
        <input type="hidden" id="procese_procent" value="${r.procese_procent}">
        <input type="hidden" id="invatare_procent" value="${r.invatare_procent}">
        <input type="hidden" id="oameni_procent" value="${r.oameni_procent}">
<div class = "container">

    <div class="row" id = "eroare">
        <div class = "col-md-12 alert alert-danger">
            <p style="font-size:15px;text-align: center;"> Va rog sa aveti in vedere ca suma ponderilor pilonilor sa fie 100 iar rezultatul evaluarii sa aiba una dintre valorile : "Learn, Well Done / Deliver, Role Model"  &#x2757;</p>
        </div>
    </div>

<div class = "row">
    <div class = "col-md-8">


            <div class="mare">
                <div class="qanda">
                    <h1>Rezultate evaluare 2018</h1>
                    <div class = "row">

                        <div class = "col-md-2"  style="text-align:center">

                                    <img src="${r.poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">

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
                                <c:choose>
                                    <c:when test="${not empty emailechipa}">
                                        ${first_name_echipa} ${last_name_echipa}
                                    </c:when>
                                    <c:otherwise>
                                        ${Name}
                                    </c:otherwise>
                                </c:choose>


                            </div>


                        <div class ="col-md-2 " school-options-dropdown text-center>

                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input class="form-control casuta" id="q1" type="text" name="q1" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model"  disabled value="${r.q1}">
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control casuta" id="q1" type="text" name="q1" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model"  value="${r.q1}">
                                </c:otherwise>
                            </c:choose>

                        </div>
                        <div class ="col-md-2 " school-options-dropdown text-center>

                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input class="form-control casuta" id="q2" type="text" name="q2" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model" disabled value="${r.q2}">
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control casuta" id="q2" type="text" name="q2" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model" disabled value="${r.q2}">
                                </c:otherwise>
                            </c:choose>



                        </div>
                        <div class ="col-md-2 " school-options-dropdown text-center>
                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input class="form-control casuta" id="q3" name="q3" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model" disabled value="${r.q3}">
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control casuta" id="q3" name="q3" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model" disabled value="${r.q3}">
                                </c:otherwise>
                            </c:choose>



                        </div>
                        <div class ="col-md-2 " school-options-dropdown text-center>

                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input class="form-control casuta" id="q4" name="q4" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model" disabled value="${r.q4}">
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control casuta" id="q4" name="q4" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model" disabled value="${r.q4}">
                                </c:otherwise>
                            </c:choose>



                        </div>
                        <div class ="col-md-2 " school-options-dropdown text-center>

                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input class="form-control casuta" id="q_an" name="q_an" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model" disabled value="${r.q_an}">
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control casuta" id="q_an" name="q_an" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model" disabled value="${r.q_an}">
                                </c:otherwise>
                            </c:choose>



                        </div>

                    </div>

                    <div class = "row">
                        <div class = "col-md-12">
                            <hr>
                        </div>

                    </div>


                    <div class = "row">

                        <div class = "col-md-2"  style="text-align:center">
                            <div class = "row">
                                <div class = "col-md-12">
                                    <img src="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                                </div>
                            </div>
                            <div class = "row">
                                <div class = "col-md-12">
                                    <c:choose>
                                        <c:when test="${not empty emailechipa}">
                                            ${superior_full_name}
                                        </c:when>
                                        <c:otherwise>
                                            ${superior_full_name_user_logat}
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>

                        <div class ="col-md-2 " style="padding-top: 20px;" school-options-dropdown text-center>

                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input class="form-control casuta" id="nq1" name="nq1" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model" value="${r.nq1}">
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control casuta" id="nq1" name="nq1" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model"  disabled value="${r.nq1}">
                                </c:otherwise>
                            </c:choose>

                        </div>
                        <div class ="col-md-2 " style="padding-top: 20px;" school-options-dropdown text-center>

                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input class="form-control casuta" id="nq2" name="nq2" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model" disabled value="${r.nq2}">
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control casuta" id="nq2" name="nq2" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model" disabled value="${r.nq2}">
                                </c:otherwise>
                            </c:choose>



                        </div>
                        <div class ="col-md-2 " style="padding-top: 20px;" school-options-dropdown text-center>
                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input class="form-control casuta" id="nq3" name="nq3" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model" disabled value="${r.nq3}">
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control casuta" id="nq3" name="nq3" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model" disabled value="${r.nq3}">
                                </c:otherwise>
                            </c:choose>



                        </div>
                        <div class ="col-md-2 " style="padding-top: 20px;" school-options-dropdown text-center>

                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input class="form-control casuta" id="nq4" name="nq4" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model"  disabled value="${r.nq4}">
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control casuta" id="nq4" name="nq4" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model"  disabled value="${r.nq4}">
                                </c:otherwise>
                            </c:choose>



                        </div>
                        <div class ="col-md-2 "  style="padding-top: 20px;" school-options-dropdown text-center>

                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input class="form-control casuta" style="background-color:#C3DE9A" id="nq_an" name="nq_an" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model" disabled value="${r.nq_an}">
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control casuta" style="background-color:#C3DE9A" id="nq_an" name="nq_an" type="text" data-toggle="tooltip" data-placement="top" title="Calificative permise: Learn, Well Done / Deliver, Role Model"  disabled value="${r.nq_an}">
                                </c:otherwise>
                            </c:choose>



                        </div>

                    </div>
                </div>
            </div>



    </div>
   <div class = "col-md-4">

       <div id="chart_div" style="padding-left: 10px;width: 300px;height: 300px;"></div>
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
                                <label for="termen_scurt">Obiective pe termen scurt:</label>

                                <textarea class="form-control" rows="5" name = "termen_scurt" id = "termen_scurt" data-toggle="tooltip" data-placement="top" title="Cand cineva face o greseala aceasta poate afecta si Banca si reputatia persoanei respective. Pentru ca nu vrem ca asta sa se intample, este important sa luam o pauza, sa revizuim progresul care s-a inregistrat si sa identificam orice element nou invatat fie ca am facut o greseala sau nu.
In RBRO vrem sa ne asiguram ca ne folosim de orice actiune pentru a invata din ea si a trage concluzii importante pe partea de invatare. Si asta inseamna o revizuire permanenta a ceea ce facem">${r.termen_scurt}</textarea>
                                <h6 class="pull-right" id="count_message"></h6>
                            </div>
                        </div>
                    </div>


                    <div class = "row">
                        <div class = "col-md-12">
                            <div class="form-group">
                                <label for="termen_lung">Obiective pe termen lung:</label>
                                <textarea class="form-control" rows="5" name="termen_lung" id = "termen_lung" data-toggle="tooltip" data-placement="top" title="Cand cineva face o greseala aceasta poate afecta si Banca si reputatia persoanei respective. Pentru ca nu vrem ca asta sa se intample, este important sa luam o pauza, sa revizuim progresul care s-a inregistrat si sa identificam orice element nou invatat fie ca am facut o greseala sau nu.
In RBRO vrem sa ne asiguram ca ne folosim de orice actiune pentru a invata din ea si a trage concluzii importante pe partea de invatare. Si asta inseamna o revizuire permanenta a ceea ce facem" >${r.termen_lung}</textarea>
                                <h6 class="pull-right" id="count_message2"></h6>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
                </div>
                <div class = "col-md-4" style="PADDING-LEFT: 20PX;">

                    <div class = "row">
                        <div class ="col-md-12">
                            <div id="piechart" style="width: 400px; height: 400px;"></div>

                        </div>
                    </div>

                    </div>


                </div>

                <div class="mare">
                    <div class="obiective">
                        <div class = "row">

                            <div class ="col-md-2">

                                <div class="form-group">
                                    <h8 for="p1">Financiar</h8>
                                    <input class="form-control casuta" id="financiar" name = "financiar" type="text"  value="${r.financiar_procent}">
                                </div>
                            </div>
                            <div class ="col-md-2">
                                <div class="form-group">
                                    <h8 for="p1">Clienti</h8>
                                    <input class="form-control casuta" id="clienti" name="clienti" type="text"  value="${r.clienti_procent}">
                                </div>

                            </div>
                            <div class ="col-md-2">
                                <div class="form-group">
                                    <h8 for="p1">Procese </h8>
                                    <input class="form-control casuta" id="procese" name = "procese" type="text"  value="${r.procese_procent}">
                                </div>

                            </div>




                            <div class ="col-md-2">

                                <div class="form-group">
                                    <h8 for="p1">Invatare</h8>
                                    <input class="form-control casuta" id="invatare" name = "invatare" type="text"  value="${r.invatare_procent}">
                                </div>
                            </div>
                            <div class ="col-md-2">
                                <div class="form-group">
                                    <h8 for="p1">Oameni</h8>
                                    <input class="form-control casuta" id="oameni" name = "oameni" type="text"  value="${r.oameni_procent}">
                                </div>

                            </div>
                            <div class ="col-md-2">
                                <button type="submit" class="detalii" id="submit" style="width: 187px;height: 66px;margin-bottom: 4px;">
                                   Salveaza
                                </button>

                            </div>

                    </div>
                </div>




            </div>


        </div>


</c:forEach>
        </c:if>


<h2>  </h2>


<div class = "container">
    <div class = "bunvenit">
       Financiar

    </div>

</div>

</form>
<c:forEach items ="${nrfinanciar}" var="fin" varStatus="vs">
    <c:set var="i" value="${vs.index}"/>
    <c:set var="v" value="${nrfinanciarq2[i]}"/>
    <c:set var="q3" value="${nrfinanciarq3[i]}"/>
    <c:set var="q4" value="${nrfinanciarq4[i]}"/>
<div class="container">



    <div class="mare">



        <div class="qanda">
             <div class = "row">
                 <div class = "col-md-11">


                         <label>${fin.OBJECTIVE_NAME}</label>




                 </div>
                 <div class = "col-md-1" style="text-align: right">
                     <form method="POST" action="/PerspectiveParametru">
                         <input type="hidden" name="w" value="#home">

                         <input type="hidden" name="ID" value="${fin.ID}">
                         <input type="hidden" name="OBJECTIVE_NAME" value="${fin.OBJECTIVE_NAME}">
                         <button type="submit" class="detalii" id="OBJECTIVE_NAME">Detalii</button>
                     </form>

                 </div>
             </div>

            <div class = "row">
                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                        <h1>Q1</h1>
                        </div>
                        <div class = "col-md-1">
                        <a href="#" data-toggle="tooltip" title="${fin.OBJECTIVE_DESCRIPTION}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
                    <div class = "row">
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="p1">Valoare obiectiv</h8>
                                <input class="form-control casuta" id="preconizatq1" type="text" disabled value="${fin.OBJECTIVE_TARGET}">
                            </div>
                        </div>
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="r1">Realizat</h8>
                                <input class="form-control casuta" id="realizatq1" type="text" disabled value="${fin.RESULT_VALUE}">
                            </div>
                        </div>
                    </div>

                    <div class = "row">
                        <div class = "col-xs-6">
                            <h8>Procent realizare:</h8>
                        </div>
                        <div class = "col-xs-4">
                            <input class="form-control casuta" id = "procentq1"  name = "procentq1" type="text" disabled>
                        </div>
                        <div class = "col-xs-2">
                            <label  class ="meniu">%</label>
                        </div>

                    </div>



                </div>


                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q2</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="${v.OBJECTIVE_DESCRIPTION}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
                    <div class = "row">
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="p1">Valoare obiectiv</h8>
                                <input class="form-control casuta" id="preconizatq2" type="text" disabled value="${v.OBJECTIVE_TARGET}">
                            </div>
                        </div>
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="r1">Realizat</h8>
                                <input class="form-control casuta" id="realizatq2" type="text" disabled value="${v.RESULT_VALUE}">
                            </div>
                        </div>
                    </div>

                    <div class = "row">
                        <div class = "col-xs-6">
                            <h8>Procent realizare:</h8>
                        </div>
                        <div class = "col-xs-4">
                            <input class="form-control casuta" disabled  type="text">
                        </div>
                        <div class = "col-xs-2">
                            <label  class ="meniu">%</label>
                        </div>

                    </div>



                </div>

                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q3</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="${q3.OBJECTIVE_DESCRIPTION}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
                    <div class = "row">
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="p1">Valoare obiectiv</h8>
                                <input class="form-control casuta" id="preconizatq3" type="text" disabled value="${q3.OBJECTIVE_TARGET}">
                            </div>
                        </div>
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="r1">Realizat</h8>
                                <input class="form-control casuta" id="realizatq3" type="text" disabled value="${q3.RESULT_VALUE}">
                            </div>
                        </div>
                    </div>

                    <div class = "row">
                        <div class = "col-xs-6">
                            <h8>Procent realizare:</h8>
                        </div>
                        <div class = "col-xs-4">
                            <input class="form-control casuta"  disabled type="text">
                        </div>
                        <div class = "col-xs-2">
                            <label  class ="meniu">%</label>
                        </div>

                    </div>



                </div>

                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q4</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="${q4.OBJECTIVE_DESCRIPTION}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
                    <div class = "row">
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="p1">Valoare obiectiv</h8>
                                <input class="form-control casuta" id="preconizatq4" type="text" disabled value="${q4.OBJECTIVE_TARGET}">
                            </div>
                        </div>
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="r1">Realizat</h8>
                                <input class="form-control casuta" id="realizatq4" type="text" disabled value="${q4.RESULT_VALUE}">
                            </div>
                        </div>
                    </div>

                    <div class = "row">
                        <div class = "col-xs-6">
                            <h8>Procent realizare:</h8>
                        </div>
                        <div class = "col-xs-4">
                            <input class="form-control casuta" disabled type="text">
                        </div>
                        <div class = "col-xs-2">
                            <label  class ="meniu">%</label>
                        </div>

                    </div>



                </div>



            </div>

        </div>
    </div>



</div>
<h2>  </h2>
</c:forEach>
<div class = "container">
    <div class = "bunvenit">
        Clienti

    </div>

</div>

<c:forEach items ="${nrclienti}" var="cln" varStatus="vs">

    <c:set var="i" value="${vs.index}"/>

    <c:set var="q2" value="${nrclientiq2[i]}"/>
    <c:set var="q3" value="${nrclientiq3[i]}"/>
    <c:set var="q4" value="${nrclientiq4[i]}"/>
<div class="container">



    <div class="mare">



        <div class="qanda">
            <div class = "row">
                <div class = "col-md-11">


                    <label>${cln.OBJECTIVE_NAME}</label>




                </div>
                <div class = "col-md-1" style="text-align: right">
                    <form method="POST" action="/PerspectiveParametru">
                        <input type="hidden" name="w" value="#menu1">


                        <input type="hidden" name="OBJECTIVE_NAME_CLIENTI" value="${cln.OBJECTIVE_NAME}">
                        <input type="hidden" name="IDC" value="${cln.ID}">
                        <button type="submit" class="detalii" id="OBJECTIVE_NAME_CLIENTI">Detalii</button>
                    </form>

                </div>
            </div>

            <div class = "row">
                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q1</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="${cln.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
                    <div class = "row">
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="p1">Valoare obiectiv</h8>
                                <input class="form-control casuta" id="preconizatq1clienti" type="text" disabled value="${cln.OBJECTIVE_TARGET}">
                            </div>
                        </div>
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="r1">Realizat</h8>
                                <input class="form-control casuta" id="realizatq1clienti" type="text" disabled value="${cln.RESULT_VALUE}">
                            </div>
                        </div>
                    </div>

                    <div class = "row">
                        <div class = "col-xs-6">
                            <h8>Procent realizare:</h8>
                        </div>
                        <div class = "col-xs-4">
                            <input class="form-control casuta" id = "procentq1clienti"  name = "procentq1clienti" type="text" disabled>
                        </div>
                        <div class = "col-xs-2">
                            <label  class ="meniu">%</label>
                        </div>

                    </div>



                </div>


                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q2</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="${q2.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
                    <div class = "row">
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="p1">Valoare obiectiv</h8>
                                <input class="form-control casuta" id="preconizatq2clienti" type="text" disabled value="${q2.OBJECTIVE_TARGET}">
                            </div>
                        </div>
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="r1">Realizat</h8>
                                <input class="form-control casuta" id="realizatq2clienti" type="text" disabled value="${q2.RESULT_VALUE}">
                            </div>
                        </div>
                    </div>

                    <div class = "row">
                        <div class = "col-xs-6">
                            <h8>Procent realizare:</h8>
                        </div>
                        <div class = "col-xs-4">
                            <input class="form-control casuta"  disabled type="text">
                        </div>
                        <div class = "col-xs-2">
                            <label  class ="meniu">%</label>
                        </div>

                    </div>



                </div>

                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q3</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="${q3.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
                    <div class = "row">
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="p1">Valoare obiectiv</h8>
                                <input class="form-control casuta" id="preconizatq3clienti" type="text" disabled value="${q3.OBJECTIVE_TARGET}">
                            </div>
                        </div>
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="r1">Realizat</h8>
                                <input class="form-control casuta" id="realizatq3clienti" type="text" disabled value="${q3.RESULT_VALUE}">
                            </div>
                        </div>
                    </div>

                    <div class = "row">
                        <div class = "col-xs-6">
                            <h8>Procent realizare:</h8>
                        </div>
                        <div class = "col-xs-4">
                            <input class="form-control casuta" disabled type="text">
                        </div>
                        <div class = "col-xs-2">
                            <label  class ="meniu">%</label>
                        </div>

                    </div>



                </div>

                <div class = "col-md-3">
                    <div class = "row">
                        <div class = "col-md-1">
                            <h1>Q4</h1>
                        </div>
                        <div class = "col-md-1">
                            <a href="#" data-toggle="tooltip" title="${q4.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                        </div>
                        <div class="col-md-10">
                        </div>
                    </div>
                    <div class = "row">
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="p1">Valoare obiectiv</h8>
                                <input class="form-control casuta" id="preconizatq4clienti" type="text" disabled value="${q4.OBJECTIVE_TARGET}">
                            </div>
                        </div>
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="r1">Realizat</h8>
                                <input class="form-control casuta" id="realizatq4clienti" type="text" disabled value="${q4.RESULT_VALUE}">
                            </div>
                        </div>
                    </div>

                    <div class = "row">
                        <div class = "col-xs-6">
                            <h8>Procent realizare:</h8>
                        </div>
                        <div class = "col-xs-4">
                            <input class="form-control casuta"disabled  type="text">
                        </div>
                        <div class = "col-xs-2">
                            <label  class ="meniu">%</label>
                        </div>

                    </div>



                </div>



            </div>

        </div>
    </div>



</div>
<h2>  </h2>
</c:forEach>

<div class = "container">
    <div class = "bunvenit">
        Procese

    </div>

</div>


<c:forEach items ="${nrprocese}" var="p"  varStatus="vs">



    <c:set var="i" value="${vs.index}"/>
    <c:set var="q2" value="${nrproceseq2[i]}"/>
    <c:set var="q3" value="${nrproceseq3[i]}"/>
    <c:set var="q4" value="${nrproceseq4[i]}"/>
    <div class="container">



        <div class="mare">



            <div class="qanda">
                <div class = "row">
                    <div class = "col-md-11">


                        <label>${p.OBJECTIVE_NAME}</label>




                    </div>
                    <div class = "col-md-1" style="text-align: right">
                        <form method="POST" action="/PerspectiveParametru">
                            <input type="hidden" name="w" value="#menu2">


                            <input type="hidden" name="OBJECTIVE_NAME_PROCESE" value="${p.OBJECTIVE_NAME}">
                            <input type="hidden" name="IDP" value="${p.ID}">
                            <button type="submit" class="detalii" id="OBJECTIVE_NAME_PROCESE">Detalii</button>
                        </form>

                    </div>
                </div>

                <div class = "row">
                    <div class = "col-md-3">
                        <div class = "row">
                            <div class = "col-md-1">
                                <h1>Q1</h1>
                            </div>
                            <div class = "col-md-1">
                                <a href="#" data-toggle="tooltip" title="${p.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                            </div>
                            <div class="col-md-10">
                            </div>
                        </div>
                        <div class = "row">
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="p1">Valoare obiectiv</h8>
                                    <input class="form-control casuta" id="preconizatq1procese" type="text" disabled value="${p.OBJECTIVE_TARGET}">
                                </div>
                            </div>
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="r1">Realizat</h8>
                                    <input class="form-control casuta" id="realizatq1procese" type="text" disabled value="${p.RESULT_VALUE}">
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-xs-6">
                                <h8>Procent realizare:</h8>
                            </div>
                            <div class = "col-xs-4">
                                <input class="form-control casuta" id = "procentq1procese"  name = "procentq1procese" type="text" disabled>
                            </div>
                            <div class = "col-xs-2">
                                <label  class ="meniu">%</label>
                            </div>

                        </div>



                    </div>


                    <div class = "col-md-3">
                        <div class = "row">
                            <div class = "col-md-1">
                                <h1>Q2</h1>
                            </div>
                            <div class = "col-md-1">
                                <a href="#" data-toggle="tooltip" title="${q2.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                            </div>
                            <div class="col-md-10">
                            </div>
                        </div>
                        <div class = "row">
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="p1">Valoare obiectiv</h8>
                                    <input class="form-control casuta" id="preconizatq2procese" type="text" disabled value="${q2.OBJECTIVE_TARGET}">
                                </div>
                            </div>
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="r1">Realizat</h8>
                                    <input class="form-control casuta" id="realizatq2procese" type="text" disabled value="${q2.RESULT_VALUE}">
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-xs-6">
                                <h8>Procent realizare:</h8>
                            </div>
                            <div class = "col-xs-4">
                                <input class="form-control casuta"  disabled type="text">
                            </div>
                            <div class = "col-xs-2">
                                <label  class ="meniu">%</label>
                            </div>

                        </div>



                    </div>

                    <div class = "col-md-3">
                        <div class = "row">
                            <div class = "col-md-1">
                                <h1>Q3</h1>
                            </div>
                            <div class = "col-md-1">
                                <a href="#" data-toggle="tooltip" title="${q3.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                            </div>
                            <div class="col-md-10">
                            </div>
                        </div>
                        <div class = "row">
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="p1">Valoare obiectiv</h8>
                                    <input class="form-control casuta" id="preconizatq3procese" type="text" disabled value="${q3.OBJECTIVE_TARGET}">
                                </div>
                            </div>
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="r1">Realizat</h8>
                                    <input class="form-control casuta" id="realizatq3procese" type="text" disabled value="${q3.RESULT_VALUE}">
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-xs-6">
                                <h8>Procent realizare:</h8>
                            </div>
                            <div class = "col-xs-4">
                                <input class="form-control casuta" disabled type="text">
                            </div>
                            <div class = "col-xs-2">
                                <label  class ="meniu">%</label>
                            </div>

                        </div>



                    </div>

                    <div class = "col-md-3">
                        <div class = "row">
                            <div class = "col-md-1">
                                <h1>Q4</h1>
                            </div>
                            <div class = "col-md-1">
                                <a href="#" data-toggle="tooltip" title="${q4.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                            </div>
                            <div class="col-md-10">
                            </div>
                        </div>
                        <div class = "row">
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="p1">Valoare obiectiv</h8>
                                    <input class="form-control casuta" id="preconizatq4procese" type="text" disabled value="${q4.OBJECTIVE_TARGET}">
                                </div>
                            </div>
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="r1">Realizat</h8>
                                    <input class="form-control casuta" id="realizatq4procese" type="text" disabled value="${q4.RESULT_VALUE}">
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-xs-6">
                                <h8>Procent realizare:</h8>
                            </div>
                            <div class = "col-xs-4">
                                <input class="form-control casuta" disabled type="text">
                            </div>
                            <div class = "col-xs-2">
                                <label  class ="meniu">%</label>
                            </div>

                        </div>



                    </div>



                </div>

            </div>
        </div>



    </div>
    <h2>  </h2>
</c:forEach>


<div class = "container">
    <div class = "bunvenit">
        Oameni


    </div>

</div>

<c:forEach items ="${nroameni}" var="o" varStatus="vs">


    <c:set var="i" value="${vs.index}"/>
    <c:set var="q2" value="${nroameniq2[i]}"/>
    <c:set var="q3" value="${nroameniq3[i]}"/>
    <c:set var="q4" value="${nroameniq4[i]}"/>
    <div class="container">



        <div class="mare">



            <div class="qanda">
                <div class = "row">
                    <div class = "col-md-11">


                        <label>${o.OBJECTIVE_NAME}</label>




                    </div>
                    <div class = "col-md-1" style="text-align: right">
                        <form method="POST" action="/PerspectiveParametru">
                            <input type="hidden" name="w" value="#menu3">

                            <input type="hidden" name="IDO" value="${o.ID}">
                            <input type="hidden" name="OBJECTIVE_NAME_OAMENI" value="${o.OBJECTIVE_NAME}">
                            <button type="submit" class="detalii" id="OBJECTIVE_NAME_OAMENI">Detalii</button>
                        </form>

                    </div>
                </div>

                <div class = "row">
                    <div class = "col-md-3">
                        <div class = "row">
                            <div class = "col-md-1">
                                <h1>Q1</h1>
                            </div>
                            <div class = "col-md-1">
                                <a href="#" data-toggle="tooltip" title="${o.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                            </div>
                            <div class="col-md-10">
                            </div>
                        </div>
                        <div class = "row">
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="p1">Valoare obiectiv</h8>
                                    <input class="form-control casuta" id="preconizatq1oameni"  type="text" disabled value="${o.OBJECTIVE_TARGET}">
                                </div>
                            </div>
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="r1">Realizat</h8>
                                    <input class="form-control casuta" id="realizatq1oameni" type="text" disabled value="${o.RESULT_VALUE}">
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-xs-6">
                                <h8>Procent realizare:</h8>
                            </div>
                            <div class = "col-xs-4">
                                <input class="form-control casuta" id = "procentq1oameni"  name = "procentq1oameni" type="text" disabled>
                            </div>
                            <div class = "col-xs-2">
                                <label  class ="meniu">%</label>
                            </div>

                        </div>



                    </div>


                    <div class = "col-md-3">
                        <div class = "row">
                            <div class = "col-md-1">
                                <h1>Q2</h1>
                            </div>
                            <div class = "col-md-1">
                                <a href="#" data-toggle="tooltip" title="${q2.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                            </div>
                            <div class="col-md-10">
                            </div>
                        </div>
                        <div class = "row">
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="p1">Valoare obiectiv</h8>
                                    <input class="form-control casuta" id="preconizatq2oameni"  type="text" disabled value="${q2.OBJECTIVE_TARGET}">
                                </div>
                            </div>
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="r1">Realizat</h8>
                                    <input class="form-control casuta" id="realizatq2oameni" type="text" disabled value="${q2.RESULT_VALUE}">
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-xs-6">
                                <h8>Procent realizare:</h8>
                            </div>
                            <div class = "col-xs-4">
                                <input class="form-control casuta" disabled type="text">
                            </div>
                            <div class = "col-xs-2">
                                <label  class ="meniu">%</label>
                            </div>

                        </div>



                    </div>

                    <div class = "col-md-3">
                        <div class = "row">
                            <div class = "col-md-1">
                                <h1>Q3</h1>
                            </div>
                            <div class = "col-md-1">
                                <a href="#" data-toggle="tooltip" title="${q3.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                            </div>
                            <div class="col-md-10">
                            </div>
                        </div>
                        <div class = "row">
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="p1">Valoare obiectiv</h8>
                                    <input class="form-control casuta" id="preconizatq3oameni"  type="text" disabled value="${q3.OBJECTIVE_TARGET}">
                                </div>
                            </div>
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="r1">Realizat</h8>
                                    <input class="form-control casuta" id="realizatq3oameni" type="text" disabled value="${q3.RESULT_VALUE}">
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-xs-6">
                                <h8>Procent realizare:</h8>
                            </div>
                            <div class = "col-xs-4">
                                <input class="form-control casuta" disabled type="text">
                            </div>
                            <div class = "col-xs-2">
                                <label  class ="meniu">%</label>
                            </div>

                        </div>



                    </div>

                    <div class = "col-md-3">
                        <div class = "row">
                            <div class = "col-md-1">
                                <h1>Q4</h1>
                            </div>
                            <div class = "col-md-1">
                                <a href="#" data-toggle="tooltip" title="${q4.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                            </div>
                            <div class="col-md-10">
                            </div>
                        </div>
                        <div class = "row">
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="p1">Valoare obiectiv</h8>
                                    <input class="form-control casuta" id="preconizatq4oameni"  type="text" disabled value="${q4.OBJECTIVE_TARGET}">
                                </div>
                            </div>
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="r1">Realizat</h8>
                                    <input class="form-control casuta" id="realizatq4oameni" type="text" disabled value="${q4.RESULT_VALUE}">
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-xs-6">
                                <h8>Procent realizare:</h8>
                            </div>
                            <div class = "col-xs-4">
                                <input class="form-control casuta" disabled type="text">
                            </div>
                            <div class = "col-xs-2">
                                <label  class ="meniu">%</label>
                            </div>

                        </div>



                    </div>



                </div>

            </div>
        </div>



    </div>
    <h2>  </h2>
</c:forEach>

<div class = "container">
    <div class = "bunvenit">
        Invatare si dezvoltare

    </div>

</div>

<c:forEach items ="${nrinvatare}" var="o" varStatus="vs">

    <c:set var="i" value="${vs.index}"/>
    <c:set var="q2" value="${nrinvatareq2[i]}"/>
    <c:set var="q3" value="${nrinvatareq3[i]}"/>
    <c:set var="q4" value="${nrinvatareq4[i]}"/>

    <div class="container">



        <div class="mare">



            <div class="qanda">
                <div class = "row">
                    <div class = "col-md-11">


                        <label>${o.OBJECTIVE_NAME}</label>




                    </div>
                    <div class = "col-md-1" style="text-align: right">
                        <form method="POST" action="/PerspectiveParametru">
                            <input type="hidden" name="w" value="#menu4">

                            <input type="hidden" name="IDI" value="${o.ID}">
                            <input type="hidden" name="OBJECTIVE_NAME_INVATARE" value="${o.OBJECTIVE_NAME}">
                            <button type="submit" class="detalii" id="OBJECTIVE_NAME_INVATARE">Detalii</button>
                        </form>

                    </div>
                </div>

                <div class = "row">
                    <div class = "col-md-3">
                        <div class = "row">
                            <div class = "col-md-1">
                                <h1>Q1</h1>
                            </div>
                            <div class = "col-md-1">
                                <a href="#" data-toggle="tooltip" title="${o.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                            </div>
                            <div class="col-md-10">
                            </div>
                        </div>
                        <div class = "row">
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="p1">Valoare obiectiv</h8>
                                    <input class="form-control casuta" id="preconizatq1invatare"  type="text" disabled value="${o.OBJECTIVE_TARGET}">
                                </div>
                            </div>
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="r1">Realizat</h8>
                                    <input class="form-control casuta" id="realizatq1invatare" type="text" disabled value="${o.RESULT_VALUE}">
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-xs-6">
                                <h8>Procent realizare:</h8>
                            </div>
                            <div class = "col-xs-4">
                                <input class="form-control casuta" id = "procentq1invatare"  name = "procentq1invatare" type="text" disabled>
                            </div>
                            <div class = "col-xs-2">
                                <label  class ="meniu">%</label>
                            </div>

                        </div>



                    </div>


                    <div class = "col-md-3">
                        <div class = "row">
                            <div class = "col-md-1">
                                <h1>Q2</h1>
                            </div>
                            <div class = "col-md-1">
                                <a href="#" data-toggle="tooltip" title="${q2.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                            </div>
                            <div class="col-md-10">
                            </div>
                        </div>
                        <div class = "row">
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="p1">Valoare obiectiv</h8>
                                    <input class="form-control casuta" id="preconizatq2invatare"  type="text" disabled value="${q2.OBJECTIVE_TARGET}">
                                </div>
                            </div>
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="r1">Realizat</h8>
                                    <input class="form-control casuta" id="realizatq2invatare" type="text" disabled value="${q2.RESULT_VALUE}">
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-xs-6">
                                <h8>Procent realizare:</h8>
                            </div>
                            <div class = "col-xs-4">
                                <input class="form-control casuta" disabled type="text">
                            </div>
                            <div class = "col-xs-2">
                                <label  class ="meniu">%</label>
                            </div>

                        </div>



                    </div>

                    <div class = "col-md-3">
                        <div class = "row">
                            <div class = "col-md-1">
                                <h1>Q3</h1>
                            </div>
                            <div class = "col-md-1">
                                <a href="#" data-toggle="tooltip" title="${q3.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                            </div>
                            <div class="col-md-10">
                            </div>
                        </div>
                        <div class = "row">
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="p1">Valoare obiectiv</h8>
                                    <input class="form-control casuta" id="preconizatq3invatare"  type="text" disabled value="${q3.OBJECTIVE_TARGET}">
                                </div>
                            </div>
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="r1">Realizat</h8>
                                    <input class="form-control casuta" id="realizatq3invatare" type="text" disabled value="${q3.RESULT_VALUE}">
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-xs-6">
                                <h8>Procent realizare:</h8>
                            </div>
                            <div class = "col-xs-4">
                                <input class="form-control casuta" disabled type="text">
                            </div>
                            <div class = "col-xs-2">
                                <label  class ="meniu">%</label>
                            </div>

                        </div>



                    </div>

                    <div class = "col-md-3">
                        <div class = "row">
                            <div class = "col-md-1">
                                <h1>Q4</h1>
                            </div>
                            <div class = "col-md-1">
                                <a href="#" data-toggle="tooltip" title="${q4.OBJECTIVE_NAME}"> <span class="glyphicon glyphicon-info-sign"></span></a>
                            </div>
                            <div class="col-md-10">
                            </div>
                        </div>
                        <div class = "row">
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="p1">Valoare obiectiv</h8>
                                    <input class="form-control casuta" id="preconizatq4invatare"  type="text" disabled value="${q4.OBJECTIVE_TARGET}">
                                </div>
                            </div>
                            <div class ="col-xs-6">
                                <div class="form-group">
                                    <h8 for="r1">Realizat</h8>
                                    <input class="form-control casuta" id="realizatq4invatare" type="text" disabled value="${q4.RESULT_VALUE}">
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-xs-6">
                                <h8>Procent realizare:</h8>
                            </div>
                            <div class = "col-xs-4">
                                <input class="form-control casuta" disabled type="text">
                            </div>
                            <div class = "col-xs-2">
                                <label  class ="meniu">%</label>
                            </div>

                        </div>



                    </div>



                </div>

            </div>
        </div>



    </div>
    <h2>  </h2>
</c:forEach>


<script>
    $(document).ready(function() {
        //this calculates values automatically
        preconizat();
        $("#preconizatq1, #realizatq1").on("keydown keyup", function() {
            preconizat();
        });
    });

    $(document).ready(function() {
        //this calculates values automatically
        preconizat2();
        $("#preconizatq1clienti, #realizatq1clienti").on("keydown keyup", function() {
            preconizat2();
        });
    });

    $(document).ready(function() {
        //this calculates values automatically
        preconizat3();
        $("#preconizatq1procese, #realizatq1procese").on("keydown keyup", function() {
            preconizat3();
        });
    });

    $(document).ready(function() {
        //this calculates values automatically
        preconizat4();
        $("#preconizatq1oameni, #realizatq1oameni").on("keydown keyup", function() {
            preconizat4();
        });
    });

    function preconizat() {
        var realizat =  document.getElementById('realizatq1').value;
        var preconizat =  document.getElementById('preconizatq1').value;
        var result = (100 * parseInt(realizat)) / parseInt(preconizat);
        if (!isNaN(result)) {
            document.getElementById('procentq1').value = result;

        }
    }

    function preconizat2() {
        var realizat =  document.getElementById('realizatq1clienti').value;
        var preconizat =  document.getElementById('preconizatq1clienti').value;
        var result = (100 * parseInt(realizat)) / parseInt(preconizat);
        if (!isNaN(result)) {
            document.getElementById('procentq1clienti').value = result;

        }
    }

    function preconizat3() {
        var realizat =  document.getElementById('realizatq1procese').value;
        var preconizat =  document.getElementById('preconizatq1procese').value;
        var result = (100 * parseInt(realizat)) / parseInt(preconizat);
        if (!isNaN(result)) {
            document.getElementById('procentq1procese').value = result;

        }
    }

    function preconizat4() {
        var realizat =  document.getElementById('realizatq1oameni').value;
        var preconizat =  document.getElementById('preconizatq1oameni').value;
        var result = (100 * parseInt(realizat)) / parseInt(preconizat);
        if (!isNaN(result)) {
            document.getElementById('procentq1oameni').value = result;

        }
    }

    $(document).ready(function() {
        //this calculates values automatically
        sum();
        $("#financiar, #procese,#clienti,#invatare,#oameni").keydown(function() {
            sum();
        });
        $("#financiar, #procese,#clienti,#invatare,#oameni").keyup(function() {
            sum();
        });
    });

    $(document).ready(function() {
        //this calculates values automatically
        calificativ();
        $("#q1").keydown(function() {
            calificativ();
        });
        $("#q1").keyup(function() {
            calificativ();
        });
    });
    function calificativ(){
        var q1 = document.getElementById('q1').value;


        if ((q1 == 'Well Done') || (q1 == 'Learn') || (q1 == 'Deliver') || (q1 =='Role Model') ||

            (q1 == '')
        ){
            $('#eroare').hide();

            document.getElementById("submit").disabled = false;
        }
        else{
            $('#eroare').show();

            document.getElementById("submit").disabled = true;

        }
    }



    $(document).ready(function() {
        //this calculates values automatically
        calificativ2();
        $("#nq1").keydown(function() {
            calificativ2();
        });
        $("#nq1").keyup(function() {
            calificativ2();
        });
    });
    function calificativ2(){

        var nq1 = document.getElementById('nq1').value;


        if ( (nq1 == 'Well Done') || (nq1 == 'Learn') || (nq1 == 'Deliver') || (nq1 =='Role Model') ||

            (nq1 == '')
        ){
            $('#eroare').hide();

            document.getElementById("submit").disabled = false;
        }
        else{
            $('#eroare').show();

            document.getElementById("submit").disabled = true;

        }
    }

    function sum() {
        console.log("a intrar");
        var financiar_procent = document.getElementById('financiar').value;
        var clienti_procent = document.getElementById('clienti').value;
        var procese_procent = document.getElementById('procese').value;
        var invatare_procent = document.getElementById('invatare').value;
        var oameni_procent = document.getElementById('oameni').value;
        var result = parseInt(financiar_procent) + parseInt(clienti_procent) + parseInt(procese_procent) + parseInt(invatare_procent) +parseInt(oameni_procent);
        console.log("rez");
        console.log(result);



        if ((result) != 100) {

            $('#eroare').show();

            document.getElementById("submit").disabled = true;
        }
        else{
            $('#eroare').hide();

            document.getElementById("submit").disabled = false;

        }
    }


</script>
<script>

    google.charts.load('current', {packages: ['corechart', 'bar']});

    var integritate = parseInt(document.getElementById('nota_integritate').value);
    var pasiune = parseInt(document.getElementById('nota_pasiune').value);
    var invatare = parseInt(document.getElementById('nota_invatare').value);
    var discernamant = parseInt(document.getElementById('nota_discernamant').value);
    var colaborare = parseInt(document.getElementById('nota_colaborare').value);
    var simplitate = parseInt(document.getElementById('nota_simplitate').value);
    var respect = parseInt(document.getElementById('nota_respect').value);

    if (respect == null){
        respect = 5;
    }
    if (pasiune == null){
        pasiune = 5;
    }
    if (invatare == null){
        invatare = 5;
    }
    if (discernamant == null){
        discernamant = 5;
    }
    if (colaborare == null){
        colaborare = 5;
    }
    if (simplitate == null){
        simplitate = 5;
    }
    if (integritate == null){
        integritate = 5;
    }


    google.charts.setOnLoadCallback(drawBasic);
    function drawBasic() {



        var data = google.visualization.arrayToDataTable([
            ['Valori', 'Note',{role:'style'}],
            ['Integritate', integritate,'#F6921F'],
            ['Pasiune', pasiune,'#EC2027'],
            ['Invatare', invatare,'#7ACBC7'],
            ['Discernamant', discernamant,'#949393'],
            ['Colaborare', colaborare,'#363535'],
            ['Simplitate', simplitate,'#C3DE9A'],
            ['Respect', respect,'#A9A035']
        ]);

        var options = {

            backgroundColor: '#f0f0f0',
            chartArea: {width: '50%'},
            bar: {groupWidth:"85%"},
            title: 'Valori',
            width: 600,
            height:300,
            animation:{
                duration:1500,
                easing:'out',
                startup:true
            },
            hAxis: {

                minValue: 0
            },

        };

        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

        chart.draw(data, options);

    }



</script>

<script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
        var financiar_procent = parseInt(document.getElementById('financiar_procent').value);
        var clienti_procent = parseInt(document.getElementById('clienti_procent').value);
        var procese_procent = parseInt(document.getElementById('procese_procent').value);
        var invatare_procent = parseInt(document.getElementById('invatare_procent').value);
        var oameni_procent = parseInt(document.getElementById('oameni_procent').value);

        var data = google.visualization.arrayToDataTable([
            ['Perspective', 'Procent'],
            ['Financiar', financiar_procent], ['Clienti', clienti_procent], ['Procese',procese_procent],
            ['Oameni', oameni_procent], ['Invatare si dezvoltare', invatare_procent]
        ]);

        var options = {
            title: 'Perspective',
            legend: 'none',
            backgroundColor: '#f0f0f0',
            slices:{
                0:{color:'#7ACBC7'},
                1:{color:'#F6921F'},
                2:{color:'#C3DE9A'},
                3:{color:'#A9A035'},
                4:{color:'#949393'},

            }

        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
        // initial value
        var percent = 0;
        // start the animation loop
        var handler = setInterval(function(){
            // values increment
            percent += 1;
            // apply new values
            data.setValue(0, 1, percent);
            data.setValue(1, 1, 100 - percent - procese_procent - oameni_procent - invatare_procent);
            // update the pie
            chart.draw(data, options);
            // check if we have reached the desired value
            if (percent >= financiar_procent)
            // stop the loop
                clearInterval(handler);
        }, 30);
    }


</script>


<script>
    $('[data-toggle]').tooltip()
   /* $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });*/

</script>

<footer class="container-fluid text-center">
    <div class ="container">
        <div class = "row">
            <div class = "col-md-3">

            </div>
            <div class = "col-md-2">
                <a href="/home"> <p style="font-family: raiff_regular;color: whitesmoke">Rezultatele Mele</p></a>
             </div>
            <div class = "col-md-2">
                <a href="/perspective">  <p style="font-family: raiff_regular;color: whitesmoke">Perspective</p></a>
            </div>
            <div class = "col-md-2">
                <a href="/valori">  <p style="font-family: raiff_regular;color: whitesmoke">Valori</p></a>
            </div>
            <div class = "col-md-3">

            </div>



        </div>
    </div>
    <a href="#home" title="To Top">
        <span class="glyphicon glyphicon-chevron-up"></span>
    </a>

</footer>

<script>
    $(document).ready(function(){
        // Add smooth scrolling to all links in navbar + footer link
        $(".navbar a, footer a[href='#home']").on('click', function(event) {
            // Make sure this.hash has a value before overriding default behavior
            if (this.hash !== "") {
                // Prevent default anchor click behavior
                event.preventDefault();

                // Store hash
                var hash = this.hash;

                // Using jQuery's animate() method to add smooth page scroll
                // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                $('html, body').animate({
                    scrollTop: $(hash).offset().top
                }, 900, function(){

                    // Add hash (#) to URL when done scrolling (default click behavior)
                    window.location.hash = hash;
                });
            } // End if
        });

        $(window).scroll(function() {
            $(".slideanim").each(function(){
                var pos = $(this).offset().top;

                var winTop = $(window).scrollTop();
                if (pos < winTop + 600) {
                    $(this).addClass("slide");
                }
            });
        });
    })
</script>



</body>
</html>