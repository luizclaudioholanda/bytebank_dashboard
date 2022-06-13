import 'package:bytebank_dashborad/dao/contact_dao.dart';
import 'package:bytebank_dashborad/models/contact.dart';
import 'package:flutter/material.dart';

const _titleContactFormAppBar = 'New Contact';
const _labelFullNameText = 'Full Name';
const _labelAccountNumberText = 'Account Number';
const _textCreateButton = 'Create';

class ContactForm extends StatefulWidget {

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _accountNumberController = TextEditingController();

  final ContactDao _contactDao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleContactFormAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(labelText: _labelFullNameText),
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(labelText: _labelAccountNumberText),
                style: TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String fullName = _fullNameController.text;
                    final int? accountNumber = int.tryParse(_accountNumberController.text);

                    final Contact newContact = Contact(0, fullName, accountNumber);
                    _contactDao.save(newContact).then((id) => Navigator.pop(context));

                  },
                  child: const Text(_textCreateButton),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
