<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();
        });
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
        $(document).ready(function(){
            $("#myInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#myDIV li").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
<body id="echipamea" data-spy="scroll" data-target=".navbar" data-offset="60">

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
            <li class="butonfaq"><a href="/perspective">Perspective</a></li>
            <li class="butonfaq"><a href="/valori">Valori</a></li>
            <li class="home"><a href="/echipamea">Echipa Mea</a></li>

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
            <img src="${poza}" class="img-circle" onerror="this.src='https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg'" width="40" height="40" style=" margin-top: -6px;">

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
                              <img src="${poza}" class="img-circle" onerror="this.src='https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg'"  width="100px" height="100px" style=" margin-top: 12px;">
                          </div>
                      </div>
                      <div class ="row">
                          <div class = "col-md-12" style="text-align: center">
                              <b> <p>

                                  ${Name}
                              </p></b>
                          </div>
                      </div>
                      <div class ="row">
                          <div class = "col-md-12" style="text-align: center">
                              <l><p>${unit}</p></l>
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
                                    <img src="${ceva.poza}" class="img-circle"onerror="this.src='https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg'" width="50px" height="50px" style="margin-top: 15px">
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
<div class="container">
<p style="font-size: 16px;color: #2c83dc">Cauta</p><input id="myInput" type="text" placeholder="Search..">
</div>

<c:if test="${not empty list8}">

<c:forEach items ="${list8}" var="ceva" varStatus="vs">
<c:set var="i" value="${vs.index}"/>




<div id="myDIV">
    <li>
<div class="container">



    <div class="mare">



        <div class="qanda2">

            <div class = "row">

                <div class ="col-md-2" style="border-right:  2px solid #eee">
                    <div class ="row">
                        <div class = "col-md-12" style="text-align: center">
                            <img src="${ceva.poza}" class="img-circle" onerror="this.src='https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg'" width="100px" height="100px" style=" margin-top: 12px;">
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

                            <form method="POST" action="/home">

                                <input type="hidden" name="emailechipa" value="${ceva.email}">
                                <input type="hidden" name="superior_full_name" value="${ceva.superior_full_name}">
                                <input type="hidden" name="last_name" value="${ceva.last_name}">
                                <input type="hidden" name="first_name" value="${ceva.first_name}">
                                <button type="submit" class="detalii">Evalueaza</button>
                            </form>


                        </div>
                    </div>
                    <div class ="row">
                        <div class = "col-md-12" style="text-align: center">

                            <c:set var="v" value="${verificareEchipa[i]}"/>
                            <c:if test="${v == 'Da'}">


                            <form method="POST" action="/echipan">
                                <input type="hidden" name="emailechipa" value="${ceva.email}">
                            <button type="submit" class="adauga" id = "diverse-button2" style = "margin-left: -11%;margin-bottom: 1%;margin-top: 2%;width: 80%;">Echipa</button>
                            </form>
                            </c:if>

                        </div>
                    </div>
                </div>

                <div class = "col-md-1" style="width: 2%;">

                </div>

                <div class = "col-md-9" style="width: 81%;height: 258px;">
                    <div class ="row">
                        <div class = "row">
                            <div class = "col-md-12" style="padding-top: 19px">
                                <label style="font-size: 17px;">Rezumat</label>
                            </div>
                        </div>
                        <div class ="row">
                           <div class = "col-md-1 right">
                               <a href="#" data-toggle="tooltip" title="Nota este: ${ceva.nota_integritate}"> <img src="integritate.png" class="img-circle" alt="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" width="70" height="70" style=" margin-top: 4px;"></a>
                           </div>
                            <div class = "col-md-1 right">
                                <a href="#" data-toggle="tooltip" title="Nota este: ${ceva.nota_pasiune}">  <img src="pasiune.png" class="img-circle" alt="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" width="70" height="70" style=" margin-top: 4px;"></a>
                            </div>
                            <div class = "col-md-1 right">
                                <a href="#" data-toggle="tooltip" title="Nota este: ${ceva.nota_respect}"> <img src="respect.png" class="img-circle" alt="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" width="70" height="70" style=" margin-top: 4px;"></a>
                            </div>
                            <div class = "col-md-1 right">
                                <a href="#" data-toggle="tooltip" title="Nota este: ${ceva.nota_colaborare}">  <img src="colaborare.png" class="img-circle" alt="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" width="70" height="70" style=" margin-top: 4px;"></a>
                            </div>
                            <div class = "col-md-1 right">
                                <a href="#" data-toggle="tooltip" title="Nota este: ${ceva.nota_discernamant}">  <img src="discernamant.png" class="img-circle" alt="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" width="70" height="70" style=" margin-top: 4px;"></a>
                            </div>
                            <div class = "col-md-1 right">
                                <a href="#" data-toggle="tooltip" title="Nota este: ${ceva.nota_simplitate}">  <img src="simplitate.bmp" class="img-circle" alt="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" width="70" height="70" style=" margin-top: 4px;"></a>
                            </div>
                            <div class = "col-md-1">
                                <a href="#" data-toggle="tooltip" title="Nota este: ${ceva.nota_invatare}">  <img src="invatare.png" class="img-circle" alt="https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg" width="70" height="70" style=" margin-top: 4px;"></a>
                            </div>
                        </div>
                        <div class="row">
                            <div class = "col-md-12">
                                <hr style="border: 0;  border-top: 3px solid #eee; margin: 20px 0;">
                            </div>
                        </div>
                        <div class ="row">
                            <div class = "col-md-2">
                            <label>Q1</label>
                            </div>
                            <div class = "col-md-2">
                                <label>Q2</label>
                            </div>
                            <div class = "col-md-2">
                                <label>Q3</label>
                            </div>
                            <div class = "col-md-2">
                                <label>Q4</label>
                            </div>
                            <div class = "col-md-2">
                                <label>Final</label>
                            </div>
                        </div>
                        <div class ="row">
                            <div class = "col-md-2">
                                <input class="form-control casuta" id="q1" name="q1" type="text"disabled value="${ceva.q1}">
                            </div>
                            <div class = "col-md-2">
                                <input class="form-control casuta" id="q2" name="q2" type="text"disabled value="${ceva.q2}">
                            </div>
                            <div class = "col-md-2">
                                <input class="form-control casuta" id="q3" name="q3" type="text"disabled value="${ceva.q3}">
                            </div>
                            <div class = "col-md-2">
                                <input class="form-control casuta" id="q4" name="q4" type="text"disabled value="${ceva.q4}">
                            </div>
                            <div class = "col-md-2">
                                <input class="form-control casuta" id="final" name="final" type="text"disabled value="${ceva.q_an}">
                            </div>
                        </div>


                    </div>

                </div>


            </div>

        </div>
    </div>



</div>
    </li>



<h2>  </h2>
</c:forEach>
</c:if>
</div>
<!-- delegare-->

<footer class="container-fluid text-center">
    <a href="#echipamea" title="To Top">
        <span class="glyphicon glyphicon-chevron-up"></span>
    </a>

</footer>

<script>
    $(document).ready(function(){
        // Add smooth scrolling to all links in navbar + footer link
        $(".navbar a, footer a[href='#echipamea']").on('click', function(event) {
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