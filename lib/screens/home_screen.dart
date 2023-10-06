import 'package:flutter/material.dart';
import 'package:taskmaster/utils/constants.dart';
import 'package:taskmaster/widgets/custom_searchbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  // void _logout() async {
  //   print('logout');
  //   Navigator.pushReplacementNamed(context, '/login');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Tasks',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // CustomButton(
                    //   buttonColor:
                    //       Constants().kLogoutButtonColor().withOpacity(0.2),
                    //   buttonTextColor: Constants().kLogoutButtonTextColor(),
                    //   onPressed: _logout,
                    //   buttonName: 'Logout',
                    // ),
                    SizedBox(width: 10.0),
                    CircleAvatar(
                      radius: 28.0,
                      backgroundColor: Colors.yellow,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSearchBox(
                hintText: 'Search', controller: searchController),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 220,
                  width: 220,
                  margin: const EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Constants().pinkColor(),
                  ),
                ),
                Container(
                  height: 220,
                  width: 220,
                  margin: const EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Constants().yellowColor(),
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    ));
  }
}
