import 'package:flutter/widgets.dart';
import 'package:tutorme/Components/Inputs/searchInput.dart';

class searchBar extends StatefulWidget {
  const searchBar({super.key});

  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  final searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff31704A),
      child: Column(children: [
        searchInput(label: "How can we help?", controller: searchBarController)
      ]),
    );
  }
}
