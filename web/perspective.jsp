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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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


    <script>
        function textCounter(field,field2,maxlimit)
        {
            var countfield = document.getElementById(field2);
            if ( field.value.length > maxlimit ) {
                field.value = field.value.substring( 0, maxlimit );
                return false;
            } else {
                countfield.value = maxlimit - field.value.length;
            }
        }
    </script>
<body id="perspective" data-spy="scroll" data-target=".navbar" data-offset="60">

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
            <li class="butonfaq"><a href="/home"> <span class="glyphicon glyphicon-home"></span> Rezultatele mele</a></li>
            <li class="home"><a href="/perspective">Perspective</a></li>
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
                <li class="butonfaq"><a href="/home">  <span class="glyphicon glyphicon-home"></span> Rezultatele mele</a></li>
                <li class="home"><a href="/perspective">Perspective</a></li>
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
<div class = "container">
    <div class = "valori">Perspective</div>

</div>


<form  id="sumForm" method="POST" action="doInsertRezultate">
    <c:if test="${not empty rezultate}">

    <c:forEach items ="${rezultate}" var="r">


<div class="container">

    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#home"  id ="financiar" style="width: 200px;">
            <div class="form-group row">

                <div class="col-md-6 " style = "text-align:center;font-family:raiff_regular;">
                    <label  class ="meniu" >Financiar</label>

                </div>
                <div class="col-md-4 "style = "text-align:center;font-family: raiff_regular;padding-top:3px">

                    ${r.financiar_procent}
                </div>
                <div class="col-md-2 " style = "text-align:center">
                    <label class ="meniu" >%</label>

                </div>

            </div>
        </a></li>
        <li><a data-toggle="tab" href="#menu1"id ="clienti" style="width: 200px;">
            <div class="form-group row">
            <div class="col-md-6 " style = "text-align:center;font-family:raiff_regular;">
                <label class ="meniu">Clienti</label>

            </div>
            <div class="col-md-4 "style = "text-align:center;font-family: raiff_regular;padding-top:3px;">

                ${r.clienti_procent}
            </div>
            <div class="col-md-2 meniu" style = "text-align:center">
                <label class ="meniu" >%</label>

            </div>
            </div>



        </a></li>
        <li><a data-toggle="tab" href="#menu2" id ="procese" style="width: 200px;">
            <div class="form-group row">
            <div class="col-md-6" style = "text-align:center;font-family:raiff_regular;">
                <label  class ="meniu">Procese</label>

            </div>
            <div class="col-md-4 "style = "text-align:center;font-family:raiff_regular;padding-top:3px;">

            ${r.procese_procent}
            </div>
            <div class="col-md-2" style = "text-align:center">
                <label  class ="meniu">%</label>

            </div>
            </div>

        </a></li>
        <li><a data-toggle="tab" href="#menu3" id ="oameni" style="width:200px ;">
            <div class="form-group row">
            <div class="col-md-7 " style = "text-align:center;font-family: raiff_regular;">
                <label  class ="meniu"  >Oameni</label>

            </div>
            <div class="col-md-3 "style = "text-align:right;padding-left: 4%;font-family:raiff_regular;padding-top:3px;">

                ${r.oameni_procent}
            </div>
            <div class="col-md-2 " style = "text-align:center">
                <label  class ="meniu">%</label>

            </div>

            </div>

        </a></li>
        <li><a data-toggle="tab" href="#menu4" id ="invatare" style="width: 330px;">
            <div class="form-group row">
                <div class="col-md-7 " style = "text-align:center;font-family:raiff_regular;">
                    <label  class ="meniu"  >Invatare si dezvoltare</label>

                </div>
                <div class="col-md-3 "style = "text-align:right;padding-left: 4%;font-family:raiff_regular;padding-top:3px;">

                    ${r.invatare_procent}
                </div>
                <div class="col-md-2 " style = "text-align:center">
                    <label  class ="meniu">%</label>

                </div>

            </div>

        </a></li>
    </ul>
    </c:forEach>
    </c:if>
