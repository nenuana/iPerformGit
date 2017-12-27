<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="stilizare.css">

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
                        <a class="nume" style="font-size: 24px;"> ${first_name} ${last_name}</a>
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
<div class = "valori">Valori</div>

</div>

<form method="POST" action="doInsert">
<c:if test="${not empty valori}">

<c:forEach items ="${valori}" var="val">

<div class = "container">
    <div class = "row">
        <div class = "col-md-1">
            <img src="integritate.png" class="img-circle" alt="Cinque Terre" width="70" height="70" style=" margin-top: 4px;">
        </div>
        <div class = "col-md-11">
            <div class ="row">
                <div class ="col-md-12">
                    <div class ="valori">Integritate</div>
                </div>
            </div>
            <div class = "row">
                <div class ="col-md-12">
                    <h8> Reprezinti un model de standarde ridicate, astfel incat oamenii simt ca au incredere in tine</h8>
                    <a href="#" data-toggle="tooltip" title="Descriere integritate"> <span class="glyphicon glyphicon-info-sign"></span></a>
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
                <div class ="col-md-1">



                    <select name="nota_integritate"class="drop" style="margin-left:10px;">
                        <option value="0" name = "nota_integritate" selected disabled>${val.nota_integritate}</option>
                        <option value="1"><c:out value="0" /></option>
                        <option value="2"><c:out value="1" /></option>
                        <option value="3"><c:out value="2" /></option>
                        <option value="4"><c:out value="3" /></option>
                        <option value="5"><c:out value="4" /></option>
                        <option value="6"><c:out value="5" /></option>
                        <option value="7"><c:out value="6" /></option>
                        <option value="8"><c:out value="7" /></option>
                        <option value="9"><c:out value="8" /></option>
                    </select>
                </div>
                <div class="col-md-10">

                </div>
            </div>

        </div>

        <div class ="col-md-6" style="padding-left:2%">
            <div class="row">
                <div class = "col-md-1">
                    <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                </div>
                <div class ="col-md-1">
                    <select name="unit"class="drop"  style="margin-left:10px;">
                        <option value="1" selected disabled>Nota</option>
                        <option value="2" selected >0</option>
                        <option value="3" selected >1</option>
                        <option value="4" selected >2</option>
                        <option value="5" selected >3</option>
                        <option value="6" selected >4</option>
                        <option value="7" selected >5</option>
                        <option value="8" selected >6</option>
                        <option value="9" selected >7</option>
                        <option value="10" selected >8</option>
                    </select>
                </div>
                <div class="col-md-10">

                </div>
            </div>

        </div>

    </div>


</div>

