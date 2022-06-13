import 'package:bytebank_dashborad/database/app_database.dart';
import 'package:bytebank_dashborad/models/contact.dart';
import 'package:sqflite/sqlite_api.dart';

class ContactDao {

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _fullName = 'full_name';
  static const String _accountNumber = 'account_number';

  static const String TABLE_SQL = 'CREATE TABLE $_tableName ('
      '$_id INTEGER PRIMARY KEY, '
      '$_fullName TEXT, '
      '$_accountNumber INTEGER)';

  Future<int> save(Contact contact) async {

    final Database db = await getDatabase();

    Map<String, dynamic> contactMap = _toMap(contact);

    return db.insert(_tableName, contactMap);

  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_fullName] = contact.fullName;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {

    final Database db = await getDatabase();

    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> contacts = _toList(result);

    return  contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_fullName],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }

}