</form>
    <div class="tab-content tab-backgroud">
        <div id="home" class="tab-pane fade in active">
            <div class ="row">

                <div class = "col-md-1">
                    <button type="button" class="detalii" style="margin-left: 10%;margin-bottom: 1%;margin-top: 10%;" id = "diverse-button">Activitati</button>
                </div>



                    <c:forEach items ="${nrfinanciar}" var="fin">
                <div class ="col-md-1">

                    <form method="POST" action="/PerspectiveParametru"style="text-align:center;">
                        <input type="hidden" name="w" value="#home">
                        <input type="hidden" name="ID" value="${fin.ID}">


                        <input type="hidden" name="OBJECTIVE_NAME" value="${fin.OBJECTIVE_NAME}">
                    <button type="submit" class="detalii" style="margin-left: 2%;margin-bottom: 1%;margin-top: 8px;" id ="OBJECTIVE_NAME">${fin.OBJECTIVE_NAME}</button>
                    </form>
                </div>
                    </c:forEach>

                <div class ="col-md-2" style = "text-align:right">

                    <button type="button" class="btn btn-default btn-sm" style = "margin-right:1%;margin-top:8px;" data-toggle="modal" data-target="#myModal">    <span class="glyphicon glyphicon-plus"></span> Adauga</button>

                </div>
                <c:set var="obf" value="${nr}"/>
                <c:if test="${obf > 1}">
                    <c:set var="obfin" value="${objective_name}"/>
                    <c:if test="${not empty obfin}">
                              <div class ="col-md-1" style = "text-align:right">
                                         <button type="button" class="btn btn-default btn-sm" style = "margin-right:5%;margin-top:10%" data-toggle="modal" data-target="#modalStergeFinanciar">   <span class="glyphicon glyphicon-trash"></span>Sterge </button>

                             </div>

                      </c:if>
                </c:if>
            </div>

            <div id="modalStergeFinanciar" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content" style="margin-top:30%">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Obiectiv Financiar ${objective_name}</h4>
                        </div>
                        <div class="modal-body">
                            <div id = "alerta3"  style="display: none;" class="alert alert-warning alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>Ai sters un obiectiv!</strong> Pentru a vizualiza detaliile obiectivelor ramase, te rog sa selectezi un obiectiv din lista de mai sus.
                            </div>
                            <p>Esti sigur ca vrei sa stergi obiectivul ${objective_name} ? </p>
                            <form method="POST" action="/doDeleteFinanciar">
                                <input type="hidden" name="w" value="#home">
                                <input type="hidden" name="objective_name" value="${objective_name}">
                                <input type="hidden" name="ID" value="${ID}">
                                <input type="hidden" name="marca" value="${marca}">
                                <button type="submit"  class="btn btn-default btn-sm" id ="stergefinanciar" style = "margin-right:5%;margin-top:10%">
                                    <span class="glyphicon glyphicon-trash"></span>Da </button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Inchide</button>
                        </div>
                    </div>

                </div>
            </div>





            <div class ="mare2">

            </div>



        </div>
        <div id="menu1" class="tab-pane fade">
            <div class ="row">
                <div class ="col-md-1">
                    <button type="button" class="detalii" style="margin-left: 10%;margin-bottom: 1%;margin-top: 10%;" id = "diverse-button2">Activitati</button>



                </div>



                    <c:forEach items ="${nrclienti}" var="cln">
                <div class ="col-md-1">

                        <form method="POST" action="/PerspectiveParametru" style="text-align:  center;">
                            <input type="hidden" name="OBJECTIVE_NAME_CLIENTI" value="${cln.OBJECTIVE_NAME}">
                            <input type="hidden" name="w" value="#menu1">
                            <input type="hidden" name="IDC" value="${cln.ID}">
                            <c:set var="var2" value="#menu1"/>

                            <button type="submit" class="detalii" style="margin-left: 2%;margin-bottom: 1%;margin-top: 8px;" id ="OBJECTIVE_NAME_CLIENTI">${cln.OBJECTIVE_NAME}</button>
                        </form>
                </div>
                    </c:forEach>



                <div class ="col-md-2" style = "text-align:right">

                    <button type="button" class="btn btn-default btn-sm" style = "margin-right:1%;margin-top:8px;" data-toggle="modal" data-target="#myModal2">    <span class="glyphicon glyphicon-plus"></span> Adauga</button>

                </div>
                <c:set var="obc" value="${nrc}"/>
                <c:if test="${obc > 1}">
                <div class ="col-md-1" style = "text-align:right">
                    <button type="button" class="btn btn-default btn-sm" style = "margin-right:5%;margin-top:10%" data-toggle="modal" data-target="#modalStergeClienti">   <span class="glyphicon glyphicon-trash"></span>Sterge </button>

                </div>
                </c:if>

            </div>
            <div class ="mare2">

            </div>
            <div id="modalStergeClienti" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content" style="margin-top:30%">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Obiectiv Clienti ${objective_name_clienti}</h4>
                        </div>
                        <div class="modal-body">
                            <div id = "stergeclienti2" style="display: none;" class="alert alert-warning alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>Ai sters un obiectiv!</strong> Pentru a vizualiza detaliile obiectivelor ramase, te rog sa selectezi un obiectiv din lista de mai sus.
                            </div>
                            <p>Esti sigur ca vrei sa stergi obiectivul ${objective_name_clienti} ? </p>
                            <form method="POST" action="/doDeleteClienti">
                                <input type="hidden" name="w" value="#menu1">
                                <input type="hidden" name="IDC" value="${IDC}">
                                <input type="hidden" name="objective_name_clienti" value="${objective_name_clienti}">
                                <input type="hidden" name="marca" value="${marca}">
                                <button type="submit"  class="btn btn-default btn-sm" id = "stergeclienti" style = "margin-right:5%;margin-top:10%">
                                    <span class="glyphicon glyphicon-trash"></span>Sterge </button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Inchide</button>
                        </div>
                    </div>

                </div>
            </div>



        </div>
        <div id="menu2" class="tab-pane fade">
            <div class ="row">
                <div class ="col-md-1">
                    <button type="button" class="detalii" style="margin-left: 10%;margin-bottom: 1%;margin-top: 10%;" id = "diverse-button3">Activitati</button>



                </div>



                    <c:forEach items ="${nrprocese}" var="pr">
                <div class ="col-md-1">
                        <form method="POST" action="/PerspectiveParametru"  style="text-align:  center;">

                            <input type="hidden" name="w" value="#menu2">

                            <input type="hidden" name="IDP" value="${pr.ID}">
                            <input type="hidden" name="OBJECTIVE_NAME_PROCESE" value="${pr.OBJECTIVE_NAME}">
                            <button type="submit" class="detalii" style="margin-left: 2%;margin-bottom: 1%;margin-top: 8px;" id ="OBJECTIVE_NAME_PROCESE">${pr.OBJECTIVE_NAME}</button>


                        </form>
                </div>
                    </c:forEach>



                <div class ="col-md-2" style = "text-align:right">

                    <button type="button" class="btn btn-default btn-sm" style = "margin-right:1%;margin-top:8px;" data-toggle="modal" data-target="#myModal3">    <span class="glyphicon glyphicon-plus"></span> Adauga</button>

                </div>
                <c:set var="obp" value="${nrp}"/>
                <c:if test="${obp > 1}">
                <div class ="col-md-1" style = "text-align:right">
                    <button type="button" class="btn btn-default btn-sm" style = "margin-right:5%;margin-top:10%" data-toggle="modal" data-target="#modalStergeProcese">   <span class="glyphicon glyphicon-trash"></span>Sterge </button>

                </div>
                </c:if>

            </div>
            <div class ="mare2">

            </div>
            <div id="modalStergeProcese" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content" style="margin-top:30%">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Obiectiv Procese ${objective_name_procese}</h4>
                        </div>
                        <div class="modal-body">
                            <div id = "stergeprocese2" style="display: none;" class="alert alert-warning alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>Ai sters un obiectiv!</strong> Pentru a vizualiza detaliile obiectivelor ramase, te rog sa selectezi un obiectiv din lista de mai sus.
                            </div>
                            <p>Esti sigur ca vrei sa stergi obiectivul ${objective_name_procese} ? </p>
                            <form method="POST" action="/doDeleteProcese">
                                <input type="hidden" name="w" value="#menu2">
                                <input type="hidden" name="objective_name_procese" value="${objective_name_procese}">
                                <input type="hidden" name="marca" value="${marca}">
                                <input type="hidden" name="IDP" value="${IDP}">
                                <button type="submit"  class="btn btn-default btn-sm" id = "stergeprocese" style = "margin-right:5%;margin-top:10%">
                                    <span class="glyphicon glyphicon-trash"></span>Sterge </button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Inchide</button>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <div id="menu3" class="tab-pane fade">
            <div class ="row">
                <div class ="col-md-1">
                    <button type="button" class="detalii" style="margin-left: 10%;margin-bottom: 1%;margin-top: 10%;" id = "diverse-button4">Activitati</button>



                </div>



                    <c:forEach items ="${nroameni}" var="o">
                <div class ="col-md-1">

                        <form method="POST" action="/PerspectiveParametru" style="text-align:  center;">
                            <input type="hidden" name="IDO" value="${o.ID}">
                            <input type="hidden" name="w" value="#menu3">

                            <input type="hidden" name="OBJECTIVE_NAME_OAMENI" value="${o.OBJECTIVE_NAME}">
                            <button type="submit" class="detalii" style="margin-left: 2%;margin-bottom: 1%;margin-top: 8px;" id ="OBJECTIVE_NAME_OAMENI">${o.OBJECTIVE_NAME}</button>
                        </form>
                </div>
                    </c:forEach>



                <div class ="col-md-2" style = "text-align:right">

                    <button type="button" class="btn btn-default btn-sm" style = "margin-right:1%;margin-top:8px;" data-toggle="modal" data-target="#myModal5">    <span class="glyphicon glyphicon-plus"></span> Adauga</button>

                </div>
                <c:set var="obo" value="${nro}"/>
                <c:if test="${obo > 1}">
                <div class ="col-md-1" style = "text-align:right">
                    <button type="button" class="btn btn-default btn-sm" style = "margin-right:5%;margin-top:10%" data-toggle="modal" data-target="#modalStergeOameni">   <span class="glyphicon glyphicon-trash"></span>Sterge </button>

                </div>
                </c:if>
            </div>
            <div class ="mare2">

            </div>
            <div id="modalStergeOameni" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content" style="margin-top:30%">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Obiectiv Oameni ${objective_name_oameni}</h4>
                        </div>
                        <div class="modal-body">
                            <div id = "stergeoameni2"   style="display: none;" class="alert alert-warning alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>Ai sters un obiectiv!</strong> Pentru a vizualiza detaliile obiectivelor ramase, te rog sa selectezi un obiectiv din lista de mai sus.
                            </div>
                            <p>Esti sigur ca vrei sa stergi obiectivul ${objective_name_oameni} ? </p>
                            <form method="POST" action="/doDeleteOameni">
                                <input type="hidden" name="w" value="#menu3">
                                <input type="hidden" name="objective_name_oameni" value="${objective_name_oameni}">
                                <input type="hidden" name="marca" value="${marca}">
                                <input type="hidden" name="IDO" value="${IDO}">
                                <button type="submit"  class="btn btn-default btn-sm" id = "stergeoameni" style = "margin-right:5%;margin-top:10%">
                                    <span class="glyphicon glyphicon-trash"></span>Sterge </button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Inchide</button>
                        </div>
                    </div>

                </div>
            </div>


        </div>
        <div id="menu4" class="tab-pane fade">
            <div class ="row">
                <div class ="col-md-1">
                    <button type="button" class="detalii" style="margin-left: 10%;margin-bottom: 1%;margin-top: 10%;" id = "diverse-button5">Activitati</button>



                </div>



                <c:forEach items ="${nrinvatare}" var="o">
                    <div class ="col-md-1">

                        <form method="POST" action="/PerspectiveParametru" style="text-align:  center;">

                            <input type="hidden" name="w" value="#menu4">
                            <input type="hidden" name="IDI" value="${o.ID}">
                            <input type="hidden" name="OBJECTIVE_NAME_INVATARE" value="${o.OBJECTIVE_NAME}">
                            <button type="submit" class="detalii" style="margin-left: 2%;margin-bottom: 1%;margin-top: 8px;" id ="OBJECTIVE_NAME_INVATARE">${o.OBJECTIVE_NAME}</button>
                        </form>
                    </div>
                </c:forEach>



                <div class ="col-md-2" style = "text-align:right">

                    <button type="button" class="btn btn-default btn-sm" style = "margin-right:1%;margin-top:8px;" data-toggle="modal" data-target="#myModal4">    <span class="glyphicon glyphicon-plus"></span> Adauga</button>

                </div>
                <c:set var="obi" value="${nri}"/>
                <c:if test="${obi > 1}">
                    <div class ="col-md-1" style = "text-align:right">
                        <button type="button" class="btn btn-default btn-sm" style = "margin-right:5%;margin-top:10%" data-toggle="modal" data-target="#modalStergeInvatare">   <span class="glyphicon glyphicon-trash"></span>Sterge </button>

                    </div>
                </c:if>
            </div>
            <div class ="mare2">

            </div>

            <div id="modalStergeInvatare" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content" style="margin-top:30%">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Obiectiv Invatare ${objective_name_invatare}</h4>
                        </div>
                        <div class="modal-body">

                            <p>Esti sigur ca vrei sa stergi obiectivul ${objective_name_invatare} ? </p>
                            <form method="POST" action="/doDeleteInvatare">
                                <input type="hidden" name="w" value="#menu4">
                                <input type="hidden" name="objective_name_invatare" value="${objective_name_invatare}">
                                <input type="hidden" name="marca" value="${marca}">
                                <input type="hidden" name="IDI" value="${IDI}">
                                <button type="submit"  class="btn btn-default btn-sm" id = "stergeinvatare" style = "margin-right:5%;margin-top:10%">
                                    <span class="glyphicon glyphicon-trash"></span>Sterge </button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Inchide</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<h2>  </h2>



<div class = "container" >

</div>

<div class = "container" >

</div>

<div class = "container" >

</div>

<div class = "container">

</div>

<div id="alertaupdate" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content" style="margin-top:30%">

            <div class="modal-body">

                <div class="alert alert-success alert-dismissible">
                    <strong>Felicitari!</strong> Editarea obiectivului s-a efectuat cu succes.
                </div>

            </div>
        </div>

    </div>
</div>



<div id ="obiective">

    <div class = "container">
        <div class = "valori">
            <c:set var="ob" value="${obiectivnume}"/>
            <c:if test="${not empty ob}">
            Detalii ${obiectivnume}
            </c:if>

            <c:set var="var1" value="${w}"/>

        </div>

    </div>




    <c:if test="${var1 == '#home'}">



 <form method="post" action="/doUpdateFinanciar">
<div class="container">

    <input type="hidden" name="w" value="#home">
    <input type="hidden" name="marca" value="${marca}">
    <c:forEach items ="${obiectivefinanciar}" var="fin">
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
                                <input type="hidden" name ="${fin.ID}" value ="${fin.ID}">
                                <h8 for="p1">Valoare obiectiv</h8>
                                <input class="form-control casuta" id="preconizatq1"  name = "OBJECTIVE_TARGET${fin.ID}" type="number" value = "${fin.OBJECTIVE_TARGET}">
                            </div>
                        </div>
                        <div class ="col-xs-6">
                            <div class="form-group">
                                <h8 for="r1">Realizat</h8>
                                <input class="form-control casuta" id="realizatq1" name = "RESULT_VALUE${fin.ID}" type="number" value="${fin.RESULT_VALUE}">
                            </div>
                        </div>
                    </div>

                    <div class = "row">
                        <div class = "col-xs-6">
                            <h8>Procent realizare:</h8>
                        </div>
                        <div class = "col-xs-4">
                            <input class="form-control casuta" id = "procentq1"  name = "procentq1${fin.ID}" type="number" value="${fin.SATISFACTION_RATE}">
                        </div>
                        <div class = "col-xs-2">
                        <label  class ="meniu">%</label>
                        </div>
                    </div>



                </div>

                <div class hidden = "col-md-3">
                    <div class="form-group">
                        <h8 for="comment">Nume obiectiv:</h8>
                        <textarea class="form-control" rows="4" id="obname" value = "OBJECTIVE_NAME"  name = "OBJECTIVE_NAME" style="height: 83px;">${fin.OBJECTIVE_NAME}</textarea>
                    </div>
                </div>

                <div class = "col-md-8">
                    <div class="form-group">
                        <h8 for="comment">Detalii obiectiv:</h8>
                        <textarea class="form-control" rows="4" id="obdesc" value = "OBJECTIVE_DESCRIPTION"  name = "OBJECTIVE_DESCRIPTION${fin.ID}" style="height: 83px;">${fin.OBJECTIVE_DESCRIPTION}</textarea>
                    </div>
                </div>


            </div>

        </div>
    </div>
    </c:forEach>


