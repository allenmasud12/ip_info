import 'dart:convert';

import 'package:http/http.dart' as http;

class IpData {
  static Future<String> getMyIpAddress() async {
    try {
      http.Response res =
      await http.get(Uri.parse("https://api.ipify.org/?format=json"));

      if (res.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(res.body);
        print(responseData);
        return responseData["ip"];
      } else {
        print("Failed to get IP address. Status code: ${res.statusCode}");
        return '';
      }
    } catch (e) {
      print("Error occurred while getting IP address: $e");
      return '';
    }
  }

  static Future<Map<String, dynamic>> getIpInformation(String ipAddress) async {
    try {
      http.Response res =
      await http.get(Uri.parse("https://ipinfo.io/$ipAddress/geo"));

      if (res.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(res.body);
        print(responseData);
        return responseData;
      } else {
        print("Failed to get IP information. Status code: ${res.statusCode}");
        return {};
      }
    } catch (e) {
      print("Error occurred while getting IP information: $e");
      return {};
    }
  }
}
