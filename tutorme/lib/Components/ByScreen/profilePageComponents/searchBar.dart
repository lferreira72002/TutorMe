import 'package:flutter/widgets.dart';
import 'package:tutorme/Components/Inputs/searchInput.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
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
