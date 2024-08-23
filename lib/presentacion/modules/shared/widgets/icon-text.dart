import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class IconText extends StatefulWidget {
  final String texto;
  final FaIcon icono;
  Color? color;
  String? urlApp;

  IconText({
    super.key,
    required this.texto,
    required this.icono,
    this.color,
    this.urlApp,
  });

  @override
  State<IconText> createState() => _IconTextState();
}

class _IconTextState extends State<IconText> {
  void _launchURL(Uri uri, bool inApp) async {
    try {
      if (inApp) {
        await launchUrl(uri, mode: LaunchMode.inAppWebView);
      } else {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: () {
            if (widget.urlApp != null)
              _launchURL(Uri.parse(widget.urlApp!), false);
          },
          child: Row(
            children: [
              widget.icono,
              SizedBox(
                width: 5,
              ),
              Text(
                widget.texto,
                style: TextStyle(
                    fontSize: 13, color: widget.color ?? Colors.white),
              )
            ],
          )),
    );
  }
}
