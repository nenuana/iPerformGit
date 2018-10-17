<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Valori</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://apis.google.com/js/api:client.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="stilizare.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">






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
<body id="valori" data-spy="scroll" data-target=".navbar" data-offset="60">

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
            <li class="butonfaq"><a href="/home">  <span class="glyphicon glyphicon-home"></span> Rezultatele mele</a></li>
            <li class="butonfaq"><a href="/perspective">Perspective</a></li>
            <li class="home"><a href="/valori">Valori</a></li>
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
                <li class="butonfaq"><a href="/home"> <span class="glyphicon glyphicon-home"></span> Rezultatele mele</a></li>
                <li class="butonfaq"><a href="/perspective">Perspective</a></li>
                <li class="home"><a href="/valori">Valori</a></li>


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




<div class = "container">

<div class = "valori">Valori</div>

</div>

<h2>  </h2>
<h2>  </h2>

<div class="container">
    <div class = "col-md-6">

        <div class="alert alert-success" style="width:96%">
            <strong>Perspectiva angajat!</strong> Se completeaza de catre angajat.
        </div>
    </div>
    <div class = "col-md-6">

        <div class="alert alert-info" style="width:96%">
            <strong>Perspectiva superior!</strong> Se completeaza de catre superior.
        </div>
    </div>

</div>

<h2>  </h2>

<form method="POST" action="/doInsertValori">
<c:if test="${not empty valori}">

<c:forEach items ="${valori}" var="val">

<div class = "container">
    <div class = "row">
        <div class = "col-md-1">
            <img src="integritate.png" class="img-circle"  type="text" data-toggle="tooltip" data-placement="left" title="Descriere Integritate" alt="Cinque Terre" width="70" height="70" style=" margin-top: 4px;">
        </div>
        <div class = "col-md-11">
            <div class ="row">
                <div class ="col-md-2 text-center">

                    <div class ="valori">Integritate</div>
                </div>

                <div class ="col-md-10">

                </div>

            </div>

        </div>

    </div>

</div>
<br>
<div class ="container">
    <div class ="row">
        <div class ="col-md-6">
            <div class="row">
                <div class = "col-md-1">
                    <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                </div>
                <div class="col-md-1">

                </div>
                <div class ="col-md-3" style="padding-top: 10px; font-family: raiff_regular">

                    Nota ta este: <b>${val.nota_integritate}</b>

                </div>
                <div class="col-md-3" style="padding-top: 10px; font-family: raiff_regular">
                    Alege alta nota:
                </div>
                <div class="col-md-2">
                    <c:choose>
                        <c:when test="${not empty emailechipa}">
                            <input id="nota_integritate" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nota_integritate" disabled value = ${val.nota_integritate}>
                        </c:when>
                        <c:otherwise>
                            <input id="nota_integritate" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nota_integritate" value = ${val.nota_integritate}>
                        </c:otherwise>
                    </c:choose>


                </div>
                <div class="col-md-2">
                    <span class="validity"></span>
                </div>
                <div class="col-md-1">

                </div>
            </div>

        </div>

        <div class ="col-md-6" style="padding-left:2%">
            <div class="row">
                <div class = "col-md-1">
                    <img src="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                </div>
                <div class="col-md-1">

                </div>
                <div class ="col-md-3" style="padding-top: 10px;">

                    Nota ta este: <b>${val.nnota_integritate}</b>

                </div>
                <div class="col-md-3" style="padding-top: 10px;">
                    Alege alta nota:
                </div>
                <div class="col-md-2">
                    <c:choose>
                        <c:when test="${not empty emailechipa}">
                            <input id="nnota_integritate" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nnota_integritate"  value = ${val.nnota_integritate}>
                        </c:when>
                        <c:otherwise>
                            <input id="nnota_integritate" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nnota_integritate" disabled value = ${val.nnota_integritate}>
                        </c:otherwise>
                    </c:choose>


                </div>
                <div class="col-md-2">
                    <span class="validity"></span>
                </div>
                <div class="col-md-1">

                </div>
            </div>

        </div>

    </div>


</div>

