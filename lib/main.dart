import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: Locale('en','US'),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello World',
    },
    'hi_IN': {
      'hello': 'नमस्ते दुनिया',
    }
  };
}


class LocaleString extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    //ENGLISH LANGUAGE
    'en_US':{
      'hello':'Hello World',
      'message':'Welcome to Proto Coders Point',
      'title':'Flutter Language - Localization',
      'sub':'Subscribe Now',
      'changelang':'Change Language'
    },
    //HINDI LANGUAGE
    'hi_IN':{
      'hello': 'नमस्ते दुनिया',
      'message':'प्रोटो कोडर प्वाइंट में आपका स्वागत है',
      'title':'स्पंदन भाषा - स्थानीयकरण',
      'subscribe':'सब्सक्राइब',
      'changelang':'भाषा बदलो'
    },
    //KANNADA LANGUAGE
    'kn_IN':{
      'hello': 'ಹಲೋ ವರ್ಲ್ಡ್',
      'message':'ಪ್ರೋಟೋ ಕೋಡರ್ ಪಾಯಿಂಟ್‌ಗೆ ಸುಸ್ವಾಗತ',
      'title':'ಬೀಸು ಭಾಷೆ - ಸ್ಥಳೀಕರಣ',
      'subscribe':'ವಂತಿಗೆ ಕೊಡು',
      'changelang':'ಭಾಷೆ ಬದಲಿಸಿ'
    }
  };
}

class HomePage extends StatelessWidget {
  final List locale =[
    {'name':'ENGLISH','locale': Locale('en','US')},
    {'name':'ಕನ್ನಡ','locale': Locale('kn','IN')},
    {'name':'हिंदी','locale': Locale('hi','IN')},
  ];
  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }
  buildLanguageDialog(BuildContext context){
    showDialog(context: context,
        builder: (builder){
          return AlertDialog(
            title: Text('Choose Your Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(child: Text(locale[index]['name']),onTap: (){
                        print(locale[index]['name']);
                        updateLanguage(locale[index]['locale']);
                      },),
                    );
                  }, separatorBuilder: (context,index){
                return const Divider(
                  color: Colors.blue,
                );
              }, itemCount: locale.length
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('title'.tr),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hello'.tr,style: const TextStyle(fontSize: 15),),
            const SizedBox(height: 10,),
            Text('message'.tr,style: const TextStyle(fontSize: 20),),
            const SizedBox(height: 10,),
            Text('subscribe'.tr,style: const TextStyle(fontSize: 20),),

            ElevatedButton(onPressed: (){
              buildLanguageDialog(context);
            }, child: Text('changelang'.tr)),
          ],
        )
    );
  }
}