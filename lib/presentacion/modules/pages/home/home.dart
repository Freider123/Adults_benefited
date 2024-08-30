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
            print("no data");
            w.AlertScreen(
              titulo: 'Lo siento',
              // title: 'ahola',
              urlimagen: "assets/triste.png",
              mensaje:
                  "El numero de cedula ingresado no se encuentra benediciado",
            ).mostrarAlerta(context);
          }

          if (state is LoadingGetLoanByIdState) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => Center(
                      child: CircularProgressIndicator(),
                    ));
          }

          if (state is GetAdultByIdSuccessState) {
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
                Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                width: double.infinity,
                                color: Colors.amber,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Colombia Mayor",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Consulta si eres beneficiario al sucidio Colombia adulto mayor",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Ingrese su número de identifícacion",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    InputTextCustom(
                                      keyboardType: TextInputType.number,
                                      isRequired: true,
                                      hintText: "Cedula de ciudadania",
                                      controller: cedulaController,
                                      borderColor: Colors.amber,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ButtonPrimaryCustom(
                                        text: "Consultar",
                                        color: Colors.amber,
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                          if (_formKey.currentState!
                                              .validate()) {
                                            final event = GetLoanByIdEvent(
                                                cedula: cedulaController.text);
                                            context
                                                .read<AdultBloc>()
                                                .add(event);
                                          }
                                        }),
                                  ],
                                ),
                              )
                            ],
                          )),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "By powered",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/Recurso.png",
                          scale: 3.2,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
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
}
