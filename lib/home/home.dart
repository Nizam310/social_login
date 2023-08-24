import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:social_login/login/login_controller.dart';

import '../table.dart';

class Home extends StatefulWidget {
  final String name;
  final String email;

  const Home({super.key, required this.name, required this.email});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final LoginController loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Builder(
              builder: (context) {
                return IconButton(onPressed: () {
                  Scaffold.of(context).openEndDrawer();

                }, icon: const Icon(Icons.menu,color: Colors.white,),);
              }
          )
        ],),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            const DrawerHeader(child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height :100,
                    width :100,
                    child: CircleAvatar()),
                Text('Name')
              ],
            ),),
            SignInButton(
              elevation: 0,
              padding :const EdgeInsets.symmetric(vertical: 5),
              Buttons.GoogleDark,
              text: 'Sign Out',
              onPressed: () async {
                await loginController.signOut();
              },
            ).paddingSymmetric(horizontal: 10),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         /* Text('Name : ${widget.name}'),
          Text('Email : ${widget.email}').paddingSymmetric(vertical: 10),*/
          Text('Name',style: context.textTheme.titleMedium?.copyWith(color: Colors.white),).paddingSymmetric(horizontal: 10,vertical: 5),
          CustomCard(text: widget.name, icon: Icons.person),
          Text('Email',style: context.textTheme.titleMedium?.copyWith(color: Colors.white),).paddingSymmetric(horizontal: 10,vertical: 5),
          CustomCard(text: widget.email, icon: Icons.mail),

          Center(child: ElevatedButton(onPressed: (){Navigator.push(Get.context!, MaterialPageRoute(builder: (builder)=>const TableView()));}, child: Text('Table View'))),


        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String text ;
  final IconData icon;
  const CustomCard({super.key, required this.text, required this.icon,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),

      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(text),
          Icon(icon)
        ],
      ).paddingSymmetric(horizontal: 10),
    );
  }
}
