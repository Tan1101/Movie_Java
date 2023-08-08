<%-- 
    Document   : productDetail
    Created on : May 20, 2023, 5:37:55 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../stylesheet/productDetail.css">
        <link
            href="https://fonts.googleapis.com/css2?family=Alegreya&family=MuseoModerno:wght@200;300;400;500;600;800;900&family=Open+Sans:ital,wght@0,300;1,300&display=swap"
            rel="stylesheet">
        <link rel=”stylesheet” href=”https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css”> <script
        src=”https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js”></script> <script
        src=”https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js”></script> <script
        src=”https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js”></script> <!-- Load an icon
        library -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Alegreya&family=MuseoModerno:wght@200;300;400;500;600;800;900&family=Open+Sans:ital,wght@0,300;1,300&family=Oxygen:wght@300;400;700&display=swap" rel="stylesheet">

        <style type="text/css">

            body {

                margin: 0;

                padding: 0;

                font-family: 'Roboto Condensed', sans-serif;

            }

            /* Overlay Styles */

            .overlay {

                background: rgba(0, 0, 0, 0.8);

                opacity: 0.8;

                filter: alpha(opacity=80);

                position: absolute;

                top: 0px;

                bottom: 0px;

                left: 0px;

                right: 0px;

                z-index: 100;

            }

            /* Popup */

            .popup {

                background: white;

                position: absolute;

                top: 0;

                left: 0;

                bottom: 0;

                right: 0;

                z-index: 101;

                width: 500px;

                /*Change your width here*/

                height: 200px;

                /*Change your height here*/

                margin: auto;

                /* Popup Inner */

            }

            @media (max-width: 768px) {

                .popup {

                    width: 90%;

                    margin: auto 5%;

                }

            }

            .popup .popup-inner {

                position: relative;

                padding: 1em;

            }

            .popup .popup-inner input.s3-btn-close {

                position: absolute;

                top: -0.5em;

                right: -0.5em;

                background: black;

                border: solid 2px white;

                color: white;

                cursor: pointer;

                border-radius: 15px;

                outline: none;

            }

            /*************
                    
            S3 Button
                    
            *************/

            input.s3-btn {

                background: #4E92DF;

                border: 2px solid black;

                width: 30%;

                height: 40px;

                cursor: pointer;

                top: 0;

                color: white;

                right: 0;

                bottom: 0;

                left: 0;

                margin: auto;

                font-size: 18pt;



            }

            .s3-center {

                text-align: center;

            }

        </style>

    </head> 
    <body>
        <jsp:include page="../components/Menu.jsp"></jsp:include>
            <section class="container sproduct my-2 pt-2">
                <div class="row mt-3 d-flex justify-content-center">
                    <div class="col-lg-4 col-md-12 col-12">

                        <div class="small-img-group ">
                            <img src="../${movie.img}" width="75%" class="small-img" alt="">

                    </div>

                    <div>
                        <br>
                        <!-- Overlay -->
                        <div class="overlay" id="overlay" style="display:none;"></div>
                        <!-- Popup -->
                        <div class="popup" id="popup" style="display:none;">
                            <div class="popup-inner">
                                <input type="button" name="Close" class="s3-btn-close" onclick="popupClose();" value="×">
                                <h2>Hello</h2>
                                <p>Welcom to welfilm</p>
                                <form action="movieDetail" method="post">
                                    <input hidden value="${movie.id}" name="id">
                                    <button class="btn" name="ok" style="border: 2px solid black;" type="submit"> <h4>OK</h4>
                                    </button>
                                </form>
                            </div>
                        </div>

                        <!-- Popup Button -->

                        <input type="button" class="s3-btn" name="Open" onclick="popupOpen();" value="WATCH">

                    </div>
                    <br>
                    <!-- UPDATE -->
                    <c:if test="${sessionScope.account.role=='admin'}">
                        <form action="updateMovie" method="get">
                            <input hidden value="${movie.id}" name="id">
                            <input type="submit" class="s3-btn"  name="update" value="UPDATE">

                            </button>
                        </form>
                        <br><!-- comment -->


                        <!-- DELETE -->
                        <div class="overlay" id="overlay1" style="display:none;"></div>
                        <!-- Popup -->
                        <div class="popup" id="popup1" style="display:none;">
                            <div class="popup-inner">
                                <input type="button" name="Close" class="s3-btn-close" onclick="popup1Close();" value="×">
                                <h2>Hello</h2>
                                <p>DO YOU WANT DELETE THIS FILM???</p>
                                <form action="movieDetail" method="post">
                                    <input hidden value="${movie.id}" name="id">
                                    <button class="btn" name="delete" style="border: 2px solid black; " type="submit"> <h4>DELETE</h4>
                                    </button>
                                </form>
                            </div>
                        </div>

                        <!-- Popup Button -->

                        <input type="button" style="background: red" class="s3-btn" name="Open" onclick="popup1Open();" value="DELETE">

                    </c:if>
                </div>
                <div class="col-lg-4 col-md-12 col-12">
                    <h1 style="color:red" class="">${movie.name}</h1>
                    <h3 class="py-2">RELEASED: ${movie.year}</h3>
                    <c:forEach items="${listc}" var="c">
                        <c:if test="${c.caID==movie.caID}">
                            <h3>MOVIE: ${c.caName}</h3>
                        </c:if>
                    </c:forEach>
                    <h4><b>${movie.view} view</b></h4>
                    <hr />
                    <p>${movie.description}</p>

                </div>
                <br><!-- comment -->
                <br>
                <div>
                    <h2>COMMENTS</h2>
                    
                        <c:forEach items="${c}" var="c">
                        <h5>${c.name}  (${c.date})</h5>

                        ${c.comment}
                        
                        <form action="movieDetail" method="post">
                            <input hidden value="${movie.id}" name="id">
                            <input hidden value="${c.id}" name="cid">
                            <input hidden value="${sessionScope.account.name}" name="name">
                            <input type="text" name="cmtt">
                            <input type="submit" name="cmt" value="Reply">
                        </form> 
                    </c:forEach>
                        <br>
                        <br>
                        
                    <form action="movieDetail" method="post">
                        <input hidden value="${movie.id}" name="id">
                        <input hidden value="${sessionScope.account.name}" name="name">
                        <input type="text" name="cmt">
                        <input type="submit" name="comment" value="comment">
                    </form> 
                </div>
            </div>
        </section>
        <jsp:include page="../components/Footer.jsp"></jsp:include>
        <script>

// Popup Open

            function popupOpen() {

                document.getElementById("popup").style.display = "block";

                document.getElementById("overlay").style.display = "block";

            }

// Popup Close

            function popupClose() {

                document.getElementById("popup").style.display = "none";

                document.getElementById("overlay").style.display = "none";

            }

            function popup1Open() {

                document.getElementById("popup1").style.display = "block";

                document.getElementById("overlay1").style.display = "block";

            }

// Popup Close

            function popup1Close() {

                document.getElementById("popup1").style.display = "none";

                document.getElementById("overlay1").style.display = "none";

            }

        </script>
    </body>
