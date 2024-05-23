import 'package:flutter/material.dart';
import 'package:netstorere/screen/business/capital.dart';
import 'package:netstorere/screen/business/cossnackbar.dart';
import 'package:netstorere/screen/business/option.dart';
import 'package:netstorere/screen/business/updates/updatelog/update_log.dart';

class Business extends StatefulWidget {
  const Business({super.key});
  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  String selectedOption = 'Choose your business category';
  String textFieldValue = '';

  void _showOptionsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Material(
          color: Colors.white,
          child: OptionsSheet(
            onOptionSelected: (option) {
              setState(() {
                selectedOption = option;
              });
            },
            options: const [
              'Restaurant',
              'Retail Store',
              'Fitness Center',
              'Salon',
              'Consulting Agency',
              'Restaurant',
              'Retail Store',
              'Fitness Center',
              'Salon',
              'Consulting Agency',
              'Restaurant',
              'Retail Store',
              'Fitness Center',
              'Salon',
              'Consulting Agency',
              'Restaurant',
              'Retail Store',
              'Fitness Center',
              'Salon',
              'Consulting Agency',
            ],
          ),
        );
      },
    );
  }

  bool canCreate() {
    return textFieldValue.isNotEmpty &&
        selectedOption != 'Choose your business category';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 17,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'Create NetStore Business',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Row(
              children: [
                Image.asset(
                  'image/icon/3.jpeg',
                  height: 23,
                  width: 23,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Enter your business title',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color.fromARGB(255, 112, 112, 112)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Text(
              '(This can be modified later)',
              style: TextStyle(
                  fontSize: 13, color: Color.fromARGB(255, 172, 172, 172)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 238, 238, 238),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'image/icon/2.jpg',
                      height: 22,
                      width: 22,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            textFieldValue = value;
                          });
                        },
                        inputFormatters: [
                          CapitalizeWordsFormatter(),
                        ],
                        style: const TextStyle(
                            color: Color.fromARGB(255, 4, 147, 141),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                            hintText: 'Type Here...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: GestureDetector(
              onTap: () => _showOptionsSheet(context),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 238, 238, 238),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedOption,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 117, 117, 117)),
                      ),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 2),
            child: Text(
              'By clicking Create, you agree to Heartinz\'s Trems of Service and Privacy policy',
              style: TextStyle(
                  color: Color.fromARGB(255, 112, 112, 112), fontSize: 11.3),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  if (canCreate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Updatelogo(),
                      ),
                    );
                  } else {
                    showCustomSnackbar(
                      context,
                      Icons.warning,
                      textFieldValue.isEmpty
                          ? 'Kindly enter a title'
                          : 'Kindly choose your business category',
                    );
                  }
                },
                child: Container(
                  height: 48,
                  width: double.infinity,
                  color: canCreate()
                      ? const Color.fromARGB(255, 4, 147, 141)
                      : const Color.fromARGB(255, 169, 169, 169),
                  child: const Center(
                      child: Text(
                    'CREATE',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
