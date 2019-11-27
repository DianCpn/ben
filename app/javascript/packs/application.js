import "bootstrap";
import "quagga";
import "../plugins/quagga";
import "jquery"

Quagga.init({
    inputStream : {
      name : "Live",
      type : "LiveStream",
      target: document.querySelector('#barcode-scanner'),    // Or '#yourElement' (optional)
      constraints: {
        width: {min: 640},
        height: {min: 480},
        aspectRatio: {min: 1, max: 100},
        facingMode: "environment" // or "user" for the front camera
      },
      locator: {
        patchSize: "medium",
        halfSample: true
      },
      numOfWorkers: (navigator.hardwareConcurrency ? navigator.hardwareConcurrency : 4),
    },
    decoder : {
      readers : ['ean_reader', 'ean_8_reader'],
      locate: true
    }
  }, function(err) {
      if (err) {
          console.log(err);
          return
      }
      console.log("Initialization finished. Ready to start");
      Quagga.start();
  });

  // Make sure, QuaggaJS draws frames an lines around possible
  // barcodes on the live stream
  Quagga.onProcessed(function(result) {
    var drawingCtx = Quagga.canvas.ctx.overlay,
      drawingCanvas = Quagga.canvas.dom.overlay;

    if (result) {
      if (result.boxes) {
        drawingCtx.clearRect(0, 0, parseInt(drawingCanvas.getAttribute("width")), parseInt(drawingCanvas.getAttribute("height")));
        result.boxes.filter(function (box) {
          return box !== result.box;
        }).forEach(function (box) {
          Quagga.ImageDebug.drawPath(box, {x: 0, y: 1}, drawingCtx, {color: "green", lineWidth: 2});
        });
      }

      if (result.box) {
        Quagga.ImageDebug.drawPath(result.box, {x: 0, y: 1}, drawingCtx, {color: "#00F", lineWidth: 2});
      }

      if (result.codeResult && result.codeResult.code) {
        Quagga.ImageDebug.drawPath(result.line, {x: 'x', y: 'y'}, drawingCtx, {color: 'red', lineWidth: 3});
      }
    }
  });

  // Once a barcode had been read successfully, stop quagga and
  // close the modal after a second to let the user notice where
  // the barcode had actually been found.
  Quagga.onDetected(function(result) {
    if (result.codeResult.code){
      $('#product_upc').val(result.codeResult.code);
      Quagga.stop();
      $("#edit_account").submit();
      setTimeout(function(){ $('#livestream_scanner').modal('hide'); }, 1000);
    }

  });

  // const upcField = document.getElementById('product_upc')
  //   console.log(upcField)
  //   upcField.addEventListener('blur', (event) =>{
  //     //
  //     console.log(event);
  //   });

  // Stop quagga in any case, when the modal is closed
    // $('#livestream_scanner').on('hide.bs.modal', function(){
    //   if (Quagga){
    //     Quagga.stop();
    //   }
    // });

  // Call Quagga.decodeSingle() for every file selected in the
  // file input
  // $("#livestream_scanner input:file").on("change", function(e) {
  //   if (e.target.files && e.target.files.length) {
  //     Quagga.decodeSingle($.extend({}, fileConfig, {src: URL.createObjectURL(e.target.files[0])}), function(result) {alert(result.codeResult.code);});
  //   }
  // });
// });