<br>
<div class ="container">
    <div class = "row">
        <div class = "col-md-6">

            <c:choose>
                <c:when test="${not empty emailechipa}">
                    <textarea class="form-control" rows="5" id="comment" name = "integritate" style ="width:96%" disabled>${val.integritate}</textarea>

                </c:when>
                <c:otherwise>
                    <textarea class="form-control" rows="5" id="comment" name = "integritate" style ="width:96%">${val.integritate}</textarea>
                </c:otherwise>
            </c:choose>


        </div>
        <div class = "col-md-6">

            <c:choose>
                <c:when test="${not empty emailechipa}">
                    <textarea class="form-control" rows="5" id="comment" name = "nintegritate" style ="width:96%" >${val.nintegritate}</textarea>

                </c:when>
                <c:otherwise>
                    <textarea class="form-control" rows="5" id="comment" name = "nintegritate" style ="width:96%" disabled>${val.nintegritate}</textarea>
                </c:otherwise>
            </c:choose>


        </div>
    </div>

</div>

<h2></h2>
<h2></h2>

</c:forEach>
</c:if>

<c:if test="${not empty valori}">

    <c:forEach items ="${valori}" var="val">

        <div class = "container">
            <div class = "row">
                <div class = "col-md-1">
                    <img src="pasiune.png" class="img-circle" alt="Cinque Terre" data-toggle="tooltip" data-placement="left" title="Descriere Pasiune" width="70" height="70" style=" margin-top: 4px;">
                </div>
                <div class = "col-md-11">
                    <div class ="row">
                        <div class ="col-md-2 text-center">
                            <div class ="valori">Pasiune</div>
                        </div>


                        <div class ="col-md-10">

                        </div>

                    </div>

                </div>

            </div>

        </div>
        <br>
        <div class ="container">
            <div class ="row">
                <div class ="col-md-6">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class ="col-md-3" style="padding-top: 10px; font-family: raiff_regular">

                            Nota ta este: <b>${val.nota_pasiune}</b>

                        </div>
                        <div class="col-md-3" style="padding-top: 10px; font-family: raiff_regular">
                            Alege alta nota:
                        </div>
                        <div class="col-md-2">
                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input id="nota_pasiune" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nota_pasiune" disabled value = ${val.nota_pasiune}>
                                </c:when>
                                <c:otherwise>
                                    <input id="nota_pasiune" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nota_pasiune" value = ${val.nota_pasiune}>
                                </c:otherwise>
                            </c:choose>


                        </div>
                        <div class="col-md-2">
                            <span class="validity"></span>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>

                </div>

                <div class ="col-md-6" style="padding-left:2%">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">

                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class ="col-md-3" style="padding-top: 10px; font-family: raiff_regular">

                            Nota ta este: <b>${val.nnota_pasiune}</b>

                        </div>
                        <div class="col-md-3" style="padding-top: 10px; font-family: raiff_regular">
                            Alege alta nota:
                        </div>
                        <div class="col-md-2">
                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input id="nnota_pasiune" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nnota_pasiune"  value = ${val.nnota_pasiune}>
                                </c:when>
                                <c:otherwise>
                                    <input id="nnota_pasiune" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nnota_pasiune"  disabled value = ${val.nnota_pasiune}>
                                </c:otherwise>
                            </c:choose>


                        </div>
                        <div class="col-md-2">
                            <span class="validity"></span>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>


                </div>

            </div>


        </div>

        <br>
        <div class ="container">
            <div class = "row">
                <div class = "col-md-6">
                    <c:choose>
                        <c:when test="${not empty emailechipa}">
                            <textarea class="form-control" rows="5" id="comment" name = "pasiune" style ="width:96%" disabled>${val.pasiune}</textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea class="form-control" rows="5" id="comment" name = "pasiune" style ="width:96%">${val.pasiune}</textarea>
                        </c:otherwise>
                    </c:choose>


                </div>
                <div class = "col-md-6">

                    <c:choose>
                        <c:when test="${not empty emailechipa}">
                            <textarea class="form-control" rows="5" id="comment" name = "npasiune" style ="width:96%" >${val.npasiune}</textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea class="form-control" rows="5" id="comment" name = "npasiune" style ="width:96%" disabled>${val.npasiune}</textarea>
                        </c:otherwise>
                    </c:choose>


                </div>
            </div>

        </div>

        <h2></h2>
        <h2></h2>

    </c:forEach>
</c:if>

