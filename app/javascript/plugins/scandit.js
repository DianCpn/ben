import * as ScanditSDK from "scandit-sdk";

const initScandit = () => {
  const barcodeTrigger = document.getElementById("scandit-barcode-picker");
  if (barcodeTrigger) {
    ScanditSDK.configure(
      barcodeTrigger.dataset.apiKey,
      {engineLocation: "https://cdn.jsdelivr.net/npm/scandit-sdk/build"}
    )

    ScanditSDK.BarcodePicker.create(barcodeTrigger, {
      playSoundOnScan: false,
      vibrateOnScan: true,
      guiStyle: ScanditSDK.BarcodePicker.GuiStyle.NONE,
    }).then(function(barcodePicker) {
      // barcodePicker is ready here to be used (rest of the tutorial code should go here)
      var scanSettings = new ScanditSDK.ScanSettings({
      blurryRecognition: true,
      gpuAcceleration: true,
      enabledSymbologies: ["ean13"],
      codeDuplicateFilter: 4000
      });
      barcodePicker.applyScanSettings(scanSettings);
      // Note that enumeration variables for symbologies are recommended to be used instead (strings are used here for brevity)

      // action on to be returned on successful scan
      barcodePicker.on("scan", function(scanResult) {
        // scanResult = {barcodes: [{symbology: "ean13", data: "34344456"}]}
        const ean = scanResult.barcodes[0].data
        // on fait un fetch pour afficher la modal
        fetch(
          "/products",
          {
            method: "POST",
            headers: {
              'Content-Type': 'application/json',
              'X-CSRF-Token': document.getElementById("authenticity-token").value
            },
            body: JSON.stringify({product: {upc: ean}})
          }
        ).then(response => response.json()).
          then(data => {
            document.
              getElementById("scan-result-modal-placeholder").
              innerHTML = data.modal_html;
            $("#scan-result").modal();
          })
      });
    });
  }
}



export { initScandit }

