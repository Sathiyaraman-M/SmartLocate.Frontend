import 'package:flutter/material.dart';
import 'package:smart_locate/services/claim_data_service.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color.fromARGB(255, 50, 50, 50)),
            accountName: FutureBuilder<String>(
                future: ClaimDataService.getStudentName(),
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if(snapshot.hasData) {
                    return Text(snapshot.data!, style: const TextStyle(fontWeight: FontWeight.bold));
                  } else {
                    return const Text("FireLights", style: TextStyle(fontWeight: FontWeight.bold));
                  }
                }
            ),
            accountEmail: FutureBuilder<String>(
              future: ClaimDataService.getStudentEmail(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if(snapshot.hasData) {
                  return Text(snapshot.data!, style: const TextStyle(fontWeight: FontWeight.bold));
                } else {
                  return const Text("fireLights@glance-village.com", style: TextStyle(fontWeight: FontWeight.bold));
                }
              },
            ),
            currentAccountPicture: const FlutterLogo(),
          ),
          // ListTile(
          //   leading: const Icon(Icons.home),
          //   title: const Text('Home'),
          //   onTap: () {
          //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomeScreen()), (route) => false);
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.card_membership),
          //   title: const Text('Job Cards'),
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (_) => const JobCardsScreen()));
          //   },
          // ),
          // const Divider(color: Colors.black),
          // ListTile(
          //   leading: const Icon(Icons.collections),
          //   title: const Text('Works'),
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (_) => const WorksMainScreen()));
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.settings),
          //   title: const Text('Settings '),
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
          //   },
          // ),
          // const Divider(color: Colors.black),
          // ListTile(
          //   leading: const Icon(Icons.logout),
          //   title: const Text('Logout '),
          //   onTap: () {
          //     showDialog(
          //         context: context,
          //         builder: (context) {
          //           return AlertDialog(
          //             title: const Text('Logout'),
          //             content: const Text('Are you sure you want to logout?'),
          //             actions: [
          //               TextButton(
          //                 child: const Text('No'),
          //                 onPressed: () {
          //                   Navigator.of(context).pop(false);
          //                 },
          //               ),
          //               TextButton(
          //                 child: const Text('Yes'),
          //                 onPressed: () {
          //                   LocalStorage.deleteAll();
          //                   Navigator.of(context).pop(true);
          //                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
          //                 },
          //               ),
          //             ],
          //           );
          //         }
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}