class CustomUrl {
  static Uri openWhatsApp({required dynamic code, required String number}) =>
      Uri.parse('https://wa.me/$code$number?text=Hello');
}