</div>
<h2>  </h2>



     <div class = "container">

         <div class = "row">
             <div class = "col-md-10">

             </div>
             <div class = "col-md-2">


                 <button type="submit" class="detalii" data-toggle="modal" data-target="#alertaupdate"style="width: 100px;height: 60px;margin-bottom: 10px;">
                     <i class="material-icons">cloud_done</i> Salveaza
                 </button>

             </div>
         </div>
     </div>


 </form>

    </c:if>
    <c:if test="${var1 == '#menu1'}">



        <form method="post" action="/doUpdateClienti">
            <div class="container">


                <input type="hidden" name="w" value="#menu1">
                <input type="hidden" name="marca" value="${marca}">

                <c:forEach items ="${obiectiveclienti}" var="cln">
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
                                                <input type="hidden" name ="${cln.ID}" value ="${cln.ID}">
                                                <h8 for="p1">Valoare obiectiv</h8>
                                                <input class="form-control casuta" id="preconizatq1clienti"  name = "OBJECTIVE_TARGET_CLIENTI${cln.ID}" type="number" value = "${cln.OBJECTIVE_TARGET}">
                                            </div>
                                        </div>
                                        <div class ="col-xs-6">
                                            <div class="form-group">
                                                <h8 for="r1">Realizat</h8>
                                                <input class="form-control casuta" id="realizatq1clienti" name = "RESULT_VALUE_CLIENTI${cln.ID}" type="number" value="${cln.RESULT_VALUE}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class = "row">
                                        <div class = "col-xs-6">
                                            <h8>Procent realizare:</h8>
                                        </div>
                                        <div class = "col-xs-4">
                                            <input class="form-control casuta" id = "procentq1clienti"  name = "procentq1clienti${cln.ID}" type="number" value="${cln.SATISFACTION_RATE}">
                                        </div>
                                        <div class = "col-xs-2">
                                            <label  class ="meniu">%</label>
                                        </div>
                                    </div>

                                </div>

                                <div class hidden = "col-md-3">
                                    <div class="form-group">
                                        <h8 for="comment">Nume obiectiv:</h8>
                                        <textarea hidden class="form-control" rows="4" id="obclienti" value = "OBJECTIVE_NAME_CLIENTI"  name = "OBJECTIVE_NAME_CLIENTI" style="height: 83px;">${cln.OBJECTIVE_NAME}</textarea>
                                    </div>
                                </div>

                                <div class = "col-md-8">
                                    <div class="form-group">
                                        <h8 for="comment">Detalii obiectiv:</h8>
                                        <textarea class="form-control" rows="4" id="obdesc2" value = "OBJECTIVE_DESCRIPTION_CLIENTI"  name = "OBJECTIVE_DESCRIPTION_CLIENTI${cln.ID}" style="height: 83px;">${cln.OBJECTIVE_DESCRIPTION}</textarea>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>
                    <h2>  </h2>
                </c:forEach>


            </div>
            <h2>  </h2>

            <div class = "container">

                <div class = "row">
                    <div class = "col-md-10">

                    </div>
                    <div class = "col-md-2">


                        <button type="submit" class="detalii" data-toggle="modal" data-target="#alertaupdate" style="width: 100px;height: 60px;margin-bottom: 10px;">
                            <i class="material-icons">cloud_done</i> Salveaza
                        </button>

                    </div>
                </div>
            </div>


        </form>

    </c:if>
    <c:if test="${var1 == '#menu2'}">



        <form method="post" action="/doUpdateProcese">
            <div class="container">


                <input type="hidden" name="w" value="#menu2">
                <input type="hidden" name="marca" value="${marca}">

                <c:forEach items ="${obiectiveprocese}" var="p">
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
                                                <input type="hidden" name ="${p.ID}" value ="${p.ID}">
                                                <h8 for="p1">Valoare obiectiv</h8>
                                                <input class="form-control casuta" id="preconizatq1procese"  name = "OBJECTIVE_TARGET_PROCESE${p.ID}" type="number" value = "${p.OBJECTIVE_TARGET}">
                                            </div>
                                        </div>
                                        <div class ="col-xs-6">
                                            <div class="form-group">
                                                <h8 for="r1">Realizat</h8>
                                                <input class="form-control casuta" id="realizatq1procese" name = "RESULT_VALUE_PROCESE${p.ID}" type="number" value="${p.RESULT_VALUE}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class = "row">
                                        <div class = "col-xs-6">
                                            <h8>Procent realizare:</h8>
                                        </div>
                                        <div class = "col-xs-4">
                                            <input class="form-control casuta" id = "procentq1procese"  name = "procentq1procese${p.ID}"  type="number" value="${p.SATISFACTION_RATE}">
                                        </div>
                                        <div class = "col-xs-2">
                                            <label  class ="meniu">%</label>
                                        </div>
                                    </div>



                                </div>

                                <div class hidden = "col-md-1">
                                    <div class="form-group">
                                        <h8 for="comment">Nume obiectiv:</h8>
                                        <textarea hidden class="form-control" rows="4" id="obname3" value = "OBJECTIVE_NAME_PROCESE"  name = "OBJECTIVE_NAME_PROCESE" style="height: 83px;">${p.OBJECTIVE_NAME}</textarea>
                                    </div>
                                </div>

                                <div class = "col-md-8">
                                    <div class="form-group">
                                        <h8 for="comment">Detalii obiectiv:</h8>
                                        <textarea class="form-control" rows="4" id="obdesc3" value = "OBJECTIVE_DESCRIPTION_PROCESE"  name = "OBJECTIVE_DESCRIPTION_PROCESE${p.ID}" style="height: 83px;">${p.OBJECTIVE_DESCRIPTION}</textarea>
                                    </div>
                                </div>


                            </div>

                        </div>


                    </div>
                </c:forEach>


            </div>

            <h2>  </h2>

            <div class = "container">

                <div class = "row">
                    <div class = "col-md-10">

                    </div>
                    <div class = "col-md-2">


                        <button type="submit" class="detalii"  data-toggle="modal" data-target="#alertaupdate" style="width: 100px;height: 60px;margin-bottom: 10px;">
                            <i class="material-icons">cloud_done</i> Salveaza
                        </button>

                    </div>
                </div>
            </div>


        </form>

    </c:if>
    <c:if test="${var1 == '#menu3'}">



        <form method="post" action="/doUpdateOameni">
            <div class="container">


                <input type="hidden" name="w" value="#menu3">
                <input type="hidden" name="marca" value="${marca}">

                <c:forEach items ="${obiectiveoameni}" var="o">
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
                                                <input type="hidden" name ="${o.ID}" value ="${o.ID}">
                                                <h8 for="p1">Valoare obiectiv</h8>
                                                <input class="form-control casuta" id="preconizatq1oameni"  name = "OBJECTIVE_TARGET_OAMENI${o.ID}" type="number" value = "${o.OBJECTIVE_TARGET}">
                                            </div>
                                        </div>
                                        <div class ="col-xs-6">
                                            <div class="form-group">
                                                <h8 for="r1">Realizat</h8>
                                                <input class="form-control casuta" id="realizatq1oameni" name = "RESULT_VALUE_OAMENI${o.ID}" type="number" value="${o.RESULT_VALUE}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class = "row">
                                        <div class = "col-xs-6">
                                            <h8>Procent realizare:</h8>
                                        </div>
                                        <div class = "col-xs-4">
                                            <input class="form-control casuta" id = "procentq1oameni"  name = "procentq1oameni${o.ID}" type="number" value="${o.SATISFACTION_RATE}">
                                        </div>
                                        <div class = "col-xs-2">
                                            <label  class ="meniu">%</label>
                                        </div>
                                    </div>



                                </div>

                                <div class hidden = "col-md-3">
                                    <div class="form-group">
                                        <h8 for="comment">Nume obiectiv:</h8>
                                        <textarea hidden class="form-control" rows="4" id="obname4" value = "OBJECTIVE_NAME_OAMENI"  name = "OBJECTIVE_NAME_OAMENI" style="height: 83px;">${o.OBJECTIVE_NAME}</textarea>
                                    </div>
                                </div>

                                <div class = "col-md-5">
                                    <div class="form-group">
                                        <h8 for="comment">Detalii obiectiv:</h8>
                                        <textarea class="form-control" rows="4" id="obdesc4" value = "OBJECTIVE_DESCRIPTION_OAMENI"  name = "OBJECTIVE_DESCRIPTION_OAMENI${o.ID}" style="height: 83px;">${o.OBJECTIVE_DESCRIPTION}</textarea>

                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>
                </c:forEach>


            </div>

            <h2>  </h2>

            <div class = "container">

                <div class = "row">
                    <div class = "col-md-10">

                    </div>
                    <div class = "col-md-2">


                            <button type="submit" class="detalii" data-toggle="modal" data-target="#alertaupdate" style="width: 100px;height: 60px;margin-bottom: 10px;">
                                <i class="material-icons">cloud_done</i> Salveaza
                            </button>

                    </div>
                </div>
            </div>


        </form>

    </c:if>
    <c:if test="${var1 == '#menu4'}">



        <form method="post" action="/doUpdateInvatare">
            <div class="container">


                <input type="hidden" name="w" value="#menu4">
                <input type="hidden" name="marca" value="${marca}">

                <c:forEach items ="${obiectiveinvatare}" var="o">
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
                                                <input type="hidden" name ="${o.ID}" value ="${o.ID}">
                                                <h8 for="p1">Valoare obiectiv</h8>
                                                <input class="form-control casuta" id="preconizatq1invatare"  name = "OBJECTIVE_TARGET_INVATARE${o.ID}" type="number" value = "${o.OBJECTIVE_TARGET}">
                                            </div>
                                        </div>
                                        <div class ="col-xs-6">
                                            <div class="form-group">
                                                <h8 for="r1">Realizat</h8>
                                                <input class="form-control casuta" id="realizatq1invatare" name = "RESULT_VALUE_INVATARE${o.ID}" type="number" value="${o.RESULT_VALUE}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class = "row">
                                        <div class = "col-xs-6">
                                            <h8>Procent realizare:</h8>
                                        </div>
                                        <div class = "col-xs-4">
                                            <input class="form-control casuta" id = "procentq1invatare"  name = "procentq1invatare${o.ID}"  type="number" value="${o.SATISFACTION_RATE}">
                                        </div>
                                        <div class = "col-xs-2">
                                            <label  class ="meniu">%</label>
                                        </div>
                                    </div>



                                </div>

                                <div class hidden = "col-md-3">
                                    <div class="form-group">
                                        <h8 for="comment">Nume obiectiv:</h8>
                                        <textarea class="form-control" rows="4" id="obname5" value = "OBJECTIVE_NAME_INVATARE"  name = "OBJECTIVE_NAME_INVATARE" style="height: 83px;">${o.OBJECTIVE_NAME}</textarea>
                                    </div>
                                </div>

                                <div class = "col-md-8">
                                    <div class="form-group">
                                        <h8 for="comment">Detalii obiectiv:</h8>
                                        <textarea class="form-control" rows="4" id="obdesc5" value = "OBJECTIVE_DESCRIPTION_INVATARE"  name = "OBJECTIVE_DESCRIPTION_INVATARE${o.ID}" style="height: 83px;">${o.OBJECTIVE_DESCRIPTION}</textarea>

                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>
                </c:forEach>


            </div>

            <h2>  </h2>

            <div class = "container">

                <div class = "row">
                    <div class = "col-md-10">

                    </div>
                    <div class = "col-md-2">


                        <button type="submit" class="detalii" data-toggle="modal" data-target="#alertaupdate" style="width: 100px;height: 60px;margin-bottom: 10px;">
                            <i class="material-icons">cloud_done</i> Salveaza
                        </button>

                    </div>
                </div>
            </div>


        </form>

    </c:if>
