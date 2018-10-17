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


<div class="container">



    <div class="mare">



        <div class="qanda">

            <div class = "row">

                <div class = "col-md-6">
                    <div class = "container">
                        <div class = "valori">Informatii angajat</div>

                    </div>
                    <c:if test="${not empty list9}">

                        <c:forEach items ="${list9}" var="ceva">




                            <p style="padding-left: 15px;"><strong>Nume:</strong>${ceva.last_name}</p>
                            <p style="padding-left: 15px;"><strong>Prenume:</strong>${ceva.first_name}</p>
                    <p style="padding-left: 15px;"><strong>E-mail:</strong>${ceva.email}</p>


                    <p style="padding-left: 15px;"><strong>N+1 Nume:</strong>${ceva.np1_last_name}</p>
                    <p style="padding-left: 15px;"><strong>N+1 Prenume:</strong>${ceva.np1_first_name}</p>
                    <p style="padding-left: 15px;"><strong>N+1 E-mail:</strong>${ceva.np1_email}</p>


                    <p style="padding-left: 15px;"><strong>N+2 Nume:</strong>${ceva.np2_last_name}</p>
                    <p style="padding-left: 15px;"><strong>N+2 Prenume:</strong>${ceva.np2_first_name}</p>
                    <p style="padding-left: 15px;"><strong>N+2 Email:</strong>${ceva.np2_email}</p>



                    <p style="padding-left: 15px;"><strong>N+3 Nume:</strong>${ceva.np3_last_name}</p>
                    <p style="padding-left: 15px;"><strong>N+3 Prenume:</strong>${ceva.np3_first_name}</p>
                    <p style="padding-left: 15px;"><strong>N+3 E-mail:</strong>${ceva.np3_email}</p>

                    <p style="padding-left: 15px;"><strong>N+4 Nume:</strong>${ceva.np4_last_name}</p>
                    <p style="padding-left: 15px;"><strong>N+4 Prenume:</strong>${ceva.np4_first_name}</p>
                    <p style="padding-left: 15px;"><strong>N+4 E-mail:</strong>${ceva.np4_email}</p>

                            <c:if test="${not empty ceva.np5_code}">


                                <p style="padding-left: 15px;"><strong>N+5 Nume:</strong>${ceva.np5_last_name}</p>
                                <p style="padding-left: 15px;"><strong>N+5 Prenume:</strong>${ceva.np5_first_name}</p>
                                <p style="padding-left: 15px;"><strong>N+5 E-mail</strong>${ceva.np5_email}</p>
                            </c:if>



                </div>
                <div class = "col-md-6">


                        <div class="panel panel-default text-center" style="margin-top: 10%;">
                            <div class="panel-heading">
                                <h1>Delega drepturile pentru:</h1>${ceva.last_name} ${ceva.first_name}
                            </div>
                            <form action="/dodelega">
                            <div class="panel-body">


                                <input type="hidden" name="last_name" value="${ceva.last_name}">
                                <input type="hidden" name="first_name" value="${ceva.first_name}">
                                <input type="hidden" name="code" value="${ceva.code}">
                                <input type="hidden" name="email" value="${ceva.email}">


                                <input type="hidden" name="np2_code" value="${ceva.np2_code}">
                                <input type="hidden" name="np2_last_name" value="${ceva.np2_last_name}">
                                <input type="hidden" name="np2_first_name" value="${ceva.np2_first_name}">
                                <input type="hidden" name="np2_email" value="${ceva.np2_email}">


                                <input type="hidden" name="np3_code" value="${ceva.np3_code}">
                                <input type="hidden" name="np3_last_name" value="${ceva.np3_last_name}">
                                <input type="hidden" name="np3_first_name" value="${ceva.np3_first_name}">
                                <input type="hidden" name="np3_email" value="${ceva.np3_email}">

                                <input type="hidden" name="np4_code" value="${ceva.np4_code}">
                                <input type="hidden" name="np4_last_name" value="${ceva.np4_last_name}">
                                <input type="hidden" name="np4_first_name" value="${ceva.np4_first_name}">
                                <input type="hidden" name="np4_email" value="${ceva.np4_email}">

                                <input type="hidden" name="np5_code" value="${ceva.np5_code}">
                                <input type="hidden" name="np5_last_name" value="${ceva.np5_last_name}">
                                <input type="hidden" name="np5_first_name" value="${ceva.np5_first_name}">
                                <input type="hidden" name="np5_email" value="${ceva.np5_email}">



                                    <div class="form-group">
                                        <label for="np1_email">Adresa e-mail:</label>
                                        <input type="email" class="form-control" id="np1_email" name = "np1_email">
                                    </div>
                                    <div class="form-group">
                                        <label for="np1_nume">Nume:</label>
                                        <input type="text" class="form-control" id="np1_nume" name = "np1_nume">
                                    </div>
                                    <div class="form-group">
                                        <label for="np1_prenume">Prenume:</label>
                                        <input type="text" class="form-control" id="np1_prenume" name = "np1_prenume">
                                    </div>

                                    <div class="form-group">
                                        <label for="np1_marca">Marca:</label>
                                        <input type="text" class="form-control" id="np1_marca" name = "np1_marca">
                                    </div>


                            </div>

                            <div class="panel-footer">
                                <h3></h3>
                                <h4></h4>
                                <button  type="submit" class="btn btn-lg">Salveaza</button>
                            </div>
                            </form>
                        </div>

                </div>


                </div>

            </c:forEach>

            </c:if>



        </div>
    </div>



</div>
<h2>  </h2>


</body>
</html>