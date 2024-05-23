import 'package:flutter/material.dart';

class OptionsSheet extends StatelessWidget {
  final Function(String) onOptionSelected;
  final List<String> options;

  const OptionsSheet(
      {super.key, required this.options, required this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _buildListTiles(context),
      ),
    );
  }

  List<Widget> _buildListTiles(BuildContext context) {
    List<Widget> listTiles = [];

    listTiles.add(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.only(top: 15, left: 25),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
          title: const Text(
            'Choose category',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w100),
          ),
        ),
      ),
    );

    for (int i = 0; i < options.length; i++) {
      final String option = options[i];
      final Color backgroundColor =
          i.isEven ? Colors.white : const Color.fromARGB(255, 250, 250, 250);

      listTiles.add(
        ListTile(
          title: Center(
              child: Text(
            option,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 117, 117, 117)),
          )),
          tileColor: backgroundColor,
          onTap: () {
            onOptionSelected(option);
            Navigator.pop(context);
          },
        ),
      );
    }

    return listTiles;
  }
}