</div>

<c:set var="ob" value="${obiectivnume}"/>
<c:choose>
<c:when test="${not empty ob}">
   <div id = "diverse" style="display: none">

       </c:when>
       <c:otherwise>
    <div id = "diverse">
       </c:otherwise>
        </c:choose>
    <form method="POST" action="doInsertCompetente">
        <input type="hidden" name="parametrufinanciar" id = "parametrufinanciar" value="#home">
        <c:if test="${not empty competente}">

        <c:forEach items ="${competente}" var="c">
    <input type="hidden" name="diversepilon" value="Financiar">
    <div class = "container">
        <div class = "valori">
           Activitati pentru indeplinirea obiectivelor

        </div>

    </div>
    <div class="container">



        <div class="mare">



            <div class="qanda">


                    <div class = "row">
                        <div class = "col-md-2">

                            <h1>Abilitati</h1>

                        </div>

                        <div class="col-md-10">
                        </div>
                    </div>

                    <div class = "row">
                        <div class ="col-md-12">

                            <textarea  onkeyup="textCounter(this,'counter',200);" id="message" class="form-control" rows="5" name = "abilitati" data-toggle="tooltip" data-placement="top" title="Enumerati punctele forte pe care le aveti, abilitati existente, cunostinte, experiente etc. pe care puteti construi in atingerea obiectivelor.
Este important sa inventariem si sa constientizam care sunt punctele noastre tari pentru ca in acest fel din resursele existente/disponibile, creierul le va activa pe acelea care vor asigura focusul, energia, cunostintele si siguranta necesara atingerii obiectivelor">${c.abilitati}</textarea>
                        </div>


                    </div>


                <div class = "row">
                    <div class ="col-md-10">

                    </div>
                    <div class ="col-md-2">
                        <input disabled  maxlength="3" size="3" value="200" id="counter" style="margin-top: 12%;margin-left: 80%;">
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

                        <h1>Subactivitati</h1>

                    </div>

                    <div class="col-md-10">
                    </div>
                </div>

                <div class = "row">
                    <div class ="col-md-12">
                        <textarea  onkeyup="textCounter(this,'counter2',200);" id="message2" class="form-control" rows="5" name = "subactivitati" data-toggle="tooltip" data-placement="top" title="Pornind de la punctele forte, cunostintele, abilitatile si competentele formulate la primul pas, stabiliti sub-activitati si actiuni mai simple, comportamente concrete, precum si moduri in care veti asigura eficienta
-care determina in final realizarea obiectivului cheie;
- a caror realizare depinde in mare masura sau in totalitate de voi;
- pot fi activitati si actiuni de dezvoltare/invatare care sustin atingerea obiectivelor cheie">${c.subactivitati}</textarea>
                    </div>
                </div>

                <div class = "row">
                    <div class ="col-md-10">

                    </div>
                    <div class ="col-md-2">
                        <input disabled  maxlength="3" size="3" value="200" id="counter2" style="margin-top: 12%;margin-left: 80%;">
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


                           <h1>Perspectiva N+1</h1>




                    </div>

                    <div class="col-md-10">
                    </div>
                </div>

                <div class = "row">
                    <div class = "col-md-5">
                        <div class="form-group">
                            <h8 for="comment">Voi continua</h8>
                            <c:choose>
                            <c:when test="${not empty emailechipa}">
                            <textarea  onkeyup="textCounter(this,'counter3',200);" id="message3" class="form-control" rows="5" name = "voi_continua" data-toggle="tooltip" data-placement="top" title="Treceti aici TOATE acele exemple comportamentale concrete, care merita sa fie continuate sau pastrate pentru ca au un impact semnificativ in atingerea cu succes a obiectivului cheie (fie din punctul de vedere al angajatului, fie al n+1).
E important sa le identificam, pentru a ajuta angajatul in constientizarea actiunilor care merita sa fie continuate. In acelasi timp, este instructiva discutia, pentru ambele persoane, asupra ce se considera a fi un comportament de succes - vazut din cele doua perspective (angajat-superior)">${c.voi_continua}</textarea>
                            </c:when>
                                <c:otherwise>
                                    <textarea  onkeyup="textCounter(this,'counter3',200);" id="message3" class="form-control" rows="5" name = "voi_continua" data-toggle="tooltip" data-placement="top" title="Treceti aici TOATE acele exemple comportamentale concrete, care merita sa fie continuate sau pastrate pentru ca au un impact semnificativ in atingerea cu succes a obiectivului cheie (fie din punctul de vedere al angajatului, fie al n+1).
E important sa le identificam, pentru a ajuta angajatul in constientizarea actiunilor care merita sa fie continuate. In acelasi timp, este instructiva discutia, pentru ambele persoane, asupra ce se considera a fi un comportament de succes - vazut din cele doua perspective (angajat-superior)" disabled>${c.voi_continua}</textarea>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class = "col-md-2"></div>
                    <div class = "col-md-5">
                        <div class="form-group">
                            <h8 for="comment" style = "margin-left: 4%">Voi avea in considerare</h8>
                            <c:choose>
                                <c:when test="${not empty emailechipa}">
                                    <textarea  onkeyup="textCounter(this,'counter4',200);" id="message4" class="form-control" rows="5" name = "voi_lua_in_considerare" data-toggle="tooltip" data-placement="top" title="Treceti aici exemple concrete comportamentale, care merita a fi incepute, incetate sau schimbate in vederea atingerii obiectivelor cheie.
Acestea merita a fi punctate pentu ca angajatul sa poata constientiza, care sunt acele activitati pe care merita sa le inceapa sa faca, sa inceteze sa faca sau sa le faca altfel. In acelasi timp, este instructiv pentru ambele persoane discutia asupra ce se considera necesar de schimbat pentru atingerea comportamentului de succes - vazut din cele doua perspective (angajat/superior)">${c.voi_lua_in_considerare}</textarea>
                                </c:when>
                                <c:otherwise>
                                    <textarea  onkeyup="textCounter(this,'counter4',200);" id="message4" class="form-control" rows="5" name = "voi_lua_in_considerare" data-toggle="tooltip" data-placement="top" title="Treceti aici exemple concrete comportamentale, care merita a fi incepute, incetate sau schimbate in vederea atingerii obiectivelor cheie.
Acestea merita a fi punctate pentu ca angajatul sa poata constientiza, care sunt acele activitati pe care merita sa le inceapa sa faca, sa inceteze sa faca sau sa le faca altfel. In acelasi timp, este instructiv pentru ambele persoane discutia asupra ce se considera necesar de schimbat pentru atingerea comportamentului de succes - vazut din cele doua perspective (angajat/superior)" disabled>${c.voi_lua_in_considerare}</textarea>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
                </div>

                <div class = "row">
                    <div class = "col-md-5">
                        <div class = "row">
                            <div class ="col-md-10">

                            </div>
                            <div class ="col-md-2">
                                <input disabled  maxlength="3" size="3" value="200" id="counter3" style="margin-top: 12%;margin-left: 53%;">
                            </div>
                        </div>

                    </div>
                    <div class = "col-md-2"></div>
                    <div class = "col-md-5">
                        <div class = "row">
                            <div class ="col-md-10">

                            </div>
                            <div class ="col-md-2">
                                <input disabled  maxlength="3" size="3" value="200" id="counter4" style="margin-top: 12%;margin-left: 53%;">
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


        </c:forEach>
        </c:if>
        <hr>
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


</div>



<div id = "diverseclienti"  style="display: none;">

                <form method="POST" action="doInsertCompetente">
                    <input type="hidden" name="parametruclienti" id = "parametruclienti" value="#menu1">
                    <c:if test="${not empty competentec}">

                    <c:forEach items ="${competentec}" var="c">
                    <input type="hidden" name="diversepilon" value="Clienti">
                <div class = "container">
                    <div class = "valori">
                        Activitati pentru indeplinirea obiectivelor

                    </div>

                </div>
                <div class="container">



                    <div class="mare">



                        <div class="qanda">


                            <div class = "row">
                                <div class = "col-md-2">

                            <h1>Abilitati</h1>

                                </div>

                                <div class="col-md-10">
                                </div>
                            </div>

                            <div class = "row">
                                <div class ="col-md-12">
                                    <textarea  onkeyup="textCounter(this,'counter5',200);" class="form-control" rows="5" id="message5" class="form-control" rows="5" name = "abilitati2" data-toggle="tooltip" data-placement="top" title="Enumerati punctele forte pe care le aveti, abilitati existente, cunostinte, experiente etc. pe care puteti construi in atingerea obiectivelor.
Este important sa inventariem si sa constientizam care sunt punctele noastre tari pentru ca in acest fel din resursele existente/disponibile, creierul le va activa pe acelea care vor asigura focusul, energia, cunostintele si siguranta necesara atingerii obiectivelor">${c.abilitati}</textarea>

                                </div>
                            </div>

                            <div class = "row">
                                <div class ="col-md-10">

                                </div>
                                <div class ="col-md-2">
                                    <input disabled  maxlength="3" size="3" value="200" id="counter5" style="margin-top: 12%;margin-left: 80%;">
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

                                 <h1>Subactivitati</h1>

                                </div>

                                <div class="col-md-10">
                                </div>
                            </div>


                            <div class = "row">
                                <div class ="col-md-12">
                                    <textarea  onkeyup="textCounter(this,'counter6',200);" class="form-control" rows="5"  id="message6" class="form-control" rows="5" name = "subactivitati2"data-toggle="tooltip" data-placement="top" title="Pornind de la punctele forte, cunostintele, abilitatile si competentele formulate la primul pas, stabiliti sub-activitati si actiuni mai simple, comportamente concrete, precum si moduri in care veti asigura eficienta
