import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:translator_plus/translator_plus.dart';

class HomeController extends GetxController {
  GoogleTranslator translator = GoogleTranslator();
  FlutterTts flutterTts = FlutterTts();
  TextEditingController userInputcontroller=TextEditingController();
  stt.SpeechToText speechToText = stt.SpeechToText();
  RxString leftLanguage = "English".obs;
  RxString fromLanguage = 'en'.obs;
  RxString rightLanguage = "Bangla".obs;
  RxString toLanguage = 'bn'.obs;
  RxString inputText = ''.obs;
  RxString translatedText = ''.obs;
  RxBool isSpeaking = false.obs;
  RxBool isListening = false.obs;

  //==========================Swap Language==================================//
  void swapLanguages() {
    String tempCode = leftLanguage.value;
    String tempLang = fromLanguage.value;
    leftLanguage.value = rightLanguage.value;
    fromLanguage.value = toLanguage.value;
    rightLanguage.value = tempCode;
    toLanguage.value = tempLang;
  }

  //=========================Translated Function==========================//
  void translate() async {
    if (inputText.value.isNotEmpty) {
      var translation = await translator.translate(
        inputText.value,
        from: fromLanguage.value,
        to: toLanguage.value,
      );
      translatedText.value = translation.text;
    }
  }

  //========================Clear Tect ===================================//

  void clearText() {
    userInputcontroller.clear();
    inputText.value = '';
    translatedText.value = '';
  }

  //====================== speech to text================================//

  void startListening(String fromLanguage) async {
    bool available = await speechToText.initialize();
    if (available) {
      isListening.value = true;
      speechToText.listen(
        onResult: (result) {
          inputText.value = result.recognizedWords;
          userInputcontroller.text = result.recognizedWords;
        },
        localeId: fromLanguage == 'bn' ? 'bn_BD' : 'en_US',
      );
    }
  }

  void stopListening() {
    speechToText.stop();
    isListening.value = false;  // Stop listening
  }

  //==========================text to speach==============================//

  void textToSpeach() async {
    if (isSpeaking.value) {
      await flutterTts.stop();
      isSpeaking.value = false;
    } else {
      if (translatedText.isNotEmpty) {
        await flutterTts.setLanguage(
            toLanguage.value == 'bn' ? 'bn-BD' : 'en-US'); // Set language
        await flutterTts.speak(translatedText.value);
        isSpeaking.value = true;
      }
    }
  }

  //=======================Copy Clipboard =============================//

  void copyToClipboard() {
    if (translatedText.isEmpty) {
      Fluttertoast.showToast(msg: "Text is Empty..");
    } else {
      Clipboard.setData(ClipboardData(text: translatedText.value));
      Fluttertoast.showToast(msg: "Copy successful");
    }
  }

  //=====================share translated text=========================//
  void shareTranslatedText() {
    if (translatedText.isEmpty) {
      Fluttertoast.showToast(msg: "Text is empty");
    } else {
      Share.share(translatedText.value);
    }
  }

  //=================================onInit=============================//
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    flutterTts.setCompletionHandler(() {
      isSpeaking.value = false;
    });
  }
}
