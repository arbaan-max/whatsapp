import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/constant/url_constant.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _validCountryNumber = '';
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool submit = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        submit = _controller.text.length > 4;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image file
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/image.png',
                    width: MediaQuery.of(context).size.width > 500
                        ? 400
                        : MediaQuery.of(context).size.width * 0.7,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // form
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.5, color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: bodyText(context,
                                    text: 'Enter Mobile Number')),
                            const SizedBox(height: 5),
                            IntlPhoneField(
                              autofocus: true,
                              flagsButtonPadding: const EdgeInsets.only(
                                left: 8,
                              ),
                              showDropdownIcon: false,
                              dropdownTextStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              invalidNumberMessage: 'Please Enter Valid Number',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              disableLengthCheck: true,
                              initialCountryCode: 'IN',
                              controller: _controller,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(width: 0.2),
                                ),
                              ),
                              onChanged: (value) {
                                log(value.completeNumber);
                              },
                              onCountryChanged: (country) {
                                setState(() {
                                  _validCountryNumber = country.dialCode;
                                });
                                log('Country changed to: ${country.dialCode}');
                              },
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: ElevatedButton(
                                onPressed: submit
                                    ? () {
                                        Uri url = CustomUrl.openWhatsApp(
                                          code: _validCountryNumber,
                                          number: _controller.text,
                                        );
                                        launchUrl(
                                          url,
                                          mode: LaunchMode.externalApplication,
                                        );
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  disabledBackgroundColor:
                                      Colors.green.withAlpha(100),
                                ),
                                child: const Text(
                                  'Chat on WhatsApp',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Texts
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: heading(context, text: '♦ Benefits ♦'),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText(context, text: '☉ '),
                          Expanded(
                            child: bodyText(context,
                                text:
                                    'Open the WhatsApp chat window without saving the number.'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText(context, text: '☉ '),
                          Expanded(
                            child: bodyText(context,
                                text:
                                    'बिना नंबर सेव किए किसी नंबर के लिए WhatsApp Chat खोलें|'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: heading(context, text: '♦ Why? ♦'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText(context, text: '☉ '),
                          Expanded(
                            child: bodyText(context,
                                text:
                                    'Sending WhatsApp messages without saving the number has following advantages:'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText(context, text: '☉ '),
                          Expanded(
                            child: bodyText(context,
                                text:
                                    'बिना नंबर सेव किए WhatsApp messages भेजने के निम्नलिखित फायदे हैं:'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText2(context, text: '1. '),
                          Expanded(
                            child: bodyText2(context,
                                text:
                                    'Start a chat from WhatsApp Web, without needing the phone to save the contact'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText2(context, text: '2. '),
                          Expanded(
                            child: bodyText2(context,
                                text:
                                    'Contacts list are only the one who we want to save'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText2(context, text: '3. '),
                          Expanded(
                            child: bodyText2(context,
                                text:
                                    'Saves time to message, share files and location whenever required'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText2(context, text: '4. '),
                          Expanded(
                            child: bodyText2(context,
                                text:
                                    'Your profile picture, and status if made private will not be visible to any unsaved numbers'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: heading(context, text: '- - -')),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text bodyText2(BuildContext context, {required String text}) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
    );
  }

  Text bodyText(BuildContext context, {required String text}) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Text heading(BuildContext context, {required String text}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 1.5,
          ),
    );
  }
}
