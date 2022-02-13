import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      {required String title,
      required IconData icon,
      required Function() tapHandler}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: GoogleFonts.robotoCondensed(
            fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            "Cooking Up!",
            style: GoogleFonts.raleway(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildListTile(
          title: "Meals",
          icon: Icons.restaurant,
          tapHandler: () {
            Navigator.of(context).pushReplacementNamed("/");
          },
        ),
        buildListTile(
          title: "Filters",
          icon: Icons.settings,
          tapHandler: () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          },
        ),
      ],
    );
  }
}