-care determina in final realizarea obiectivului cheie;
- a caror realizare depinde in mare masura sau in totalitate de voi;
- pot fi activitati si actiuni de dezvoltare/invatare care sustin atingerea obiectivelor cheie">${c.subactivitati}</textarea>
                                </div>
                            </div>

                            <div class = "row">
                                <div class ="col-md-10">

                                </div>
                                <div class ="col-md-2">
                                    <input disabled  maxlength="3" size="3" value="200" id="counter6" style="margin-top: 12%;margin-left: 80%;">
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


                           <h1>Perspectiva N+1</h1>




                                </div>

                                <div class="col-md-10">
                                </div>
                            </div>

                            <div class = "row">
                                <div class = "col-md-5">
                                    <div class="form-group">
                                        <h8 for="comment">Voi continua</h8>
                                        <c:choose>
                                            <c:when test="${not empty emailechipa}">
                                                <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter7',200);" id="message7" class="form-control"  name = "voi_continua2" data-toggle="tooltip" data-placement="top" title="Treceti aici TOATE acele exemple comportamentale concrete, care merita sa fie continuate sau pastrate pentru ca au un impact semnificativ in atingerea cu succes a obiectivului cheie (fie din punctul de vedere al angajatului, fie al n+1).
E important sa le identificam, pentru a ajuta angajatul in constientizarea actiunilor care merita sa fie continuate. In acelasi timp, este instructiva discutia, pentru ambele persoane, asupra ce se considera a fi un comportament de succes - vazut din cele doua perspective (angajat-superior)">${c.voi_continua}</textarea>
                                            </c:when>
                                            <c:otherwise>
                                                <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter7',200);" id="message7" class="form-control"  name = "voi_continua2" data-toggle="tooltip" data-placement="top" title="Treceti aici TOATE acele exemple comportamentale concrete, care merita sa fie continuate sau pastrate pentru ca au un impact semnificativ in atingerea cu succes a obiectivului cheie (fie din punctul de vedere al angajatului, fie al n+1).
E important sa le identificam, pentru a ajuta angajatul in constientizarea actiunilor care merita sa fie continuate. In acelasi timp, este instructiva discutia, pentru ambele persoane, asupra ce se considera a fi un comportament de succes - vazut din cele doua perspective (angajat-superior)" disabled>${c.voi_continua}</textarea>
                                            </c:otherwise>
                                        </c:choose>


                                    </div>
                                </div>
                                <div class = "col-md-2">

                                </div>

                                <div class = "col-md-5">
                                    <div class="form-group">
                                        <h8 for="comment" style = "margin-left: 4%">Voi avea in considerare</h8>
                                        <c:choose>
                                        <c:when test="${not empty emailechipa}">
                                            <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter8',200);" id="message8" class="form-control"  name = "voi_lua_in_considerare2" data-toggle="tooltip" data-placement="top" title="Treceti aici exemple concrete comportamentale, care merita a fi incepute, incetate sau schimbate in vederea atingerii obiectivelor cheie.
Acestea merita a fi punctate pentu ca angajatul sa poata constientiza, care sunt acele activitati pe care merita sa le inceapa sa faca, sa inceteze sa faca sau sa le faca altfel. In acelasi timp, este instructiv pentru ambele persoane discutia asupra ce se considera necesar de schimbat pentru atingerea comportamentului de succes - vazut din cele doua perspective (angajat/superior)">${c.voi_lua_in_considerare}</textarea>
                                        </c:when>
                                            <c:otherwise>
                                                <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter8',200);" id="message8" class="form-control"  name = "voi_lua_in_considerare2" data-toggle="tooltip" data-placement="top" title="Treceti aici exemple concrete comportamentale, care merita a fi incepute, incetate sau schimbate in vederea atingerii obiectivelor cheie.
Acestea merita a fi punctate pentu ca angajatul sa poata constientiza, care sunt acele activitati pe care merita sa le inceapa sa faca, sa inceteze sa faca sau sa le faca altfel. In acelasi timp, este instructiv pentru ambele persoane discutia asupra ce se considera necesar de schimbat pentru atingerea comportamentului de succes - vazut din cele doua perspective (angajat/superior)" disabled>${c.voi_lua_in_considerare}</textarea>
                                            </c:otherwise>
                                        </c:choose>


                                    </div>
                                </div>
                            </div>

                            <div class = "row">
                                <div class = "col-md-5">
                                    <div class = "row">
                                        <div class ="col-md-10">

                                        </div>
                                        <div class ="col-md-2">
                                            <input disabled  maxlength="3" size="3" value="200" id="counter7" style="margin-top: 12%;margin-left: 53%;">
                                        </div>
                                    </div>

                                </div>
                                <div class = "col-md-2"></div>
                                <div class = "col-md-5">
                                    <div class = "row">
                                        <div class ="col-md-10">

                                        </div>
                                        <div class ="col-md-2">
                                            <input disabled  maxlength="3" size="3" value="200" id="counter8" style="margin-top: 12%;margin-left: 53%;">
                                        </div>
                                    </div>
                                </div>

                            </div>


                        </div>
                    </div>
                </div>


        </c:forEach>
    </c:if>

                    <hr>
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

</div>



<div id = "diverseprocese"  style="display: none;">

    <form method="POST" action="doInsertCompetente">
        <input type="hidden" name="parametruprocese" id = "parametruprocese" value="#menu2">
        <c:if test="${not empty competentep}">

            <c:forEach items ="${competentep}" var="c">
                <input type="hidden" name="diversepilon" value="Procese">
                <div class = "container">
                    <div class = "valori">
                        Activitati pentru indeplinirea obiectivelor

                    </div>

                </div>
                <div class="container">



                    <div class="mare">



                        <div class="qanda">


                            <div class = "row">
                                <div class = "col-md-2">

                                <h1>Abilitati</h1>

                                </div>

                                <div class="col-md-10">
                                </div>
                            </div>




                            <div class = "row">
                                <div class ="col-md-12">
                                    <textarea  onkeyup="textCounter(this,'counter9',200);" class="form-control"  id="message9" class="form-control" rows="5" name = "abilitati3" data-toggle="tooltip" data-placement="top" title="Enumerati punctele forte pe care le aveti, abilitati existente, cunostinte, experiente etc. pe care puteti construi in atingerea obiectivelor.
Este important sa inventariem si sa constientizam care sunt punctele noastre tari pentru ca in acest fel din resursele existente/disponibile, creierul le va activa pe acelea care vor asigura focusul, energia, cunostintele si siguranta necesara atingerii obiectivelor">${c.abilitati}</textarea>

                                </div>
                            </div>

                            <div class = "row">
                                <div class ="col-md-10">

                                </div>
                                <div class ="col-md-2">
                                    <input disabled  maxlength="3" size="3" value="200" id="counter9" style="margin-top: 12%;margin-left: 80%;">
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

                                     <h1>Subactivitati</h1>

                                </div>

                                <div class="col-md-10">
                                </div>
                            </div>



                            <div class = "row">
                                <div class ="col-md-12">
                                    <textarea  onkeyup="textCounter(this,'counter10',200);" class="form-control" rows="5"  id="message10" class="form-control" rows="5" name = "subactivitati3" data-toggle="tooltip" data-placement="top" title="Pornind de la punctele forte, cunostintele, abilitatile si competentele formulate la primul pas, stabiliti sub-activitati si actiuni mai simple, comportamente concrete, precum si moduri in care veti asigura eficienta
-care determina in final realizarea obiectivului cheie;
- a caror realizare depinde in mare masura sau in totalitate de voi;
- pot fi activitati si actiuni de dezvoltare/invatare care sustin atingerea obiectivelor cheie">${c.subactivitati}</textarea>
                                </div>
                            </div>

                            <div class = "row">
                                <div class ="col-md-10">

                                </div>
                                <div class ="col-md-2">
                                    <input disabled  maxlength="3" size="3" value="200" id="counter10" style="margin-top: 12%;margin-left: 80%;">
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


                           <h1>Perspectiva N+1</h1>



                                </div>

                                <div class="col-md-10">
                                </div>
                            </div>

                            <div class = "row">
                                <div class = "col-md-5">
                                    <div class="form-group">
                                        <h8 for="comment">Voi continua</h8>
                                        <c:choose>
                                            <c:when test="${not empty emailechipa}">
                                                <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter11',200);" id="message11" class="form-control"  name = "voi_continua3" data-toggle="tooltip" data-placement="top" title="Treceti aici TOATE acele exemple comportamentale concrete, care merita sa fie continuate sau pastrate pentru ca au un impact semnificativ in atingerea cu succes a obiectivului cheie (fie din punctul de vedere al angajatului, fie al n+1).
E important sa le identificam, pentru a ajuta angajatul in constientizarea actiunilor care merita sa fie continuate. In acelasi timp, este instructiva discutia, pentru ambele persoane, asupra ce se considera a fi un comportament de succes - vazut din cele doua perspective (angajat-superior)">${c.voi_continua}</textarea>
                                            </c:when>
                                            <c:otherwise>
                                                <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter11',200);" id="message11" class="form-control"  name = "voi_continua3" data-toggle="tooltip" data-placement="top" title="Treceti aici TOATE acele exemple comportamentale concrete, care merita sa fie continuate sau pastrate pentru ca au un impact semnificativ in atingerea cu succes a obiectivului cheie (fie din punctul de vedere al angajatului, fie al n+1).
E important sa le identificam, pentru a ajuta angajatul in constientizarea actiunilor care merita sa fie continuate. In acelasi timp, este instructiva discutia, pentru ambele persoane, asupra ce se considera a fi un comportament de succes - vazut din cele doua perspective (angajat-superior)" disabled>${c.voi_continua}</textarea>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                </div>
                                <div class = "col-md-2">

                                </div>
                                <div class = "col-md-5">
                                    <div class="form-group">
                                        <h8 for="comment" style = "margin-left: 4%">Voi avea in considerare</h8>
                                        <c:choose>
                                            <c:when test="${not empty emailechipa}">
                                                <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter12',200);" id="message12" class="form-control"  name = "voi_lua_in_considerare3" data-toggle="tooltip" data-placement="top" title="Treceti aici exemple concrete comportamentale, care merita a fi incepute, incetate sau schimbate in vederea atingerii obiectivelor cheie.
