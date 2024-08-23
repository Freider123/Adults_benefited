import 'package:consulta_adulto_mayor/article_injetion.dart';
import 'package:consulta_adulto_mayor/presentacion/bloc/adultos/bloc/adult_bloc.dart';
import 'package:consulta_adulto_mayor/presentacion/modules/pages/home/fondo.dart';
import 'package:consulta_adulto_mayor/presentacion/modules/pages/home/modal.dart'
    as w;
import 'package:consulta_adulto_mayor/presentacion/modules/shared/widgets/button-primary.dart';
import 'package:consulta_adulto_mayor/presentacion/modules/shared/widgets/icon-text.dart';
import 'package:consulta_adulto_mayor/presentacion/modules/shared/widgets/input-text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext contenxt) {
    return BlocProvider(
      create: (contenxt) => AdultBloc(sl()),
      child: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => HomeState();
}

class HomeState extends State<HomeView> {
  final cedulaController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color colorRedes = Color.fromARGB(255, 255, 255, 255);
    return SafeArea(
        child: Scaffold(
      body: BlocListener<AdultBloc, AdultState>(
        listener: (context, state) {
          if (state is GetAdultByIdErrorState) {
            // Navigator.pop(context);
            print("no data");
            w.AlertScreen(
              titulo: 'Lo siento',
              // title: 'ahola',
              urlimagen: "assets/triste.png",
              mensaje:
                  "El numero de cedula ingresado no se encuentra benediciado",
            ).mostrarAlerta(context);
          }

          // if (state is LoadingGetLoanByIdState) {
          //   loading();
          // }

          if (state is GetAdultByIdSuccessState) {
            // Navigator.pop(context);
            final datos = state.responsePages;
            print("datos ${datos[0].primernombre}");
            w.AlertScreen(
                    titulo: 'Felicadades',
                    // title: 'ahola',
                    // icon: Icons.alternate_email_outlined,
                    // colorIcon: Colors.amber,
                    mensaje:
                        "${datos[0].primernombre} ${datos[0].segundonombre}",
                    urlimagen: "assets/party.png")
                .mostrarAlerta(context);
          }
        },
        child: BlocBuilder<AdultBloc, AdultState>(
          builder: (BuildContext context, AdultState state) {
            return Stack(
              children: [
                Fondo(),
                Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.37,
                                  width: double.infinity,
                                  child: Image.asset(
                                      "assets/Logo_Prosperidad_Social.png"),
                                ),
                                InputTextCustom(
                                  keyboardType: TextInputType.number,
                                  isRequired: true,
                                  hintText: "Cedula de ciudadania",
                                  controller: cedulaController,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                ButtonPrimaryCustom(
                                    text: "Consultar",
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    onPressed: () {
                                      setState(() {});
                                      if (_formKey.currentState!.validate()) {
                                        print("boton");
                                        FocusScope.of(context).unfocus();
                                        final event = GetLoanByIdEvent(
                                            cedula: cedulaController.text);
                                        context.read<AdultBloc>().add(event);
                                      }
                                      setState(() {});
                                    }),
                              ],
                            )),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconText(
                          texto: 'Facebook',
                          icono: FaIcon(
                            FontAwesomeIcons.facebook,
                            color: colorRedes,
                          ),
                          color: colorRedes,
                          urlApp:
                              "https://www.facebook.com/profile.php?id=61561925007498",
                        ),
                        IconText(
                          texto: 'Instagram',
                          icono: FaIcon(
                            FontAwesomeIcons.instagram,
                            color: colorRedes,
                          ),
                          color: colorRedes,
                          urlApp: 'https://www.instagram.com/simasoftw/',
                        ),
                        IconText(
                          texto: 'whassapp',
                          icono: FaIcon(
                            FontAwesomeIcons.whatsapp,
                            color: colorRedes,
                          ),
                          color: colorRedes,
                          urlApp:
                              'whatsapp://send?phone=3052237829&text=hola como estas',
                        )
                      ],
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    ));
  }

  void loading() {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
  }
}
