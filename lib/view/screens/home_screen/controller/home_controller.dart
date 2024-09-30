import 'package:get/get.dart';
import 'package:translator_plus/translator_plus.dart';

class HomeController extends GetxController {
  GoogleTranslator translator = GoogleTranslator();
  RxString leftLanguage = "English".obs;
  RxString fromLanguage = 'en'.obs;
  RxString rightLanguage = "Bangla".obs;
  RxString toLanguage = 'bn'.obs;
  RxString inputText = ''.obs;
  RxString translatedText = ''.obs;

  //==========================Swap Language==================================//
  void swapLanguages() {
    String tempCode = leftLanguage.value;
    String tempLang=fromLanguage.value;
    leftLanguage.value = rightLanguage.value;
    fromLanguage.value=toLanguage.value;
    rightLanguage.value = tempCode;
    toLanguage.value=tempLang;
  }

  //=========================Translated Function==========================//
  void translate() async {
    if (inputText.value.isNotEmpty) {
      print("============print success");


      var translation = await translator.translate(
        inputText.value,
        from: fromLanguage.value,
        to: toLanguage.value,
      );
      translatedText.value = translation.text;
      print("============print success");
    }
    print("============print failed");
  }
}
