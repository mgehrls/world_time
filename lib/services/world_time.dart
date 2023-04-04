import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String flag;
  String url;
  late String time;
  bool isDaytime = false; //true of false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data. please retry.';
    }
  }
}