Acestea merita a fi punctate pentu ca angajatul sa poata constientiza, care sunt acele activitati pe care merita sa le inceapa sa faca, sa inceteze sa faca sau sa le faca altfel. In acelasi timp, este instructiv pentru ambele persoane discutia asupra ce se considera necesar de schimbat pentru atingerea comportamentului de succes - vazut din cele doua perspective (angajat/superior)">${c.voi_lua_in_considerare}</textarea>
                                            </c:when>
                                            <c:otherwise>
                                                <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter12',200);" id="message12" class="form-control"  name = "voi_lua_in_considerare3" data-toggle="tooltip" data-placement="top" title="Treceti aici exemple concrete comportamentale, care merita a fi incepute, incetate sau schimbate in vederea atingerii obiectivelor cheie.
Acestea merita a fi punctate pentu ca angajatul sa poata constientiza, care sunt acele activitati pe care merita sa le inceapa sa faca, sa inceteze sa faca sau sa le faca altfel. In acelasi timp, este instructiv pentru ambele persoane discutia asupra ce se considera necesar de schimbat pentru atingerea comportamentului de succes - vazut din cele doua perspective (angajat/superior)" disabled>${c.voi_lua_in_considerare}</textarea>

                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                </div>
                            </div>
                            <div class = "row">
                            <div class = "col-md-5">
                                <div class = "row">
                                    <div class ="col-md-10">

                                    </div>
                                    <div class ="col-md-2">
                                        <input disabled  maxlength="3" size="3" value="200" id="counter11" style="margin-top: 12%;margin-left: 53%;">
                                    </div>
                                </div>

                            </div>
                            <div class = "col-md-2"></div>
                            <div class = "col-md-5">
                                <div class = "row">
                                    <div class ="col-md-10">

                                    </div>
                                    <div class ="col-md-2">
                                        <input disabled  maxlength="3" size="3" value="200" id="counter12" style="margin-top: 12%;margin-left: 53%;">
                                    </div>
                                </div>
                            </div>

                        </div>


                        </div>
                    </div>
                </div>


            </c:forEach>
        </c:if>
        <hr>
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
</div>



<div id = "diverseinvatare"  style="display: none;">

    <form method="POST" action="doInsertCompetente">
        <input type="hidden" name="parametruinvatare" id = "parametruinvatare" value="#menu4">
        <c:if test="${not empty competenteid}">

            <c:forEach items ="${competenteid}" var="c">
                <input type="hidden" name="diversepilon" value="Invatare">
                <div class = "container">
                    <div class = "valori">
                        Activitati pentru indeplinirea obiectivelor

                    </div>

                </div>
                <div class="container">



                    <div class="mare">



                        <div class="qanda">


                            <div class = "row">
                                <div class = "col-md-2">

                            <h1>Abilitati</h1>

                                </div>

                                <div class="col-md-10">
                                </div>
                            </div>

                            <div class = "row">
                                <div class ="col-md-12">
                                    <textarea  onkeyup="textCounter(this,'counter13',200);" class="form-control"  id="message13" class="form-control" rows="5" name = "abilitati4" data-toggle="tooltip" data-placement="top" title="Enumerati punctele forte pe care le aveti, abilitati existente, cunostinte, experiente etc. pe care puteti construi in atingerea obiectivelor.
Este important sa inventariem si sa constientizam care sunt punctele noastre tari pentru ca in acest fel din resursele existente/disponibile, creierul le va activa pe acelea care vor asigura focusul, energia, cunostintele si siguranta necesara atingerii obiectivelor">${c.abilitati}</textarea>


                                </div>
                            </div>
                            <div class = "row">
                                <div class ="col-md-10">

                                </div>
                                <div class ="col-md-2">
                                    <input disabled  maxlength="3" size="3" value="200" id="counter13" style="margin-top: 12%;margin-left: 80%;">
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

                                         <h1>Subactivitati</h1>


                                </div>

                                <div class="col-md-10">
                                </div>
                            </div>

                            <div class = "row">
                                <div class ="col-md-12">

                                    <textarea  onkeyup="textCounter(this,'counter14',200);" class="form-control" rows="5"  id="message14" class="form-control" rows="5" name = "subactivitati4" data-toggle="tooltip" data-placement="top" title="Pornind de la punctele forte, cunostintele, abilitatile si competentele formulate la primul pas, stabiliti sub-activitati si actiuni mai simple, comportamente concrete, precum si moduri in care veti asigura eficienta
-care determina in final realizarea obiectivului cheie;
- a caror realizare depinde in mare masura sau in totalitate de voi;
- pot fi activitati si actiuni de dezvoltare/invatare care sustin atingerea obiectivelor cheie">${c.subactivitati}</textarea>
                                </div>
                            </div>

                            <div class = "row">
                                <div class ="col-md-10">

                                </div>
                                <div class ="col-md-2">
                                    <input disabled  maxlength="3" size="3" value="200" id="counter14" style="margin-top: 12%;margin-left: 80%;">
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


                           <h1>Perspectiva N+1</h1>




                                </div>

                                <div class="col-md-10">
                                </div>
                            </div>

                            <div class = "row">
                                <div class = "col-md-5">
                                    <div class="form-group">
                                        <h8 for="comment">Voi continua</h8>

                                        <c:choose>
                                            <c:when test="${not empty emailechipa}">
                                                <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter15',200);" id="message15" class="form-control"  name = "voi_continua4" data-toggle="tooltip" data-placement="top" title="Treceti aici TOATE acele exemple comportamentale concrete, care merita sa fie continuate sau pastrate pentru ca au un impact semnificativ in atingerea cu succes a obiectivului cheie (fie din punctul de vedere al angajatului, fie al n+1).
E important sa le identificam, pentru a ajuta angajatul in constientizarea actiunilor care merita sa fie continuate. In acelasi timp, este instructiva discutia, pentru ambele persoane, asupra ce se considera a fi un comportament de succes - vazut din cele doua perspective (angajat-superior)">${c.voi_continua}</textarea>
                                            </c:when>
                                            <c:otherwise>
                                                <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter15',200);" id="message15" class="form-control"  name = "voi_continua4" data-toggle="tooltip" data-placement="top" title="Treceti aici TOATE acele exemple comportamentale concrete, care merita sa fie continuate sau pastrate pentru ca au un impact semnificativ in atingerea cu succes a obiectivului cheie (fie din punctul de vedere al angajatului, fie al n+1).
E important sa le identificam, pentru a ajuta angajatul in constientizarea actiunilor care merita sa fie continuate. In acelasi timp, este instructiva discutia, pentru ambele persoane, asupra ce se considera a fi un comportament de succes - vazut din cele doua perspective (angajat-superior)" disabled>${c.voi_continua}</textarea>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                </div>
                                <div class = "col-md-2">

                                </div>
                                <div class = "col-md-5">
                                    <div class="form-group">
                                        <h8 for="comment" style = "margin-left: 4%">Voi avea in considerare</h8>
                                        <c:choose>
                                            <c:when test="${not empty emailechipa}">
                                                <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter16',200);" id="message16" class="form-control"  name = "voi_lua_in_considerare4" data-toggle="tooltip" data-placement="top" title="Treceti aici exemple concrete comportamentale, care merita a fi incepute, incetate sau schimbate in vederea atingerii obiectivelor cheie.
Acestea merita a fi punctate pentu ca angajatul sa poata constientiza, care sunt acele activitati pe care merita sa le inceapa sa faca, sa inceteze sa faca sau sa le faca altfel. In acelasi timp, este instructiv pentru ambele persoane discutia asupra ce se considera necesar de schimbat pentru atingerea comportamentului de succes - vazut din cele doua perspective (angajat/superior)">${c.voi_lua_in_considerare}</textarea>
                                            </c:when>
                                            <c:otherwise>
                                                <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter16',200);" id="message16" class="form-control"  name = "voi_lua_in_considerare4" data-toggle="tooltip" data-placement="top" title="Treceti aici exemple concrete comportamentale, care merita a fi incepute, incetate sau schimbate in vederea atingerii obiectivelor cheie.
Acestea merita a fi punctate pentu ca angajatul sa poata constientiza, care sunt acele activitati pe care merita sa le inceapa sa faca, sa inceteze sa faca sau sa le faca altfel. In acelasi timp, este instructiv pentru ambele persoane discutia asupra ce se considera necesar de schimbat pentru atingerea comportamentului de succes - vazut din cele doua perspective (angajat/superior)" disabled>${c.voi_lua_in_considerare}</textarea>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                </div>
                            </div>
                            <div class = "row">
                            <div class = "col-md-5">
                                <div class = "row">
                                    <div class ="col-md-10">

                                    </div>
                                    <div class ="col-md-2">
                                        <input disabled  maxlength="3" size="3" value="200" id="counter15" style="margin-top: 12%;margin-left: 53%;">
                                    </div>
                                </div>

                            </div>
                            <div class = "col-md-2"></div>
                            <div class = "col-md-5">
                                <div class = "row">
                                    <div class ="col-md-10">

                                    </div>
                                    <div class ="col-md-2">
                                        <input disabled  maxlength="3" size="3" value="200" id="counter16" style="margin-top: 12%;margin-left: 53%;">
                                    </div>
                                </div>
                            </div>
                            </div>

                        </div>
                    </div>
                </div>


            </c:forEach>
        </c:if>
        <hr>
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
</div>

           <div id = "diverseoameni"  style="display: none;">


               <form method="POST" action="doInsertCompetente">
                   <input type="hidden" name="parametruoameni" id = "parametruoameni" value="#menu3">
                   <c:if test="${not empty competenteo}">

                       <c:forEach items ="${competenteo}" var="c">
                           <input type="hidden" name="diversepilon" value="Oameni">
                           <div class = "container">
                               <div class = "valori">
                                   Activitati pentru indeplinirea obiectivelor

                               </div>

                           </div>
                           <div class="container">



                               <div class="mare">



                                   <div class="qanda">


                                       <div class = "row">
                                           <div class = "col-md-2">

                                               <h1>Abilitati</h1>

                                           </div>

                                           <div class="col-md-10">
                                           </div>
                                       </div>

                                       <div class = "row">
                                           <div class ="col-md-12">
                                               <textarea  onkeyup="textCounter(this,'counter17',200);" class="form-control"  id="message17" class="form-control" rows="5" name = "abilitati5" data-toggle="tooltip" data-placement="top" title="Enumerati punctele forte pe care le aveti, abilitati existente, cunostinte, experiente etc. pe care puteti construi in atingerea obiectivelor.
