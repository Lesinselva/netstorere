import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netstorere/screen/login/bottomsheet.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  _LogScreenState createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  bool _showFirstBottomSheet = true;
  TextEditingController _controller = TextEditingController();
  Color _containerColor = const Color.fromARGB(255, 169, 169, 169);

  void _handlePress() {}
  void _onContinuePressed() {
    if (_controller.text.length == 10) {
      setState(() {
        _showFirstBottomSheet = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 102),
          backgroundColor: const Color.fromARGB(255, 250, 192, 46),
          content: const Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Icon(
                      Icons.warning,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18, top: 15),
                    child: Text(
                      'Warning',
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Color.fromARGB(255, 250, 192, 46),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      'Kindly enter a valid phone number',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w200),
                    ),
                  )
                ],
              ),
            ],
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8, top: 77),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'image/icon/1.jpg',
                height: 67,
                width: 67,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Welcome to NetStore',
              style: TextStyle(
                  color: Color.fromARGB(255, 4, 147, 141),
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            const Text(
              'Login to countinue',
              style: TextStyle(color: Color.fromARGB(255, 117, 117, 117)),
            ),
          ],
        ),
      ),
      bottomSheet: _showFirstBottomSheet
          ? _buildFirstBottomSheet()
          : SecondBottomSheet(
              user: _controller.text,
            ),
    );
  }

  Widget _buildFirstBottomSheet() {
    return Container(
      height: 230,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          const Text(
            'Verify Your Number',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Please enter your 10 digit mobile number \nto receive a vaerification code',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: Color.fromARGB(255, 117, 117, 117),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 238, 238, 238),
                    ),
                    child: const Center(
                      child: Text(
                        '+91',
                        style: TextStyle(
                          color: Color.fromARGB(255, 188, 188, 188),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 238, 238, 238),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        maxLength: 10,
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: 10),
                            hintText: 'Enter your phone number here',
                            counterText: '',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 14),
                            border: InputBorder.none),
                        onChanged: (value) {
                          setState(() {
                            _containerColor = value.length == 10
                                ? const Color.fromARGB(255, 4, 147, 141)
                                : const Color.fromARGB(255, 169, 169, 169);
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          } else if (value.length < 10) {
                            return 'Mobile number should be 10 digits';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: ElevatedButton(
              onPressed: _onContinuePressed,
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: _containerColor),
              child: const SizedBox(
                height: 45,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 9,
                  color: Color.fromARGB(255, 130, 130, 130),
                ),
                children: <TextSpan>[
                  const TextSpan(text: 'By continuing, You agree to our '),
                  TextSpan(
                    text: 'Terms & Conditions and Privacy Policy',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 4, 5, 215),
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = _handlePress,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
