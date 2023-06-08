import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'myhomepage.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("İlham Ver"),
          actions: [popUpMenu()],
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

PopupMenuButton<String> popUpMenu() {
  return PopupMenuButton(
      itemBuilder: ((context) => [
            const PopupMenuItem(
              value: "Yardim",
              onTap: _launchURL,
              child: Text("Yardim"),
            ),
            PopupMenuItem(
              value: "Çikiş",
              child: const Text("Çikiş"),
              onTap: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ]));
}

_launchURL() async {
  final Uri url = Uri.parse("https://www.instagram.com/yavuzselimaydn6/");
  if(!await launchUrl(url, mode: LaunchMode.externalApplication )){
    throw Exception("Link bulunamadi : $url");
  }
}
