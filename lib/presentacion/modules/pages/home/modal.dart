import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'dart:io';

class AlertScreen extends StatelessWidget {
  VoidCallback? funcion;
  String? title;
  final String titulo;
  IconData? icon;
  Color? colorIcon;
  String? urlimagen;
  String? mensaje;
  AlertScreen(
      {Key? key,
      this.funcion,
      required this.titulo,
      this.title,
      this.icon,
      this.colorIcon,
      this.mensaje,
      this.urlimagen})
      : super(key: key);

  void mostrarAlertaIOS(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: title != null ? Text(title!) : null,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon != null
                    ? Icon(
                        icon,
                        color: colorIcon ?? Colors.black,
                        size: 64,
                      )
                    : SizedBox.shrink(),
                urlimagen != null
                    ? Image.asset(
                        urlimagen!,
                        scale: 3.2,
                      )
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  titulo,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                mensaje != null
                    ? Text(
                        mensaje!,
                        textAlign: TextAlign.center,
                      )
                    : SizedBox.shrink(),
              ],
            ),
            actions: [
              TextButton(
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if (funcion != null) {
                      funcion!();
                    }

                    Navigator.pop(context);
                    FocusScope.of(context).unfocus();
                  })
            ],
          );
        });
  }

  void mostrarAlertaAndroid(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        barrierColor: Color.fromARGB(127, 0, 0, 0),
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: title != null ? Text(title!) : null,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon != null
                    ? Icon(
                        icon,
                        color: colorIcon ?? Colors.black,
                        size: 64,
                      )
                    : SizedBox.shrink(),
                urlimagen != null
                    ? Image.asset(
                        urlimagen!,
                        scale: 3.2,
                      )
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  titulo,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                mensaje != null
                    ? Text(
                        mensaje!,
                        textAlign: TextAlign.center,
                      )
                    : SizedBox.shrink(),
              ],
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              TextButton(
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if (funcion != null) {
                      funcion!();
                    }

                    Navigator.pop(context);
                    Navigator.pop(context);
                    FocusScope.of(context).unfocus();
                  })
            ],
          );
        });
  }

  void mostrarAlerta(BuildContext context) {
    if (Platform.isIOS) {
      mostrarAlertaIOS(context);
    } else {
      mostrarAlertaAndroid(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    mostrarAlerta(context);
    return Container();
  }
}