<c:if test="${not empty valori}">

    <c:forEach items ="${valori}" var="val">

        <div class = "container">
            <div class = "row">
                <div class = "col-md-1">
                    <img src="invatare.png" class="img-circle" alt="Cinque Terre" data-toggle="tooltip" data-placement="left" title="Descriere Invatare" width="70" height="70" style=" margin-top: 4px;">
                </div>
                <div class = "col-md-11">
                    <div class ="row">
                        <div class ="col-md-2 text-center">
                            <div class ="valori">Invatare</div>
                        </div>


                        <div class ="col-md-10">

                        </div>

                    </div>

                </div>

            </div>

        </div>
        <br>
        <div class ="container">
            <div class ="row">
                <div class ="col-md-6">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class ="col-md-3" style="padding-top: 10px; font-family: raiff_regular">

                            Nota ta este: <b>${val.nota_invatare}</b>

                        </div>
                        <div class="col-md-3" style="padding-top: 10px; font-family: raiff_regular">
                            Alege alta nota:
                        </div>
                        <div class="col-md-2">
                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input id="nota_invatare" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nota_invatare" disabled value = ${val.nota_invatare}>
                                </c:when>
                                <c:otherwise>
                                    <input id="nota_invatare" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nota_invatare"  value = ${val.nota_invatare}>
                                </c:otherwise>

                            </c:choose>



                        </div>
                        <div class="col-md-2">
                            <span class="validity"></span>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>

                </div>

                <div class ="col-md-6" style="padding-left:2%">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class ="col-md-3" style="padding-top: 10px; font-family: raiff_regular">

                            Nota ta este: <b>${val.nnota_invatare}</b>

                        </div>
                        <div class="col-md-3" style="padding-top: 10px; font-family: raiff_regular">
                            Alege alta nota:
                        </div>
                        <div class="col-md-2">
                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input id="nnota_invatare" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nnota_invatare"   value = ${val.nnota_invatare}>
                                </c:when>
                                <c:otherwise>
                                    <input id="nnota_invatare" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nnota_invatare" disabled value = ${val.nnota_invatare}>
                                </c:otherwise>

                            </c:choose>



                        </div>
                        <div class="col-md-2">
                            <span class="validity"></span>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>

                </div>

            </div>


        </div>

        <br>
        <div class ="container">
            <div class = "row">
                <div class = "col-md-6">
                    <c:choose>
                        <c:when test="${not empty emailechipa}">
                            <textarea class="form-control" rows="5" id="comment" name = "invatare" style ="width:96%" disabled>${val.invatare}</textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea class="form-control" rows="5" id="comment" name = "invatare" style ="width:96%">${val.invatare}</textarea>
                        </c:otherwise>
                    </c:choose>



                </div>
                <div class = "col-md-6">

                    <c:choose>
                        <c:when test="${not empty emailechipa}">
                            <textarea class="form-control" rows="5" id="comment" name = "ninvatare" style ="width:96%">${val.ninvatare}</textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea class="form-control" rows="5" id="comment" name = "ninvatare" disabled style ="width:96%">${val.ninvatare}</textarea>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>

        </div>

        <h2></h2>
        <h2></h2>

    </c:forEach>
</c:if>

