import 'package:get/get.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class HomeController extends GetxController{
  RxInt languageIndex = 0.obs;
  RxString selectedLan = "Telugu".obs;
  Rx<PdfController> pdfController = PdfController(document:  PdfDocument.openAsset('asset/pdffiles/pdf1.pdf'),).obs;

  int getLanguageIndex(){
    return languageIndex.value;
  }

  setLanguageIndex(int value){
    languageIndex.value = value;
  }

  String getSelectedLanguage(){
    return selectedLan.value;
  }

  setSelectedLanguage(String value){
    selectedLan.value = value;
  }

  PdfController getPdfController(){
    return pdfController.value;
  }

  setPdfController(PdfController value){
    pdfController.value = value;
  }
}