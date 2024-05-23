import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netstorere/screen/business/business.dart';
import 'package:pinput/pinput.dart';

class SecondBottomSheet extends StatefulWidget {
  final String user;

  const SecondBottomSheet({super.key, required this.user});

  @override
  _SecondBottomSheetState createState() => _SecondBottomSheetState();
}

class _SecondBottomSheetState extends State<SecondBottomSheet> {
  late Timer _timer;
  int _start = 30;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (_start == 0) {
          timer.cancel();
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void _resendOTP() {
    setState(() {
      _start = 30;
      _startTimer();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const defaultPinTheme = PinTheme(
      margin: EdgeInsets.symmetric(horizontal: 13.5),
      width: 28,
      height: 25,
      textStyle: TextStyle(
        fontSize: 14,
        color: Color.fromARGB(255, 19, 140, 133),
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(0, 0, 0, 0),
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 168, 168, 168),
            width: 2,
          ),
        ),
      ),
    );
    return Container(
      height: 210,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Verify OTP',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'An OTP has been sent to ${widget.user} \nkindly enter it below to continue',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                color: Color.fromARGB(255, 117, 117, 117),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: const Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 19, 140, 133),
                      width: 2,
                    ),
                  ),
                ),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              onCompleted: (pin) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Business(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                if (_start == 0) {
                  _resendOTP();
                }
              },
              child: Text(
                _start == 0 ? 'Resend OTP' : ' ${_start}s',
                style: TextStyle(
                  fontSize: 11,
                  color: _start == 0 ? Colors.red : Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
