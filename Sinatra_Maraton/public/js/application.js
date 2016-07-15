$(document).ready(function() {

  var num = 5
  
  $(".boton").click(function(){

    var contador = setInterval(function(){
      $("#cuenta").html(num);
      num -= 1

      if (num < 0){ 


      clearInterval(contador);
        // $(".pregunta").show(1000);
        $("#q0").show(1000)

        
      $("#envio0").submit(function(event){
        event.preventDefault();

        var res = $("#r0").val();
        var arr_respuestas = [];
        arr_respuestas.push(res)

        $("#q0").hide(1000, function(){

          $("#q1").show(1000)
          $("#envio1").submit(function(event){
            
            event.preventDefault();
            res = $("#r1").val();
            arr_respuestas.push(res)

            $("#q1").hide(1000, function(){

              $("#q2").show(1000)
              $("#envio2").submit(function(event){

                event.preventDefault();
                res = $("#r2").val();
                arr_respuestas.push(res)

                $("#q2").hide(1000, function(){
                  $("#q3").show(1000)

                  $("#envio3").submit(function(event){
                  event.preventDefault();
                  res = $("#r3").val();
                  arr_respuestas.push(res)

                  $("#q3").hide(1000, function(){
                    $("#q4").show(1000)
                    $("#envio4").submit(function(event){
                      event.preventDefault();
                      res = $("#r4").val();
                      arr_respuestas.push(res)

                      $("#q4").hide(1000, function(){

                        $("#finalizar").show(1000);

                        // console.log(arr_respuestas);
                        $("#finalizar").click(function(){
                          
                          data = 'responses='

                          for (i = 0; i < arr_respuestas.length; i++) { 
                            data += arr_respuestas[i] + ","
                          };

    //                     console.log(data);
                        
                          $.post( "/respuestas", data ,function(info) {
                            console.log(info);
                            // document.location.href = "/respuestas/" + data;
                            $(".resultado").show(1000).html(info);
                          });//envio al controlador

                        });//finalizar

                      });//quinto hide

                    });//quinto envio

                  });//cuarto hide

                });//cuarto envio


                });//tercer hide
                
              });//tercer envio

            });//segundo hide

          });//segundo envio


        });//primer hide



      });//primer envio

      }//if



    }, 1000);//setinterval
  
  });//contadorclick


});//document ready


    // $.post( url, data,function(data) {
       //    console.log(data)
       //    // console.log(res);
       //    // console.log(arr_respuestas);
       //  });

