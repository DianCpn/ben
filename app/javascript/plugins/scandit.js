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
      vibrateOnScan: true
    }).then(function(barcodePicker) {
      // barcodePicker is ready here to be used (rest of the tutorial code should go here)
      var scanSettings = new ScanditSDK.ScanSettings({
      enabledSymbologies: ["ean8", "ean13", "upca", "upce", "code128", "code39", "code93", "itf"],
      codeDuplicateFilter: 1000
      });
      barcodePicker.applyScanSettings(scanSettings);
      // Note that enumeration variables for symbologies are recommended to be used instead (strings are used here for brevity)

      // action on to be returned on successful scan
      barcodePicker.on("scan", function(scanResult) {
        // scanResult = {barcodes: [{symbology: "ean13", data: "34344456"}]}
        const ean = scanResult.barcodes[0].data
        console.log("found ean is ", ean);
        document.getElementById('product_upc').value = ean;
        document.getElementById("edit_account").submit();
      });

    });
  }


}

export { initScandit }