<c:if test="${not empty valori}">

    <c:forEach items ="${valori}" var="val">

        <div class = "container">
            <div class = "row">
                <div class = "col-md-1">
                    <img src="colaborare.png" class="img-circle" alt="Cinque Terre" data-toggle="tooltip" data-placement="left" title="Descriere colaborare" width="70" height="70" style=" margin-top: 4px;">
                </div>
                <div class = "col-md-11">
                    <div class ="row">
                        <div class ="col-md-2 text-center">
                            <div class ="valori">Colaborare</div>
                        </div>

                        <div class ="col-md-10">

                        </div>

                    </div>

                </div>

            </div>

        </div>
        <br>
        <div class ="container">
            <div class ="row">
                <div class ="col-md-6">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class ="col-md-3" style="padding-top: 10px; font-family: raiff_regular">

                            Nota ta este: <b>${val.nota_colaborare}</b>

                        </div>
                        <div class="col-md-3" style="padding-top: 10px; font-family: raiff_regular">
                            Alege alta nota:
                        </div>
                        <div class="col-md-2">
                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input id="nota_colaborare" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nota_colaborare" disabled value = ${val.nota_colaborare}>
                                </c:when>
                                <c:otherwise>
                                    <input id="nota_colaborare" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nota_colaborare" value = ${val.nota_colaborare}>
                                </c:otherwise>
                            </c:choose>


                        </div>
                        <div class="col-md-2">
                            <span class="validity"></span>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>

                </div>

                <div class ="col-md-6" style="padding-left:2%">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class ="col-md-3" style="padding-top: 10px; font-family: raiff_regular">

                            Nota ta este: <b>${val.nnota_colaborare}</b>

                        </div>
                        <div class="col-md-3" style="padding-top: 10px; font-family: raiff_regular">
                            Alege alta nota:
                        </div>
                        <div class="col-md-2">
                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input id="nnota_colaborare" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nnota_colaborare" value = ${val.nnota_colaborare}>
                                </c:when>
                                <c:otherwise>
                                    <input id="nnota_colaborare" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nnota_colaborare" disabled value = ${val.nnota_colaborare}>
                                </c:otherwise>
                            </c:choose>


                        </div>
                        <div class="col-md-2">
                            <span class="validity"></span>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>

                </div>

            </div>


        </div>

        <br>
        <div class ="container">
            <div class = "row">
                <div class = "col-md-6">

                    <c:choose>
                    <c:when test="${not empty emailechipa}">
                        <textarea class="form-control" rows="5" id="comment" name = "colaborare" style ="width:96%" disabled>${val.colaborare}</textarea>
                    </c:when>
                        <c:otherwise>
                            <textarea class="form-control" rows="5" id="comment" name = "colaborare" style ="width:96%">${val.colaborare}</textarea>

                        </c:otherwise>
                    </c:choose>


                </div>
                <div class = "col-md-6">

                    <c:choose>
                        <c:when test="${not empty emailechipa}">
                            <textarea class="form-control" rows="5" id="comment" name = "ncolaborare" style ="width:96%">${val.ncolaborare}</textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea class="form-control" rows="5" id="comment" name = "ncolaborare" style ="width:96%" disabled>${val.ncolaborare}</textarea>

                        </c:otherwise>
                    </c:choose>

                </div>
            </div>

        </div>

        <h2></h2>
        <h2></h2>

    </c:forEach>
</c:if>

<c:if test="${not empty valori}">

    <c:forEach items ="${valori}" var="val">

        <div class = "container">
            <div class = "row">
                <div class = "col-md-1">
                    <img src="simplitate.bmp" class="img-circle" alt="Cinque Terre" data-toggle="tooltip" data-placement="left" title="Descriere Simplitate" width="70" height="70" style=" margin-top: 4px;">
                </div>
                <div class = "col-md-11">
                    <div class ="row">
                        <div class ="col-md-2 text-center">
                            <div class ="valori">Simplitate</div>
                        </div>

                        <div class ="col-md-10">

                        </div>

                    </div>

                </div>

            </div>

        </div>
        <br>
        <div class ="container">
            <div class ="row">
                <div class ="col-md-6">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class ="col-md-3" style="padding-top: 10px; font-family: raiff_regular">

                            Nota ta este: <b>${val.nota_simplitate}</b>

                        </div>
                        <div class="col-md-3" style="padding-top: 10px; font-family: raiff_regular">
                            Alege alta nota:
                        </div>
                        <div class="col-md-2">
                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input id="nota_simplitate" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nota_simplitate" disabled value = ${val.nota_simplitate}>
                                </c:when>
                                <c:otherwise>
                                    <input id="nota_simplitate" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nota_simplitate" value = ${val.nota_simplitate}>
                                </c:otherwise>
                            </c:choose>


                        </div>
                        <div class="col-md-2">
                            <span class="validity"></span>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>

                </div>

                <div class ="col-md-6" style="padding-left:2%">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class ="col-md-3" style="padding-top: 10px; font-family: raiff_regular">

                            Nota ta este: <b>${val.nnota_simplitate}</b>

                        </div>
                        <div class="col-md-3" style="padding-top: 10px; font-family: raiff_regular">
                            Alege alta nota:
                        </div>
                        <div class="col-md-2">
                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input id="nnota_simplitate" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nnota_simplitate" value = ${val.nnota_simplitate}>
                                </c:when>
                                <c:otherwise>
                                    <input id="nnota_simplitate" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nnota_simplitate" disabled value = ${val.nnota_simplitate}>
                                </c:otherwise>
                            </c:choose>
