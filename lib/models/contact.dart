class Contact {

  final int? id;

  final String fullName;
  final int? accountNumber;

  Contact(this.id, this.fullName, this.accountNumber);

  Contact.fromJson(Map<String, dynamic> json) :
      id = json['id'],
      fullName = json['name'],
      accountNumber = json['accountNumber'];

  @override
  String toString() {
    return 'Contact{id: $id, fullName: $fullName, accountNumber: $accountNumber}';
  }


}