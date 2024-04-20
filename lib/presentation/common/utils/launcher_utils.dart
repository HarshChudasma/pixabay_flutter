import 'package:url_launcher/url_launcher.dart';

class LauncherUtils {
  static Future<void> launchPhone(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
