<%--
  Created by IntelliJ IDEA.
  User: c026nenua
  Date: 09.10.2017
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>iPerform</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <%--  api google --%>
  <script defer src="https://apis.google.com/js/platform.js"></script>
  <script defer src="https://code.getmdl.io/1.2.1/material.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
  <script src="https://apis.google.com/js/api:client.js"></script>

  <style>
    body, html {
      background: #f0f0f0 url("caluti.png");
      background-repeat: no-repeat;
      background-position: center;

    }
    .card-container.card {
      max-width: 350px;
      padding: 40px 40px;
    }

    .btn {
      font-weight: 700;
      height: 36px;
      -moz-user-select: none;
      -webkit-user-select: none;
      user-select: none;
      cursor: default;
    }

    /*
     * Card component
     */
    .card {

      /* just in case there no content*/
      padding: 20px 25px 30px;
      margin: 0 auto 25px;
      margin-top: 50px;
      /* shadows and rounded borders */
      -moz-border-radius: 2px;
      -webkit-border-radius: 2px;
      border-radius: 2px;
      -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
      -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
      box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    }

    .profile-img-card {
      width: 96px;
      height: 96px;
      margin: 0 auto 10px;
      display: block;
      -moz-border-radius: 50%;
      -webkit-border-radius: 50%;
      border-radius: 50%;
    }

    /*
     * Form styles
     */
    .profile-name-card {
      font-size: 16px;
      font-weight: bold;
      text-align: center;
      margin: 10px 0 0;
      min-height: 1em;
    }

    .reauth-email {
      display: block;
      color: #404040;
      line-height: 2;
      margin-bottom: 10px;
      font-size: 14px;
      text-align: center;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      -moz-box-sizing: border-box;
      -webkit-box-sizing: border-box;
      box-sizing: border-box;
    }


    .btn.btn-signin {
      /*background-color: #4d90fe; */
      background-color: rgb(104, 145, 162);
      /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
      padding: 0px;
      font-weight: 700;
      font-size: 14px;
      height: 36px;
      -moz-border-radius: 3px;
      -webkit-border-radius: 3px;
      border-radius: 3px;
      border: none;
      -o-transition: all 0.218s;
      -moz-transition: all 0.218s;
      -webkit-transition: all 0.218s;
      transition: all 0.218s;
    }

    .btn.btn-signin:hover,
    .btn.btn-signin:active,
    .btn.btn-signin:focus {
      background-color: rgb(12, 97, 33);
    }

    .forgot-password {
      color: rgb(104, 145, 162);
    }

    .forgot-password:hover,
    .forgot-password:active,
    .forgot-password:focus{
      color: rgb(12, 97, 33);
    }
    .md-card{
      box-shadow: 0px 1px 3px 0px rgba(0, 0, 0, 0.2), 0px 1px 1px 0px rgba(0, 0, 0, 0.14), 0px 2px 1px -1px rgba(0, 0, 0, 0.12);
      background-color: white;

    }

  </style>

  <script>

      var googleUser = {};
      var startApp = function() {
          gapi.load('auth2', function(){
              // Retrieve the singleton for the GoogleAuth library and set up the client.
              auth2 = gapi.auth2.init({
                  client_id: '456073198539-38b0qqaha5ndl9uknuqcukft8uv7gv4a.apps.googleusercontent.com',
                  cookiepolicy: 'single_host_origin',
                  // Request scopes in addition to 'profile' and 'email'
                  //scope: 'additional_scope'
              });
              attachSignin(document.getElementById('customBtn'));
          });

      };

      function attachSignin(element) {
          // console.log(element.id);
          auth2.attachClickHandler(element, {},
              function(googleUser) {
                  var profile = googleUser.getBasicProfile();
                  console.log('ID: ' + profile.getId());
                  console.log('Name: ' + profile.getName());
                  console.log('Image URL: ' + profile.getImageUrl());
                  console.log('Email: ' + profile.getEmail());
                  console.log('id_token: ' + googleUser.getAuthResponse().id_token);

                  //do not post above info to the server because that is not safe.
                  //just send the id_token

                  var redirectUrl = '/login';
                  //using jquery to post data dynamically
                  var form = $('<form action="' + redirectUrl + '" method="post">' +
                      '<input type="hidden" name="id_token" value="' +
                      googleUser.getAuthResponse().id_token + '" />' +
                      '<input type="hidden" name="email" value="' +
                      profile.getEmail() + '" />' +
                      '<input type="hidden" name="Name" value="' +
                      profile.getName() + '" />' +

                      '<input type="hidden" name="poza" value="' +
                      profile.getImageUrl() + '" />' +
                      '</form>');
                  $('body').append(form);
                  form.submit();
              }, function(error) {
                  alert(JSON.stringify(error, undefined, 2));
              });

      }



  </script>







</head>
<body>


<div class="container" style="padding-top: 13%">
  <div class="card card-container md-card">


    <div class="panel-heading"><img src="iPerformLogo.png" style="height: 56px;padding-left: 40px;"></div>
    <div class="panel-body" style="padding-left: 68px;">


      <b>iPerform</b>

      <button onclick="startApp()" a href="/editInregistrari" id ="customBtn" class="btn btn-default"  >Sign in </button>




    </div>



  </div><!-- /container -->




</div>
</body>
</html>