<br>
<div class ="container">
    <div class = "row">
        <div class = "col-md-6">

                <textarea class="form-control" rows="5" id="comment" name = "integritate" style ="width:96%">${val.integritate}</textarea>

        </div>
        <div class = "col-md-6">

                <textarea class="form-control" rows="5" id="comment" style="width: 96%; margin-left: 4%;"></textarea>

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
                    <img src="pasiune.png" class="img-circle" alt="Cinque Terre" width="70" height="70" style=" margin-top: 4px;">
                </div>
                <div class = "col-md-11">
                    <div class ="row">
                        <div class ="col-md-12">
                            <div class ="valori">Pasiune</div>
                        </div>
                    </div>
                    <div class = "row">
                        <div class ="col-md-12">
                            <h8> Reprezinti un model de standarde ridicate, astfel incat oamenii simt ca au incredere in tine</h8>
                            <a href="#" data-toggle="tooltip" title="Descriere pasiune"> <span class="glyphicon glyphicon-info-sign"></span></a>
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
                        <div class ="col-md-1">



                            <select name="nota_pasiune"class="drop" style="margin-left:10px;">
                                <option value="${val.nota_pasiune}"selected disabled>${val.nota_pasiune}</option>
                                <option value="0"><c:out value="0" /></option>
                                <option value="1"><c:out value="1" /></option>
                                <option value="2"><c:out value="2" /></option>
                                <option value="3"><c:out value="3" /></option>
                                <option value="4"><c:out value="4" /></option>
                                <option value="5"><c:out value="5" /></option>
                                <option value="6"><c:out value="6" /></option>
                                <option value="7"><c:out value="7" /></option>
                                <option value="8"><c:out value="8" /></option>
                            </select>
                        </div>
                        <div class="col-md-10">

                        </div>
                    </div>

                </div>

                <div class ="col-md-6" style="padding-left:2%">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class ="col-md-1">
                            <select name="unit"class="drop"  style="margin-left:10px;">
                                <option value="1" selected disabled>Nota</option>
                                <option value="2" selected >0</option>
                                <option value="3" selected >1</option>
                                <option value="4" selected >2</option>
                                <option value="5" selected >3</option>
                                <option value="6" selected >4</option>
                                <option value="7" selected >5</option>
                                <option value="8" selected >6</option>
                                <option value="9" selected >7</option>
                                <option value="10" selected >8</option>
                            </select>
                        </div>
                        <div class="col-md-10">

                        </div>
                    </div>

                </div>

            </div>


        </div>

        <br>
        <div class ="container">
            <div class = "row">
                <div class = "col-md-6">

                    <textarea class="form-control" rows="5" id="comment" name = "pasiune" style ="width:96%">${val.pasiune}</textarea>

                </div>
                <div class = "col-md-6">

                    <textarea class="form-control" rows="5" id="comment" style="width: 96%; margin-left: 4%;"></textarea>

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
                    <img src="invatare.png" class="img-circle" alt="Cinque Terre" width="70" height="70" style=" margin-top: 4px;">
                </div>
                <div class = "col-md-11">
                    <div class ="row">
                        <div class ="col-md-12">
                            <div class ="valori">Invatare</div>
                        </div>
                    </div>
                    <div class = "row">
                        <div class ="col-md-12">
                            <h8> Reprezinti un model de standarde ridicate, astfel incat oamenii simt ca au incredere in tine</h8>
                            <a href="#" data-toggle="tooltip" title="Descriere invatare"> <span class="glyphicon glyphicon-info-sign"></span></a>
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
                        <div class ="col-md-1">



                            <select name="nota_invatare"class="drop" style="margin-left:10px;">
                                <option value="${val.nota_invatare}" selected disabled>${val.nota_invatare}</option>
                                <option value="0"><c:out value="0" /></option>
                                <option value="1"><c:out value="1" /></option>
                                <option value="2"><c:out value="2" /></option>
                                <option value="3"><c:out value="3" /></option>
                                <option value="4"><c:out value="4" /></option>
                                <option value="5"><c:out value="5" /></option>
                                <option value="6"><c:out value="6" /></option>
                                <option value="7"><c:out value="7" /></option>
                                <option value="8"><c:out value="8" /></option>
                            </select>
                        </div>
                        <div class="col-md-10">

                        </div>
                    </div>

                </div>

                <div class ="col-md-6" style="padding-left:2%">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class ="col-md-1">
                            <select name="unit"class="drop"  style="margin-left:10px;">
                                <option value="1" selected disabled>Nota</option>
                                <option value="2" selected >0</option>
                                <option value="3" selected >1</option>
                                <option value="4" selected >2</option>
                                <option value="5" selected >3</option>
                                <option value="6" selected >4</option>
                                <option value="7" selected >5</option>
                                <option value="8" selected >6</option>
                                <option value="9" selected >7</option>
                                <option value="10" selected >8</option>
                            </select>
                        </div>
                        <div class="col-md-10">

                        </div>
                    </div>

                </div>

            </div>


        </div>

        <br>
        <div class ="container">
            <div class = "row">
                <div class = "col-md-6">

                    <textarea class="form-control" rows="5" id="comment" name = "invatare" style ="width:96%">${val.invatare}</textarea>

                </div>
                <div class = "col-md-6">

                    <textarea class="form-control" rows="5" id="comment" style="width: 96%; margin-left: 4%;"></textarea>

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
                    <img src="colaborare.png" class="img-circle" alt="Cinque Terre" width="70" height="70" style=" margin-top: 4px;">
                </div>
                <div class = "col-md-11">
                    <div class ="row">
                        <div class ="col-md-12">
                            <div class ="valori">Colaborare</div>
                        </div>
                    </div>
                    <div class = "row">
                        <div class ="col-md-12">
                            <h8> Reprezinti un model de standarde ridicate, astfel incat oamenii simt ca au incredere in tine</h8>
                            <a href="#" data-toggle="tooltip" title="Descriere colaborare"> <span class="glyphicon glyphicon-info-sign"></span></a>
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
                        <div class ="col-md-1">



                            <select name="nota_colaborare"class="drop" style="margin-left:10px;">

                                <option value="${val.nota_colaborare}" selected disabled>${val.nota_colaborare}</option>
                                <option value="0"><c:out value="0" /></option>
                                <option value="1"><c:out value="1" /></option>
                                <option value="2"><c:out value="2" /></option>
                                <option value="3"><c:out value="3" /></option>
                                <option value="4"><c:out value="4" /></option>
                                <option value="5"><c:out value="5" /></option>
                                <option value="6"><c:out value="6" /></option>
                                <option value="7"><c:out value="7" /></option>
                                <option value="8"><c:out value="8" /></option>
                            </select>
                        </div>
                        <div class="col-md-10">

                        </div>
                    </div>

                </div>

                <div class ="col-md-6" style="padding-left:2%">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class ="col-md-1">
                            <select name="unit"class="drop"  style="margin-left:10px;">
                                <option value="1" selected disabled>Nota</option>
                                <option value="2" selected >0</option>
                                <option value="3" selected >1</option>
                                <option value="4" selected >2</option>
                                <option value="5" selected >3</option>
                                <option value="6" selected >4</option>
                                <option value="7" selected >5</option>
                                <option value="8" selected >6</option>
                                <option value="9" selected >7</option>
                                <option value="10" selected >8</option>
                            </select>
                        </div>
                        <div class="col-md-10">

                        </div>
                    </div>

                </div>

            </div>


        </div>

        <br>
        <div class ="container">
            <div class = "row">
                <div class = "col-md-6">

                    <textarea class="form-control" rows="5" id="comment" name = "colaborare" style ="width:96%">${val.colaborare}</textarea>

                </div>
                <div class = "col-md-6">

                    <textarea class="form-control" rows="5" id="comment" style="width: 96%; margin-left: 4%;"></textarea>

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
                    <img src="simplitate.bmp" class="img-circle" alt="Cinque Terre" width="70" height="70" style=" margin-top: 4px;">
                </div>
                <div class = "col-md-11">
                    <div class ="row">
                        <div class ="col-md-12">
                            <div class ="valori">Simplitate</div>
                        </div>
                    </div>
                    <div class = "row">
                        <div class ="col-md-12">
                            <h8> Reprezinti un model de standarde ridicate, astfel incat oamenii simt ca au incredere in tine</h8>
                            <a href="#" data-toggle="tooltip" title="Descriere simplitate"> <span class="glyphicon glyphicon-info-sign"></span></a>
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
                        <div class ="col-md-1">




                            <select class="drop" name = "nota_simplitate" style="margin-left:10px;">
                                <option value="${val.nota_simplitate}" selected disabled>${val.nota_simplitate}</option>
                                <option value="0"><c:out value="0" /></option>
                                <option value="1"><c:out value="1" /></option>
                                <option value="2"><c:out value="2" /></option>
                                <option value="3"><c:out value="3" /></option>
                                <option value="4"><c:out value="4" /></option>
                                <option value="5"><c:out value="5" /></option>
                                <option value="6"><c:out value="6" /></option>
                                <option value="7"><c:out value="7" /></option>
                                <option value="8"><c:out value="8" /></option>
                            </select>
                        </div>
                        <div class="col-md-10">

                        </div>
                    </div>

                </div>

                <div class ="col-md-6" style="padding-left:2%">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class ="col-md-1">
                            <select name="unit"class="drop"  style="margin-left:10px;">
                                <option value="1" selected disabled>Nota</option>
                                <option value="2" selected >0</option>
                                <option value="3" selected >1</option>
                                <option value="4" selected >2</option>
                                <option value="5" selected >3</option>
                                <option value="6" selected >4</option>
                                <option value="7" selected >5</option>
                                <option value="8" selected >6</option>
                                <option value="9" selected >7</option>
                                <option value="10" selected >8</option>
                            </select>
                        </div>
                        <div class="col-md-10">

                        </div>
                    </div>

                </div>

            </div>


        </div>

        <br>
        <div class ="container">
            <div class = "row">
                <div class = "col-md-6">

                    <textarea class="form-control" rows="5" id="comment" style ="width:96%" name = "simplitate" >${val.simplitate}</textarea>

                </div>
                <div class = "col-md-6">

                    <textarea class="form-control" rows="5" id="comment" style="width: 96%; margin-left: 4%;"></textarea>

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
                    <img src="respect.png" class="img-circle" alt="Cinque Terre" width="70" height="70" style=" margin-top: 4px;">
                </div>
                <div class = "col-md-11">
                    <div class ="row">
                        <div class ="col-md-12">
                            <div class ="valori">Respect</div>
                        </div>
                    </div>
                    <div class = "row">
                        <div class ="col-md-12">
                            <h8> Reprezinti un model de standarde ridicate, astfel incat oamenii simt ca au incredere in tine</h8>
                            <a href="#" data-toggle="tooltip" title="Descriere respect"> <span class="glyphicon glyphicon-info-sign"></span></a>
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
                        <div class ="col-md-1">



                            <select name="nota_respect"class="drop" style="margin-left:10px;">
                                <option value="${val.nota_respect}"selected disabled>${val.nota_respect}</option>
                                <option value="0"><c:out value="0" /></option>
                                <option value="1"><c:out value="1" /></option>
                                <option value="2"><c:out value="2" /></option>
                                <option value="3"><c:out value="3" /></option>
                                <option value="4"><c:out value="4" /></option>
                                <option value="5"><c:out value="5" /></option>
                                <option value="6"><c:out value="6" /></option>
                                <option value="7"><c:out value="7" /></option>
                                <option value="8"><c:out value="8" /></option>
                            </select>
                        </div>
                        <div class="col-md-10">

                        </div>
                    </div>

                </div>

                <div class ="col-md-6" style="padding-left:2%">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class ="col-md-1">
                            <select name="unit"class="drop"  style="margin-left:10px;">
                                <option value="1" selected disabled>Nota</option>
                                <option value="2" selected >0</option>
                                <option value="3" selected >1</option>
                                <option value="4" selected >2</option>
                                <option value="5" selected >3</option>
                                <option value="6" selected >4</option>
                                <option value="7" selected >5</option>
                                <option value="8" selected >6</option>
                                <option value="9" selected >7</option>
                                <option value="10" selected >8</option>
                            </select>
                        </div>
                        <div class="col-md-10">

                        </div>
                    </div>

                </div>

            </div>


        </div>

        <br>
        <div class ="container">
            <div class = "row">
                <div class = "col-md-6">

                    <textarea class="form-control" rows="5" id="comment" name = "respect" style ="width:96%">${val.respect}</textarea>

                </div>
                <div class = "col-md-6">

                    <textarea class="form-control" rows="5" id="comment" style="width: 96%; margin-left: 4%;"></textarea>

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
                    <img src="discernamant.png" class="img-circle" alt="Cinque Terre" width="70" height="70" style=" margin-top: 4px;">
                </div>
                <div class = "col-md-11">
                    <div class ="row">
                        <div class ="col-md-12">
                            <div class ="valori">Discernamant</div>
                        </div>
                    </div>
                    <div class = "row">
                        <div class ="col-md-12">
                            <h8> Reprezinti un model de standarde ridicate, astfel incat oamenii simt ca au incredere in tine</h8>
                            <a href="#" data-toggle="tooltip" title="Descriere discernamant"> <span class="glyphicon glyphicon-info-sign"></span></a>
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
                        <div class ="col-md-1">



                            <select name="nota_discernamant"class="drop" style="margin-left:10px;">
                                <option value="${val.nota_discernamant}"  selected disabled>${val.nota_discernamant}</option>
                                <option value="0"><c:out value="0" /></option>
                                <option value="1"><c:out value="1" /></option>
                                <option value="2"><c:out value="2" /></option>
                                <option value="3"><c:out value="3" /></option>
                                <option value="4"><c:out value="4" /></option>
                                <option value="5"><c:out value="5" /></option>
                                <option value="6"><c:out value="6" /></option>
                                <option value="7"><c:out value="7" /></option>
                                <option value="8"><c:out value="8" /></option>
                            </select>
                        </div>
                        <div class="col-md-10">

                        </div>
                    </div>

                </div>

                <div class ="col-md-6" style="padding-left:2%">
                    <div class="row">
                        <div class = "col-md-1">
                            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="40" height="40" style=" margin-top: 4px;">
                        </div>
                        <div class ="col-md-1">
                            <select name="unit"class="drop"  style="margin-left:10px;">
                                <option value="1" selected disabled>Nota</option>
                                <option value="2" selected >0</option>
                                <option value="3" selected >1</option>
                                <option value="4" selected >2</option>
                                <option value="5" selected >3</option>
                                <option value="6" selected >4</option>
                                <option value="7" selected >5</option>
                                <option value="8" selected >6</option>
                                <option value="9" selected >7</option>
                                <option value="10" selected >8</option>
                            </select>
                        </div>
                        <div class="col-md-10">

                        </div>
                    </div>

                </div>

            </div>


        </div>

        <br>
        <div class ="container">
            <div class = "row">
                <div class = "col-md-6">

                    <textarea class="form-control" rows="5" id="comment" style ="width:96%" name = "discernamant">${val.discernamant}</textarea>

                </div>
                <div class = "col-md-6">

                    <textarea class="form-control" rows="5" id="comment" style="width: 96%; margin-left: 4%;"></textarea>

                </div>
            </div>

        </div>

        <h2></h2>
        <h2></h2>

    </c:forEach>
</c:if>

<div class = "container">

    <button type="submit" class="btn search">
        <span class="glyphicon glyphicon-search"></span>
    </button>
</div>

</form>
</body>
</html>