Este important sa inventariem si sa constientizam care sunt punctele noastre tari pentru ca in acest fel din resursele existente/disponibile, creierul le va activa pe acelea care vor asigura focusul, energia, cunostintele si siguranta necesara atingerii obiectivelor">${c.abilitati}</textarea>


                                           </div>
                                       </div>
                                       <div class = "row">
                                           <div class ="col-md-10">

                                           </div>
                                           <div class ="col-md-2">
                                               <input disabled  maxlength="3" size="3" value="200" id="counter17" style="margin-top: 12%;margin-left: 80%;">
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

                                               <h1>Subactivitati</h1>


                                           </div>

                                           <div class="col-md-10">
                                           </div>
                                       </div>

                                       <div class = "row">
                                           <div class ="col-md-12">

                                               <textarea  onkeyup="textCounter(this,'counter19',200);" class="form-control" rows="5"  id="message19" class="form-control" rows="5" name = "subactivitati5" data-toggle="tooltip" data-placement="top" title="Pornind de la punctele forte, cunostintele, abilitatile si competentele formulate la primul pas, stabiliti sub-activitati si actiuni mai simple, comportamente concrete, precum si moduri in care veti asigura eficienta
-care determina in final realizarea obiectivului cheie;
- a caror realizare depinde in mare masura sau in totalitate de voi;
- pot fi activitati si actiuni de dezvoltare/invatare care sustin atingerea obiectivelor cheie">${c.subactivitati}</textarea>
                                           </div>
                                       </div>

                                       <div class = "row">
                                           <div class ="col-md-10">

                                           </div>
                                           <div class ="col-md-2">
                                               <input disabled  maxlength="3" size="3" value="200" id="counter19" style="margin-top: 12%;margin-left: 80%;">
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


                                               <h1>Perspectiva N+1</h1>




                                           </div>

                                           <div class="col-md-10">
                                           </div>
                                       </div>

                                       <div class = "row">
                                           <div class = "col-md-5">
                                               <div class="form-group">
                                                   <h8 for="comment">Voi continua</h8>

                                                   <c:choose>
                                                       <c:when test="${not empty emailechipa}">
                                                           <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter20',200);" id="message20" class="form-control"  name = "voi_continua5" data-toggle="tooltip" data-placement="top" title="Treceti aici TOATE acele exemple comportamentale concrete, care merita sa fie continuate sau pastrate pentru ca au un impact semnificativ in atingerea cu succes a obiectivului cheie (fie din punctul de vedere al angajatului, fie al n+1).
E important sa le identificam, pentru a ajuta angajatul in constientizarea actiunilor care merita sa fie continuate. In acelasi timp, este instructiva discutia, pentru ambele persoane, asupra ce se considera a fi un comportament de succes - vazut din cele doua perspective (angajat-superior)">${c.voi_continua}</textarea>
                                                       </c:when>
                                                       <c:otherwise>
                                                           <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter20',200);" id="message20" class="form-control"  name = "voi_continua5" data-toggle="tooltip" data-placement="top" title="Treceti aici TOATE acele exemple comportamentale concrete, care merita sa fie continuate sau pastrate pentru ca au un impact semnificativ in atingerea cu succes a obiectivului cheie (fie din punctul de vedere al angajatului, fie al n+1).
E important sa le identificam, pentru a ajuta angajatul in constientizarea actiunilor care merita sa fie continuate. In acelasi timp, este instructiva discutia, pentru ambele persoane, asupra ce se considera a fi un comportament de succes - vazut din cele doua perspective (angajat-superior)" disabled>${c.voi_continua}</textarea>
                                                       </c:otherwise>
                                                   </c:choose>

                                               </div>
                                           </div>
                                           <div class = "col-md-2">

                                           </div>
                                           <div class = "col-md-5">
                                               <div class="form-group">
                                                   <h8 for="comment" style = "margin-left: 4%">Voi avea in considerare</h8>
                                                   <c:choose>
                                                       <c:when test="${not empty emailechipa}">
                                                           <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter22',200);" id="message22" class="form-control"  name = "voi_lua_in_considerare5" data-toggle="tooltip" data-placement="top" title="Treceti aici exemple concrete comportamentale, care merita a fi incepute, incetate sau schimbate in vederea atingerii obiectivelor cheie.
Acestea merita a fi punctate pentu ca angajatul sa poata constientiza, care sunt acele activitati pe care merita sa le inceapa sa faca, sa inceteze sa faca sau sa le faca altfel. In acelasi timp, este instructiv pentru ambele persoane discutia asupra ce se considera necesar de schimbat pentru atingerea comportamentului de succes - vazut din cele doua perspective (angajat/superior)">${c.voi_lua_in_considerare}</textarea>
                                                       </c:when>
                                                       <c:otherwise>
                                                           <textarea class="form-control" rows="5" onkeyup="textCounter(this,'counter22',200);" id="message22" class="form-control"  name = "voi_lua_in_considerare5" data-toggle="tooltip" data-placement="top" title="Treceti aici exemple concrete comportamentale, care merita a fi incepute, incetate sau schimbate in vederea atingerii obiectivelor cheie.
Acestea merita a fi punctate pentu ca angajatul sa poata constientiza, care sunt acele activitati pe care merita sa le inceapa sa faca, sa inceteze sa faca sau sa le faca altfel. In acelasi timp, este instructiv pentru ambele persoane discutia asupra ce se considera necesar de schimbat pentru atingerea comportamentului de succes - vazut din cele doua perspective (angajat/superior)" disabled>${c.voi_lua_in_considerare}</textarea>
                                                       </c:otherwise>
                                                   </c:choose>

                                               </div>
                                           </div>
                                       </div>
                                       <div class = "row">
                                           <div class = "col-md-5">
                                               <div class = "row">
                                                   <div class ="col-md-10">

                                                   </div>
                                                   <div class ="col-md-2">
                                                       <input disabled  maxlength="3" size="3" value="200" id="counter20" style="margin-top: 12%;margin-left: 53%;">
                                                   </div>
                                               </div>

                                           </div>
                                           <div class = "col-md-2"></div>
                                           <div class = "col-md-5">
                                               <div class = "row">
                                                   <div class ="col-md-10">

                                                   </div>
                                                   <div class ="col-md-2">
                                                       <input disabled  maxlength="3" size="3" value="200" id="counter22" style="margin-top: 12%;margin-left: 53%;">
                                                   </div>
                                               </div>
                                           </div>
                                       </div>

                                   </div>
                               </div>
                           </div>


                       </c:forEach>
                   </c:if>
                   <hr>
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
           </div>

<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content" style="margin-top:30%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"  style="font-size: 22px;">Adauga obiectiv Financiar</h4>
            </div>
            <div class="modal-body">

                <div id = "alerta2" style="display: none;" class="alert alert-success alert-dismissible">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Felicitari!</strong> Ai introdus un nou obiectiv in cadrul pilonului "Financiar".
                </div>
                    <form method="POST" action="doInsertObiectiv">
                        <input type="hidden" name="w" value="#home">




                        <div class="form-group">
                            <label for="numeobiectiv">Nume obiectiv:</label>
                            <input type="text" class="form-control" id="numeobiectiv" name="numeobiectiv" required>
                        </div>
                        <div claa = "row">
                            <div class = "col-md-5">
                                <div class="form-group">
                                    <label for="preconizat">Valoare obiectiv:</label>
                                    <input type="number" class="form-control" id="preconizat" name="preconizat">
                                </div>
                            </div>
                            <div class = "col-md-2">

                            </div>
                            <div class = "col-md-5">
                                <div class="form-group">
                                    <label for="realizat">Realizat:</label>
                                    <input type="number" class="form-control" id="realizat" name="realizat" >
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                        <label for="descriere">Descriere obiectiv:</label>
                        <textarea class="form-control" rows="5" id="descriere" name="descriere"></textarea>
                        </div>
                        <div>

                            <div class = "row">
                                <div class = "col-md-10">

                                </div>
                                <div class = "col-md-2">


                                        <button type="submit" class="detalii" style="width: 100px;height: 60px;" id ="alerta">
                                            <i class="material-icons">cloud_done</i> Salveaza
                                        </button>

                                </div>
                            </div>
                        </div>
                    </form>

            </div>
        </div>

    </div>
</div>


<div id="myModal2" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content" style="margin-top:30%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"  style="font-size: 22px;">Adauga obiectiv Clienti</h4>
            </div>
            <div class="modal-body">



                    <div id = "alertaclienti2"   style="display: none;" class="alert alert-success alert-dismissible">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Felicitari!</strong> Ai introdus un nou obiectiv in cadrul pilonului "Clienti".
                    </div>


                <form method="POST" action="doInsertObiectivClienti">
                    <input type="hidden" name="w" value="#menu1">
                    <div class="form-group">
                        <label for="numeobiectivclienti">Nume obiectiv:</label>
                        <input type="text" class="form-control" id="numeobiectivclienti" name="numeobiectivclienti" required>
                    </div>
                    <div class = "row">
                        <div class = "col-md-5">
                            <div class="form-group">
                                <label for="preconizatclienti">Valoare obiectiv:</label>
                                <input type="number" class="form-control" id="preconizatclienti" name="preconizatclienti">
                            </div>
                        </div>
                        <div class = "col-md-2">

                        </div>
                        <div class = "col-md-5">
                            <div class="form-group">
                                <label for="realizatclienti">Realizat:</label>
                                <input type="number" class="form-control" id="realizatclienti" name="realizatclienti" >
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="descriereclienti">Descriere obiectiv:</label>
                        <textarea class="form-control" rows="5" id="descriereclienti" name="descriereclienti"></textarea>
                    </div>
                    <div>

                        <div class = "row">
                            <div class = "col-md-10">

                            </div>
                            <div class = "col-md-2">


                                    <button type="submit" class="detalii" style="width: 100px;height: 60px;" id ="alertaclienti">
                                        <i class="material-icons">cloud_done</i> Salveaza
                                    </button>

                            </div>
                        </div>
                    </div>
                </form>

            </div>

        </div>

    </div>
</div>

