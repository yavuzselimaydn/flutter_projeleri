import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> ilhamlar = [];
  String ilham = "";
  Map seciliKisi = {};
  String kisi = "";
  String link = "asssets/images/anonim.jpeg";
  String kisaTanitim = "";
  int i = 0;
  int j = 0;
  String hayatiLink = "https://www.linkedin.com/in/yavuz-selim-ayd%C4%B1n-186358241/?original_referer=";

  _launchURL() async {
  final Uri url = Uri.parse(hayatiLink);
  if(!await launchUrl(url, mode: LaunchMode.externalApplication )){
    throw Exception("Link bulunamadi : $url");
  }
}


  @override
  Widget build(BuildContext context) {
    //ekran bilgisini alıyorum.
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Center(
      child: Column(
        children: [
          
          //profil fotoğrafına button ekledim.
           GestureDetector(
            onTap: () => _launchURL(),
             child: Padding(
                padding: EdgeInsets.only(
                    top: ekranYuksekligi / 30, bottom: ekranYuksekligi / 150),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 3, color: Colors.teal)),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(link),
                    radius: 75,
                  ),
                ),
              ),
           ),
          
          
          //kişi ismini yazdırdım.
          Text(
            kisi,
            style: Theme.of(context).textTheme.headline6,
          ),
          
          //kısa tanitim kısmı
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              kisaTanitim,
              textAlign: TextAlign.center,
            ),
          ),
          
          const Spacer(),
          
          //ilhamın yazıldığı kısım
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 0, right: 5, left: 5),
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.only(
                  left: ekranGenisligi / 60,
                  right: ekranGenisligi / 60,
                  bottom: ekranYuksekligi / 30),
              child: Text(
                ilham,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
                selectionColor: Colors.teal),
            ),
          ),
          
          const Spacer(),
          
          //butonlar
          Row(children: [
            //ilham ver butonu
            Padding(
              padding: EdgeInsets.only(bottom: ekranYuksekligi / 50, left: 40),
              child: SizedBox(
                width: ekranGenisligi / 3,
                height: ekranYuksekligi / 15,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (j == ilhamlar.length) {
                          j = 0;
                          ilhamlar.shuffle();
                        }
                        ilham = ilhamlar[j];
                        j++;
                      });
                    },
                    child: const Text("İlham Ver")),
              ),
            ),
            
            //değiş butonu
            Padding(
              padding: EdgeInsets.only(bottom: ekranYuksekligi / 50, left: 50),
              child: SizedBox(
                width: ekranGenisligi / 3,
                height: ekranYuksekligi / 15,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (i == kisilerVeSozler.length) {
                          i = 0;
                        }
                        seciliKisi = kisilerVeSozler[i];
                        ilham = "";
                        j = 0;
                        kisi = seciliKisi["kisi"];
                        link = seciliKisi["resimYolu"];
                        ilhamlar = seciliKisi["sozleri"];
                        kisaTanitim = seciliKisi["tanitim"];
                        hayatiLink = seciliKisi["hayati"];
                        i++;
                      });
                    },
                    child: const Text("Kişiyi Değiş")),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

