<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Echipa mea</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://apis.google.com/js/api:client.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="stilizare.css">

    <script>
        function signOut() {
            var auth2 = gapi.auth2.getAuthInstance();
            auth2.signOut().then(function () {
                console.log('User signed out.');
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
            <li class="butonfaq"><a href="/echipamea">Echipa Mea</a></li>

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


<h2>  </h2>

<div class = "container">
    <div class = "valori">Echipa mea</div>

</div>
<div class="container">



    <div class="mare">



        <div class="qanda">

                <div class = "row">

                  <div class ="col-md-2">
                      <div class ="row">
                          <div class = "col-md-12" style="text-align: center">
                              <img src="${poza}" class="img-circle" alt="Cinque Terre" width="100px" height="100px" style=" margin-top: 12px;">
                          </div>
                      </div>
                      <div class ="row">
                          <div class = "col-md-12" style="text-align: center">
                              <b> <p>Nenu Ana Maria</p></b>
                          </div>
                      </div>
                      <div class ="row">
                          <div class = "col-md-12" style="text-align: center">
                              <l><p>Responsabil Servicii IT Enterprise</p></l>
                          </div>
                      </div>
                   </div>


                    <div class = "col-md-1" style="width: 2%">
                      <div class = "v1"></div>
                    </div>

                  <div class = "col-md-9">
                    <div class ="row" style="width: 110%">

                        <c:if test="${not empty list8}">

                        <c:forEach items ="${list8}" var="ceva">
                        <div class = "col-md-3">
                            <div class = "row">
                                <div class ="col-md-2">
                                    <img src="${poza}" class="img-circle" alt="Cinque Terre" width="50px" height="50px" style="margin-top: 15px">
                                </div>
                                <div class = "col-md-10">
                                    <div class = "row" style="margin-left: 14%;margin-top: 6%;">
                                        <div class ="col-md-12">
                                            <b> <p>${ceva.last_name} ${ceva.first_name}</p></b>
                                        </div>
                                        <div class = "col-md-12">
                                            <p>${ceva.unit}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        </c:forEach>
                        </c:if>


                    </div>

                  </div>


               </div>

        </div>
    </div>



</div>
<h2>  </h2>


<c:if test="${not empty list8}">

<c:forEach items ="${list8}" var="ceva">

<div class="container">



    <div class="mare">



        <div class="qanda2">

            <div class = "row">

                <div class ="col-md-2">
                    <div class ="row">
                        <div class = "col-md-12" style="text-align: center">
                            <img src="${poza}" class="img-circle" alt="Cinque Terre" width="100px" height="100px" style=" margin-top: 12px;">
                        </div>
                    </div>
                    <div class ="row">
                        <div class = "col-md-12" style="text-align: center">

                            <b> <p>${ceva.last_name} ${ceva.first_name} </p></b>

                        </div>


                    </div>
                    <div class ="row">
                        <div class = "col-md-12" style="text-align: center">
                            <p>${ceva.unit}</p>
                        </div>
                    </div>
                    <c:if test="${not empty verifn2}">
                    <div class ="row">
                        <div class = "col-md-12" style="text-align: center">
                            <form method="post" action="/delega">
                                <input type="hidden" name="emailechipa" value="${ceva.email}">
                                <button type="submit" class="detalii"
                                   style="margin-left: 2%;margin-bottom: 1%;margin-top: 2%;width: 83%;background-color: rgba(175,31,23,0.51)">Delega</button>

                            </form>
                        </div>
                    </div>
                    </c:if>
                    <div class ="row">
                        <div class = "col-md-12" style="text-align: center">

                            <button type="button" class="detalii"  style="margin-left: 2%;margin-bottom: 1%;margin-top: 2%;width: 83%;">Evalueaza</button>

                        </div>
                    </div>
                    <div class ="row">
                        <div class = "col-md-6" style="text-align: center">
                            <form method="POST" action="/valori">

                            <input type="hidden" name="emailechipa" value="${ceva.email}">
                                <input type="hidden" name="last_name" value="${ceva.last_name}">
                                <input type="hidden" name="first_name" value="${ceva.first_name}">
                            <button type="submit" class="adauga" id = "diverse-button" style="margin-left: 18%;margin-bottom: 1%;margin-top: 2%;width: 80%;">Detalii</button>
                            </form>
                        </div>
                        <div class = "col-md-6" style="text-align: center">
                            <form method="POST" action="/echipan">
                                <input type="hidden" name="emailechipa" value="${ceva.email}">
                            <button type="submit" class="adauga" id = "diverse-button2" style = "margin-left: -11%;margin-bottom: 1%;margin-top: 2%;width: 80%;">Echipa</button>
                            </form>

                        </div>
                    </div>
                </div>


                <div class = "col-md-1" style="width: 2%;">
                    <div class = "verticalline"></div>
                </div>

                <div class = "col-md-9" style="width: 81%;">
                    <div class ="row">
                        <div class = "row">
                            <div class = "col-md-12">
                                <label>Obiective Q1</label>
                            </div>
                        </div>
                        <div class ="row" style="width: 122%">
                            <div class = "col-md-5">

                                <div class = "row">
                                    <div class = "col-md-12">
                                        <label>Financiar</label>

                                    </div>
                                </div>

                                <div class = "row">
                                    <div class = "col-md-12">
                                        <label>Obiectiv</label>
                                    </div>
                                </div>

                                <div class = "row">
                                    <div class = "col-md-3">
                                        <div class="form-group">
                                            <h8 for="p1">Preconizat</h8>
                                            <input class="form-control casuta" id="p1" type="text">
                                        </div>
                                    </div>
                                    <div class = "col-md-3">
                                        <div class="form-group">
                                            <h8 for="r1">Realizat</h8>
                                            <input class="form-control casuta" id="r1" type="text">
                                        </div>
                                    </div>
                                    <div class = "col-md-6">
                                        <div class="form-group">
                                            <h8 for="pr1">Procent realizare</h8>
                                            <input class="form-control casuta" id="pr1" type="text">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class = "col-md-2" style="width: 2%;">
                                <div class = "verticalline"></div>
                            </div>

                            <div class = "col-md-5">
                                <div class = "row">
                                    <div class = "col-md-12">
                                        <label>Clienti</label>

                                    </div>
                                </div>

                                <div class = "row">
                                    <div class = "col-md-12">
                                        <label>Obiectiv</label>
                                    </div>
                                </div>

                                <div class = "row">
                                    <div class = "col-md-3">
                                        <div class="form-group">
                                            <h8 for="p1">Preconizat</h8>
                                            <input class="form-control casuta" id="p1" type="text">
                                        </div>
                                    </div>
                                    <div class = "col-md-3">
                                        <div class="form-group">
                                            <h8 for="r1">Realizat</h8>
                                            <input class="form-control casuta" id="r1" type="text">
                                        </div>
                                    </div>
                                    <div class = "col-md-6">
                                        <div class="form-group">
                                            <h8 for="pr1">Procent realizare</h8>
                                            <input class="form-control casuta" id="pr1" type="text">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class = "col-md-12">
                                <hr>
                            </div>
                        </div>
                        <div class ="row" style="width: 122%">
                            <div class = "col-md-5">
                                <div class = "row">
                                    <div class = "col-md-12">
                                        <label>Procese</label>

                                    </div>
                                </div>

                                <div class = "row">
                                    <div class = "col-md-12">
                                        <label>Obiectiv</label>
                                    </div>
                                </div>

                                <div class = "row">
                                    <div class = "col-md-3">
                                        <div class="form-group">
                                            <h8 for="p1">Preconizat</h8>
                                            <input class="form-control casuta" id="p1" type="text">
                                        </div>
                                    </div>
                                    <div class = "col-md-3">
                                        <div class="form-group">
                                            <h8 for="r1">Realizat</h8>
                                            <input class="form-control casuta" id="r1" type="text">
                                        </div>
                                    </div>
                                    <div class = "col-md-6">
                                        <div class="form-group">
                                            <h8 for="pr1">Procent realizare</h8>
                                            <input class="form-control casuta" id="pr1" type="text">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class = "col-md-2" style="width: 2%;">
                             <div class = "v1"></div>
                            </div>
                            <div class = "col-md-5">
                                <div class = "row">
                                    <div class = "col-md-12">
                                        <label>Invatare si dezvoltare</label>

                                    </div>
                                </div>

                                <div class = "row">
                                    <div class = "col-md-12">
                                        <label>Obiectiv</label>
                                    </div>
                                </div>

                                <div class = "row">
                                    <div class = "col-md-3">
                                        <div class="form-group">
                                            <h8 for="p1">Preconizat</h8>
                                            <input class="form-control casuta" id="p1" type="text">
                                        </div>
                                    </div>
                                    <div class = "col-md-3">
                                        <div class="form-group">
                                            <h8 for="r1">Realizat</h8>
                                            <input class="form-control casuta" id="r1" type="text">
                                        </div>
                                    </div>
                                    <div class = "col-md-6">
                                        <div class="form-group">
                                            <h8 for="pr1">Procent realizare</h8>
                                            <input class="form-control casuta" id="pr1" type="text">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>

                </div>


            </div>

        </div>
    </div>



</div>




<h2>  </h2>
</c:forEach>
</c:if>

<!-- delegare-->



</body>
</html>