<div id="myModal3" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content" style="margin-top:30%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" style="font-size: 22px;">Adauga obiectiv procese</h4>
            </div>
            <div class="modal-body">

                    <div id = "alertaprocese2" style="display: none;" class="alert alert-success alert-dismissible">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Felicitari!</strong> Ai introdus un nou obiectiv in cadrul pilonului "Procese".
                    </div>

                <form method="POST" action="doInsertObiectivProcese">
                    <input type="hidden" name="w" value="#menu2">
                    <div class="form-group">
                        <label for="numeobiectivprocese">Nume obiectiv:</label>
                        <input type="text" class="form-control" id="numeobiectivprocese" name="numeobiectivprocese" required>
                    </div>
                    <div class = "row">

                        <div class = "col-md-5">
                            <div class="form-group">
                                <label for="preconizatprocese">Valoare obiectiv:</label>
                                <input type="number" class="form-control" id="preconizatprocese" name="preconizatprocese">
                            </div>
                        </div>
                        <div class = "col-md-2">

                        </div>
                        <div class = "col-md-5">
                            <div class="form-group">
                                <label for="realizatprocese">Realizat:</label>
                                <input type="number" class="form-control" id="realizatprocese" name="realizatprocese" >
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="descriereprocese">Descriere obiectiv:</label>
                        <textarea class="form-control" rows="5" id="descriereprocese" name="descriereprocese"></textarea>
                    </div>
                    <div>
                        <div class ="row">
                            <div class = "col-md-10">

                            </div>
                            <div class = "col-md-2">
                                <button type="submit" class="detalii" style="width: 100px;height: 60px;" id ="alertaprocese">
                                    <i class="material-icons">cloud_done</i> Salveaza
                                </button>
                            </div>
                        </div>

                    </div>
                </form>

            </div>

        </div>

    </div>
</div>

<div id="myModal5" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content" style="margin-top: 30%;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"  style="font-size: 22px;">Adauga obiectiv Oameni</h4>
            </div>
            <div class="modal-body">

                    <div id = "alertaoameni2"  style="display: none;" class="alert alert-success alert-dismissible">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Felicitari!</strong> Ai introdus un nou obiectiv in cadrul pilonului "Oameni".
                    </div>

                <form method="POST" action="doInsertObiectivOameni">
                    <input type="hidden" name="w" value="#menu3">
                    <div class="form-group">
                        <label for="numeobiectivoameni">Nume obiectiv:</label>
                        <input type="text" class="form-control" id="numeobiectivoameni" name="numeobiectivoameni" required>
                    </div>
                    <div class = "row">
                        <div class = "col-md-5">
                            <div class="form-group">
                                <label for="preconizatoameni">Valoare obiectiv:</label>
                                <input type="number" class="form-control" id="preconizatoameni" name="preconizatoameni">
                            </div>
                        </div>
                        <div class = "col-md-2">

                        </div>
                        <div class = "col-md-5">
                            <div class="form-group">
                                <label for="realizatoameni">Realizat:</label>
                                <input type="number" class="form-control" id="realizatoameni" name="realizatoameni" >
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="descriereoameni">Descriere obiectiv:</label>
                        <textarea class="form-control" rows="5" id="descriereoameni" name="descriereoameni"></textarea>
                    </div>
                    <div >

                        <div class ="row">
                            <div class = "col-md-10">

                            </div>
                            <div class = "col-md-2">
                                <button type="submit" class="detalii" style="width: 100px;height: 60px;" id ="alertaoameni">
                                    <i class="material-icons">cloud_done</i> Salveaza
                                </button>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>

    </div>
</div>
           <div id="myModal4" class="modal fade" role="dialog">
               <div class="modal-dialog">

                   <!-- Modal content-->
                   <div class="modal-content" style="margin-top: 30%;">
                       <div class="modal-header">
                           <button type="button" class="close" data-dismiss="modal">&times;</button>
                           <h4 class="modal-title"  style="font-size: 22px;">Adauga obiectiv Invatare</h4>
                       </div>
                       <div class="modal-body">
                               <div id = "alertainvatare2"  style="display: none;" class="alert alert-success alert-dismissible">
                                   <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                   <strong>Felicitari!</strong> Ai introdus un nou obiectiv in cadrul pilonului "Invatare".
                               </div>


                           <form method="POST" action="doInsertObiectivInvatare">

                               <input type="hidden" name="w"  value="#menu4">
                               <div class="form-group">
                                   <label for="numeobiectivinvatare">Nume obiectiv:</label>
                                   <input type="text" class="form-control" id="numeobiectivinvatare" name="numeobiectivinvatare" required>
                               </div>
                               <div class = "row">
                                   <div class = "col-md-5">
                                       <div class="form-group">
                                           <label for="preconizatinvatare">Valoare obiectiv:</label>
                                           <input type="number" class="form-control" id="preconizatinvatare" name="preconizatinvatare">
                                       </div>
                                   </div>
                                   <div class = "col-md-2">

                                   </div>
                                   <div class = "col-md-5">
                                       <div class="form-group">
                                           <label for="realizatinvatare">Realizat:</label>
                                           <input type="number" class="form-control" id="realizatinvatare" name="realizatinvatare" >
                                       </div>
                                   </div>
                               </div>


                               <div class="form-group">
                                   <label for="descriereinvatare">Descriere obiectiv:</label>
                                   <textarea class="form-control" rows="5" id="descriereinvatare" name="descriereinvatare"></textarea>
                               </div>
                               <div >

                                   <div class ="row">
                                       <div class = "col-md-10">

                                       </div>
                                       <div class = "col-md-2">
                                           <button type="submit" class="detalii" style="width: 100px;height: 60px;" id ="alertainvatare">
                                               <i class="material-icons">cloud_done</i> Salveaza
                                           </button>
                                       </div>
                                   </div>
                               </div>
                           </form>

                       </div>
                   </div>

               </div>
           </div>

   </div>



<input type="hidden" name="parametru" id="parametru"  value=${parametru}>


<script type="text/javascript">





    $(function(){
        $('#alerta').click(function(){
            $('#alerta2').show();
        });

    });

    $(function(){
        $('#alertaclienti').click(function(){
            $('#alertaclienti2').show();
        });

    });
    $(function(){
        $('#alertaprocese').click(function(){
            $('#alertaprocese2').show();
        });

    });

    $(function(){
        $('#alertaoameni').click(function(){
            $('#alertaoameni2').show();
        });

    });
    $(function(){
        $('#alertainvatare').click(function(){
            $('#alertainvatare2').show();
        });

    });

    $(function(){
        $('#stergefinanciar').click(function(){
            $('#alerta3').show();
        });

    });

    $(function(){
        $('#stergeclienti').click(function(){
            $('#stergeclienti2').show();
        });

    });

    $(function(){
        $('#stergeprocese').click(function(){
            $('#stergeprocese2').show();
        });

    });

    $(function(){
        $('#stergeoameni').click(function(){
            $('#stergeoameni2').show();
        });

    });

    $(function(){
        $('#stergeinvatare').click(function(){
            $('#stergeinvatare2').show();
        });

    });
    $(function(){
        $('#obiective-button').click(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();
            $('#obiective').show();
        });

        $('#diverse-button').click(function(){
            $('#obiective').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();
            $('#diverse').show();
        });
    });


    $(function(){
        $('#OBJECTIVE_NAME_PROCESE').click(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();
            $('#obiective').show();
        });
    });


    $(function(){
        $('#OBJECTIVE_NAME').click(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();
            $('#obiective').show();
        });
    });


    $(function(){
        $('#OBJECTIVE_NAME_OAMENI').click(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();
            $('#obiective').show();
        });
    });


    $(function(){
        $('#OBJECTIVE_NAME_CLIENTI').click(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();
            $('#obiective').show();
        });
    });

    $(function(){
        $('#OBJECTIVE_NAME_INVATARE').click(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();
            $('#obiective').show();
        });
    });

    $(function(){
        $('#obiective-button2').click(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();

            $('#obiective').show();
        });

        $('#diverse-button2').click(function(){
            $('#obiective').hide();
            $('#diverse').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();
            $('#diverseclienti').show();
        });
    });
    $(function(){
        $('#obiective-button3').click(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();
            $('#obiective').show();
        });

        $('#diverse-button3').click(function(){
            $('#obiective').hide();
            $('#diverse').hide();
            $('#diverseprocese').show();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();
            $('#diverseclienti').hide();
        });
    });
    $(function(){
        $('#obiective-button4').click(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();

            $('#obiective').show();
        });

        $('#diverse-button4').click(function(){
            $('#obiective').hide();
            $('#diverse').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').show();
            $('#diverseclienti').hide();
            $('#diverseoameni').hide();
        });
    });

    $(function(){
        $('#obiective-button5').click(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();

            $('#obiective').show();
        });

        $('#diverse-button5').click(function(){
            $('#obiective').hide();
            $('#diverse').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseclienti').hide();
            $('#diverseoameni').show();
        });
    });

    $(function(){

        $('#financiar').click(function(){
            $('#diverse').show();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#obiective').hide();
            $('#diverseoameni').hide();

        });
        $('#clienti').click(function(){
            $('#diverse').hide();
            $('#diverseclienti').show();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();

            $('#obiective').hide();

        });
        $('#procese').click(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').show();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();
            $('#obiective').hide();

        });
        $('#invatare').click(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').show();
            $('#obiective').hide();
            $('#diverseoameni').hide();

        });

        $('#oameni').click(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseoameni').show();
            $('#diverseinvatare').hide();
            $('#obiective').hide();

        });
    });


    //invatare
    var parametru =  document.getElementById('parametru').value;
    console.log("parametru" + parametru);
    if (parametru == "#menu4"){
        $(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseoameni').hide();
            $('#obiective').hide();
            $('#diverseinvatare').show();
        });
    }


    if (parametru == "#home"){
        $(function(){
            $('#diverse').show();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#obiective').hide();
            $('#diverseoameni').hide();
        });
    }
    //clienti

    if (parametru == "#menu1"){
        $(function(){
            $('#diverse').hide();
            $('#diverseclienti').show();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();
            $('#obiective').hide();
        });
    }
    //procese

    if (parametru == "#menu2"){
        $(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').show();
            $('#diverseinvatare').hide();
            $('#diverseoameni').hide();
            $('#obiective').hide();
        });
    }
    //oameni

    if (parametru == "#menu3"){
        $(function(){
            $('#diverse').hide();
            $('#diverseclienti').hide();
            $('#diverseprocese').hide();
            $('#diverseinvatare').hide();
            $('#diverseoameni').show();
            $('#obiective').hide();
        });
    }

</script>


<script>


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
    <a href="#perspective" title="To Top">
        <span class="glyphicon glyphicon-chevron-up"></span>
    </a>

</footer>


<script>

    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });

</script>
<script>
    $(document).ready(function(){
        // Add smooth scrolling to all links in navbar + footer link
        $(".navbar a, footer a[href='#perspective']").on('click', function(event) {
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