`

                        </div>
                        <div class="col-md-2">
                            <span class="validity"></span>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>

                </div>

            </div>


        </div>

        <br>
        <div class ="container">
            <div class = "row">
                <div class = "col-md-6">

                    <c:choose>
                        <c:when test="${not empty emailechipa}">
                            <textarea class="form-control" rows="5" id="comment" style ="width:96%" name = "simplitate" disabled>${val.simplitate}</textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea class="form-control" rows="5" id="comment" style ="width:96%" name = "simplitate" >${val.simplitate}</textarea>
                        </c:otherwise>
                    </c:choose>


                </div>
                <div class = "col-md-6">

                    <c:choose>
                        <c:when test="${not empty emailechipa}">
                            <textarea class="form-control" rows="5" id="comment" style ="width:96%" name = "nsimplitate" >${val.nsimplitate}</textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea class="form-control" rows="5" id="comment" style ="width:96%" name = "nsimplitate" disabled>${val.nsimplitate}</textarea>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>

        </div>

        <h2></h2>
        <h2></h2>

    </c:forEach>
</c:if>

<c:if test="${not empty valori}">

    <c:forEach items ="${valori}" var="val">

        <div class = "container">
            <div class = "row">
                <div class = "col-md-1">
                    <img src="respect.png" class="img-circle" alt="Cinque Terre" data-toggle="tooltip" data-placement="left" title="Descriere respect" width="70" height="70" style=" margin-top: 4px;">
                </div>
                <div class = "col-md-11">
                    <div class ="row">
                        <div class ="col-md-2 text-center">
                            <div class ="valori">Respect</div>
                        </div>

                        <div class ="col-md-10">

                        </div>

                    </div>

                </div>

            </div>

        </div>
        <br>
        <div class ="container">
            <div class ="row">
                <div class ="col-md-6">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class ="col-md-3" style="padding-top: 10px; font-family: raiff_regular">

                            Nota ta este: <b>${val.nota_respect}</b>

                        </div>
                        <div class="col-md-3" style="padding-top: 10px; font-family: raiff_regular">
                            Alege alta nota:
                        </div>
                        <div class="col-md-2">
                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input id="nota_respect" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nota_respect" disabled value = ${val.nota_respect}>
                                </c:when>
                                <c:otherwise>
                                    <input id="nota_respect" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nota_respect" value = ${val.nota_respect}>
                                </c:otherwise>
                            </c:choose>


                        </div>
                        <div class="col-md-2">
                            <span class="validity"></span>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>

                </div>

                <div class ="col-md-6" style="padding-left:2%">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class ="col-md-3" style="padding-top: 10px; font-family: raiff_regular">

                            Nota ta este: <b>${val.nnota_respect}</b>

                        </div>
                        <div class="col-md-3" style="padding-top: 10px; font-family: raiff_regular">
                            Alege alta nota:
                        </div>
                        <div class="col-md-2">
                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input id="nnota_respect" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nnota_respect"  value = ${val.nnota_respect}>
                                </c:when>
                                <c:otherwise>
                                    <input id="nnota_respect" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nnota_respect"  disabled value = ${val.nnota_respect}>
                                </c:otherwise>
                            </c:choose>


                        </div>
                        <div class="col-md-2">
                            <span class="validity"></span>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>


                </div>

            </div>


        </div>

        <br>
        <div class ="container">
            <div class = "row">
                <div class = "col-md-6">

                    <c:choose>
                        <c:when test="${not empty emailechipa}">
                            <textarea class="form-control" rows="5" id="comment" name = "respect" style ="width:96%"disabled>${val.respect}</textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea class="form-control" rows="5" id="comment" name = "respect" style ="width:96%">${val.respect}</textarea>
                        </c:otherwise>
                    </c:choose>


                </div>
                <div class = "col-md-6">

                    <c:choose>
                        <c:when test="${not empty emailechipa}">
                            <textarea class="form-control" rows="5" id="comment" name = "nrespect" style ="width:96%">${val.nrespect}</textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea class="form-control" rows="5" id="comment" name = "nrespect" style ="width:96%" disabled>${val.nrespect}</textarea>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>

        </div>

        <h2></h2>
        <h2></h2>

    </c:forEach>
</c:if>

<c:if test="${not empty valori}">

    <c:forEach items ="${valori}" var="val">

        <div class = "container">
            <div class = "row">
                <div class = "col-md-1">
                    <img src="discernamant.png" class="img-circle" alt="Cinque Terre" data-toggle="tooltip" data-placement="left" title="Descriere Discernamant" width="70" height="70" style=" margin-top: 4px;">
                </div>
                <div class = "col-md-11">
                    <div class ="row">
                        <div class ="col-md-2 text-center">
                            <div class ="valori">Discernamant</div>
                        </div>

                        <div class ="col-md-10">

                        </div>

                    </div>

                </div>

            </div>

        </div>
        <br>
        <div class ="container">
            <div class ="row">
                <div class ="col-md-6">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class ="col-md-3" style="padding-top: 10px; font-family: raiff_regular">

                            Nota ta este: <b>${val.nota_discernamant}</b>

                        </div>
                        <div class="col-md-3" style="padding-top: 10px;font-family: raiff_regular">
                            Alege alta nota:
                        </div>
                        <div class="col-md-2">
                            <c:choose>
                                <c:when test="${not empty emailechipa} ">
                                    <input id="nota_discernamant"  style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nota_discernamant" disabled  value = ${val.nota_discernamant}>
                                </c:when>
                                <c:otherwise>
                                    <input id="nota_discernamant" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nota_discernamant" value = ${val.nota_discernamant}>
                                </c:otherwise>
                            </c:choose>


                        </div>
                        <div class="col-md-2">
                            <span class="validity"></span>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>

                </div>

                <div class ="col-md-6" style="padding-left:2%">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class ="col-md-3" style="padding-top: 10px; font-family: raiff_regular">

                            Nota ta este: <b>${val.nnota_discernamant}</b>

                        </div>
                        <div class="col-md-3" style="padding-top: 10px; font-family: raiff_regular">
                            Alege alta nota:
                        </div>
                        <div class="col-md-2">
                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <input id="nnota_discernamant" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nnota_discernamant"  value = ${val.nnota_discernamant}>
                                </c:when>
                                <c:otherwise>
                                    <input id="nnota_discernamant" style="margin-top: 6px;" type="number" step="1" min="1" max="8" required name ="nnota_discernamant" disabled value = ${val.nnota_discernamant}>
                                </c:otherwise>
                            </c:choose>


                        </div>
                        <div class="col-md-2">
                            <span class="validity"></span>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>

                </div>

            </div>


        </div>

        <br>
        <div class ="container">
            <div class = "row">
                <div class = "col-md-6">
                    <c:choose>
                        <c:when test="${not empty emailechipa}">
                            <textarea class="form-control" rows="5" id="comment" style ="width:96%" name ="discernamant" disabled>${val.discernamant}</textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea class="form-control" rows="5" id="comment" style ="width:96%" name ="discernamant">${val.discernamant}</textarea>
                        </c:otherwise>
                    </c:choose>



                </div>
                <div class = "col-md-6">

                    <c:choose>
                        <c:when test="${not empty emailechipa}">
                            <textarea class="form-control" rows="5" id="comment" style ="width:96%" name ="ndiscernamant">${val.ndiscernamant}</textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea class="form-control" rows="5" id="comment" style ="width:96%" name ="ndiscernamant" disabled>${val.ndiscernamant}</textarea>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>

        </div>

        <h2></h2>
        <h2></h2>

    </c:forEach>
</c:if>

<div class = "container">

    <div class = "row">
        <div class = "col-md-10">

        </div>
        <div class = "col-md-2">


                <button type="submit" class="detalii" style="width: 100px;height: 60px;margin-bottom: 10px;">
                    <i class="material-icons">cloud_done</i> Salveaza
                </button>

        </div>
    </div>
</div>




</form>




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
    <a href="#valori" title="To Top">
        <span class="glyphicon glyphicon-chevron-up"></span>
    </a>

</footer>

<script>
    $(document).ready(function(){
        // Add smooth scrolling to all links in navbar + footer link
        $(".navbar a, footer a[href='#valori']").on('click', function(event) {
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

<script>
    $('[data-toggle]').tooltip();

</script>
</body>
</html>