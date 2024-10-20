import 'package:url_launcher/url_launcher.dart';

class OpenLauncher {
  static Future<void> onOpenLauncher(String url) async {
    Uri urlPath = Uri.parse(url);
    if (await canLaunchUrl(urlPath)) {
      await launchUrl(urlPath);
    } else {
      throw 'Could not launch $urlPath';
    }
  }
}
