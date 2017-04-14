$(function () {
    //rotate
    var angle1 = 0;
    var angle2 = 0;
    var angle3 = 0;
    var angle4 = 0;
    var angle5 = 0;
    var angle6 = 0;
    var angle7 = 0;
    var angle8 = 0;
    var angle9 = 0;
    var angle10 = 0;
    var ss = setInterval(function () {
        angle1 += 3;
        $("#img1").rotate(angle1);
    }, 250);
    var sa = setInterval(function () {
        angle2 += 3;
        $("#img2").rotate(angle2);
    }, 250);
    var sb = setInterval(function () {
        angle3 -= 3;
        $("#img3").rotate(angle3);
    }, 250);
    var sc = setInterval(function () {
        angle4 += 3;
        $("#img4").rotate(angle4);
    }, 250);
    var sd = setInterval(function () {
        angle5 -= 3;
        $("#img5").rotate(angle5);
    }, 250);
    var se = setInterval(function () {
        angle6 -= 3;
        $("#img6").rotate(angle6);
    }, 250);
    var sf = setInterval(function () {
        angle7 -= 3;
        $("#img7").rotate(angle7);
    }, 250);
    var sg = setInterval(function () {
        angle8 += 3;
        $("#img8").rotate(angle8);
    }, 250);
    var sh = setInterval(function () {
        angle9 -= 3;
        $("#img9").rotate(angle9);
    }, 250);
    var si = setInterval(function () {
        angle10 += 3;
        $("#img10").rotate(angle10);
    }, 250);
    $("#img1, #img2, #img3, #img4, #img5, #img6, #img7, #img8, #img9, #img10").rotate({
        bind:
          {
              mouseover: function () {
                  clearInterval(ss);
                  clearInterval(sa);
                  clearInterval(sb);
                  clearInterval(sc);
                  clearInterval(sd);
                  clearInterval(se);
                  clearInterval(sf);
                  clearInterval(sg);
                  clearInterval(sh);
                  clearInterval(si);
              },
              mouseout: function () {
                  ss = setInterval(function () {
                      angle1 += 3;
                      $("#img1").rotate(angle1);
                  }, 250);
                  sa = setInterval(function () {
                      angle2 += 3;
                      $("#img2").rotate(angle2);
                  }, 250);
                  sb = setInterval(function () {
                      angle3 -= 3;
                      $("#img3").rotate(angle3);
                  }, 250);
                  sc = setInterval(function () {
                      angle4 += 3;
                      $("#img4").rotate(angle4);
                  }, 250);
                  sd = setInterval(function () {
                      angle5 -= 3;
                      $("#img5").rotate(angle5);
                  }, 250);
                  se = setInterval(function () {
                      angle6 -= 3;
                      $("#img6").rotate(angle6);
                  }, 250);
                  sf = setInterval(function () {
                      angle7 -= 3;
                      $("#img7").rotate(angle7);
                  }, 250);
                  sg = setInterval(function () {
                      angle8 += 3;
                      $("#img8").rotate(angle8);
                  }, 250);
                  sh = setInterval(function () {
                      angle9 -= 3;
                      $("#img9").rotate(angle9);
                  }, 250);
                  si = setInterval(function () {
                      angle10 += 3;
                      $("#img10").rotate(angle10);
                  }, 250);
              }
          }
    });
});