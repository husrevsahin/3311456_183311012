import 'package:flutter/material.dart';
import 'package:mobil_uygulama/screen/istek_sikayet.dart';

class hakkinda extends StatefulWidget {
  @override
  State<hakkinda> createState() => _hakkindaState();
}

class _hakkindaState extends State<hakkinda> {
  @override
  Widget build(BuildContext context) {
    var ekrnbilgi = MediaQuery.of(context);
    final double yukseklik = ekrnbilgi.size.height;
    final double genislik = ekrnbilgi.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 17, 146, 0),
        title: Text("Hakkında"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: yukseklik / 20),
                child: SizedBox(
                  width: genislik / 2,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 17, 146, 0),
                      ),
                      child: const Text("İstek ve Şikayetleriniz için"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => istek_sikayet()));
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: genislik / 20),
                child: Text(
                    " - Bu uygulama Selçuk Üniversitesi Teknoloji Fakültesi Bilgisayar Mühendisliği Bölümü Öğrencisi tarafından Dr. Öğr. Üyesi Ahmet Cevahir Çınar önderliğinde geliştirilmiştir."),
              ),
              Padding(
                padding: EdgeInsets.only(top: genislik / 20),
                child: Text(
                    "- Bu uygulamada flutter ve dart dilleri kullanılarak geliştirilmiştir."),
              ),
              Padding(
                padding: EdgeInsets.only(top: genislik / 20),
                child: Text(
                    " - Bu uygulama genel hatlarıyla insanlar ile insanların etkileşimleri veya eğlence mekanları ile insanların etkileşiminde olmasını sağlamaktadır. "),
              ),
              Padding(
                padding: EdgeInsets.only(top: genislik / 20),
                child: Text(
                    " - Sabit ve sabit olmayan ilanlar bulunmaktadır. Sabit olmayan ilanlara örnek verecek olursak; bir kişi herhangi bir yerde ilan açacak mesela “Sahile kadar koşmak isteyen var mı?” eğer bu ilana katılmak isteyen varsa iletişime geçip bu aktiviteyi gerçekleştirebilecekler. "),
              ),
              Padding(
                padding: EdgeInsets.only(top: genislik / 20),
                child: Text(
                    " - Sabit olmayan ilanlarda ise eğlence mekanları ilan açacak. Bu ilanlar eğlence mekânında yapılan aktiviteler hakkında olacaktır. "),
              ),
              Padding(
                padding: EdgeInsets.only(top: genislik / 20),
                child: Text(
                    " - Ek olarak eğlence mekânında kaybolan eşyalarla ilgili ilan oluşturmak gibi birçok ilan çeşidi de olacaktır."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
