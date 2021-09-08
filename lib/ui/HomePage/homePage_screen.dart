import 'package:exemplo_feed/_utilitys/AppConfig.dart';
import 'package:exemplo_feed/managers/AppManager.dart';
import 'package:exemplo_feed/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> listUsers = [];

  Future<void> carregarUsers() async {
    listUsers = await carregarUsuario();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => carregarUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wakke", style: TextStyle(color: markTertiaryColor)),
          backgroundColor: markSecondaryColor,
          centerTitle: true,
          elevation: 0,
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.chat_bubble_outlined,
                        color: markPrimaryColor,
                        size: 15,
                      ),
                      Text("Está acontecendo...",
                          style:
                              TextStyle(color: markPrimaryColor, fontSize: 20)),
                    ],
                  ),
                  for (User user in listUsers)
                    Card(
                        elevation: 2,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                              decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)
                                  ),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(user
                                              .usuarioImagemPerfil
                                              .toString()))),
                                ),
                                SizedBox(width: 5),
                                Text(user.usuarioApelido.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Spacer(),
                                Icon(
                                  Icons.chat,
                                  color: markPointsUser,
                                  size: 16,
                                ),
                                Text(user.comentarioQuantidade.toString(),
                                    style: TextStyle(
                                        color: markPointsUser, fontSize: 18)),
                                SizedBox(width: width(context) * 0.015),
                                Icon(
                                  Icons.star_border_rounded,
                                  color: markPointsUser,
                                  size: 19,
                                ),
                                Text(user.mediaNota.toString(),
                                    style: TextStyle(
                                        color: markPointsUser, fontSize: 18)),
                              ],
                            ),
                            SizedBox(height: height(context) * 0.01),
                            Stack(children: [
                              Container(
                                width: width(context),
                                height: 300,
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(8.0)
                                    ),
                                    image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(user.imagemCapa.toString()))),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 100),
                                  Center(
                                    child: Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      color: markTitulo,
                                      child: Container(
                                        height: height(context)*0.08,
                                        width: width(context) *0.7,
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(user.titulo.toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: markSecondaryColor,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                          ]),
                        ))
                ],
              )),
        ),
        floatingActionButton: Container(
          height: 55.0,
          width: 55.0,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: markTitulo,
              onPressed: () {},
              child:  Image.asset(companyMascote),
              // elevation: 5.0,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            // elevation: 20.0,

            shape: CircularNotchedRectangle(),
            child: Container(
              height: 40,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(left: 28.0),
                    icon: Icon(
                      Icons.menu,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(right: 28.0),
                    icon: Icon(Icons.add, color: Colors.grey),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(left: 28.0),
                    icon: Icon(Icons.person, color: Colors.grey),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(right: 28.0),
                    icon: Icon(Icons.notifications, color: Colors.grey),
                    onPressed: () {},
                  )
                ],
              ),
            )));
  }
}
