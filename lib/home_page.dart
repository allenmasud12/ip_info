import 'package:flutter/material.dart';
import 'package:ip_info_app/button.dart';
import 'package:ip_info_app/data/ip_data.dart';
import 'package:ip_info_app/info_Text.dart';
import 'package:ip_info_app/title_text.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController ipInputController = TextEditingController();

  String ipAddress = 'NO IP';
  String city = "none";
  String region = "none";
  String country = "none";
  String latitude = "none";
  String operator = "none";
  String postal = "none";
  String timeZone = "none";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png")),
            color: Color(0xff0F0817),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/lock_img.png",
                height: 180,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  controller: ipInputController,
                  decoration: InputDecoration(
                      hintText: "      Example: 192.168.0.1",
                      hintStyle:
                      TextStyle(color: Colors.grey.shade600, fontSize: 20.0),
                      fillColor: Color(0xff1E133E),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                        text: "My IP",
                        icon: Image.asset('assets/images/myip.png',
                            width: 30.0, color: Color(0xff0F0817)),
                        onPressed: () async {
                          String? ip = await IpData.getMyIpAddress();
                          ipInputController.text = ip!;
                          setState(() {
                            ipAddress = ip;
                          });
                        }),
                    SizedBox(
                      width: 20,
                    ),
                    Button(
                      text: "Get Info",
                      icon: Image.asset('assets/images/get.png',
                          width: 26.0, color: Color(0xff0F0817)),
                      onPressed: () async {
                        Map ipinfo =
                        await IpData.getIpInformation(ipInputController.text);
                          setState(() {
                            city = ipinfo["city"];
                            region = ipinfo["region"];
                            country = ipinfo["country"];
                            latitude = ipinfo["loc"];
                            operator = ipinfo["org"];
                            postal = ipinfo["postal"];
                            timeZone = ipinfo["timezone"];
                          });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: Column(
                  children: [
                    Text(
                      "Information About The IP",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    Text(
                      "${ipAddress}",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TitleText(text: "City"),
                      TitleText(text: "Region"),
                      TitleText(text: "Country"),
                      TitleText(text: "Latitude"),
                      TitleText(text: "Operator"),
                      TitleText(text: "Postal Code"),
                      TitleText(text: "Time Zone"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoText(text: "${city}"),
                      InfoText(text: "${region}"),
                      InfoText(text: "${country}"),
                      InfoText(text: "${latitude}"),
                      InfoText(text: "${operator}"),
                      InfoText(text: "${postal}"),
                      InfoText(text: "${timeZone}"),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
