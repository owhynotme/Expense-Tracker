import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  // create credentials
  static const _credentials = r'''
  {
   "type": "service_account",
  "project_id": "expense-tracker-371614",
  "private_key_id": "3b6c008811f49494d25fd7a3392888da7c4f9006",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCeASPJqjDO5qZf\nEzvbtbItcUBOYLS6EeMvNkqgHkqP2OG/ExBZvTq1oqiwVsbaD6VLcwdcx6YOzlcU\n3q0QwOiTADvrLnMecea7yBGS9g8zoVpMGjb4AHTccZnUzn+4y4bTsqRvcPKkKBGS\n4TqARg5IRPX7UBEHZh61DHJPURG46Fbnpqa05liObg9jtzEQCkXEuCilUzXoEi9+\n5MmAuDt0QLYv5uO1ISTNxfb8jIV3PfR1+vNPUmjCbV1SjVXOPhSZ2YvRTmScIQmh\ncQoZpDOB/tna3Kb28mKinatrsNvy9Mt9j06y3ErAgmo0tjI1zERwqC243KFycbuh\nyTudIG2hAgMBAAECggEABZ0Wlio23eGkd2bHHufORYk18W2ZUNi6A1n7Xe54Pt2Z\nVvujU6jiiS8BrXLb0Ztc3PjLLMDxdapfk3/TfW+jzmCOVcKlTOeGPNWKHaL33cv7\nBGP/Csx2BRn/zud/nVi/ziLVRESqnj9H2+R8JVq31Fn836RT1+Peg0IGsqo3m2Pk\nL2pzzc6pxkkNYgCgpkiIiPkKHUNXhSDzi0PctS5/9Y6lhPZOkF2KYUPq7CjFEjOa\nku+SpVonTfF76OOqljvq2NiYshMrINHr4rMtnbMDSsItFV7ABLP1OUDlgsY0/a7H\nXyRwqE8c/8kddasXc+JM80ICyd6rLgRUru9A4vNVtQKBgQDSrAo7N1LgVRNcj8lo\nqKv8eR1YN6e3HLJYMYH8RyLgCac6C2fDp6jVLAhA5c9nCnf7f/fG3ug6XDM1kxuV\nEsHzW8PLiHvo3UfRDxOC6ePYOMre9nYs3/Yc35QBBZHxY59GuckYZ7v6MwHDk2lP\nVTTd3/xESWqyf+XREiTMw8ExBQKBgQDAACIpzlEP+4wLuOiSOCm+Mdd59+wviSme\nYadf0JJFtHi7HtgkVKq0Fro8i1VnwxIif3TI2sqMy6zyIreZQR+suc7QJMZd84/p\nBYuIgENzJFHWraD9VXJOvGHJJYykAUp2i2k4RchL6NPcuEX9/adHUNMe7ZEiX2H6\nMwBgbHuc7QKBgF+eup4aBEHSG5GdqbsZI8baahlKWZNhMQmanvcUip3Jg99yocxK\nYvUuoShjpnmMZN0APkRDlIA4rP2aIaDN/L4qXnoZHrSZCym2gBKhekr/rAT7NLQ1\niw2b5R95mb5Ii1icpsuu+cEcOaa9V8UsVWyHZ4bPE+Ck8HiulYljKGLJAoGABpp6\nklGEPDZ8lJKhfRXtaZsxPAKo3uGqysW1CfiUb01LsbPX3zgCPvthIF/yagUthH45\nuAa+XKVMp29GPUEeI8SoNkRthiGwW2VTbThsGXOwVN/X356mtcqI2nAuLB3XP8h/\nr+3Ge8XgM4Eq9xdYP32qJTAqg7IgHojOhIJ2pekCgYEAp7MfGzIQ7HE2+Fl4R3X7\nVJlop4lX/tDUulBqfaFnGmhQ2DzpOZ42h0uVAs6e5kadmSGYglDrU2GLM1sumb63\nARTTAgA9Ze+y6GJ2CfJGqwXPNTaiA+FH/lzaZGMmKeMAh6vFsfxL610pNYkLb7xa\n5Pz8dpBv/LEyTLfqKwnXFrc=\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-gsheet@expense-tracker-371614.iam.gserviceaccount.com",
  "client_id": "108009912714449970283",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-gsheet%40expense-tracker-371614.iam.gserviceaccount.com"
  }
  ''';

  // set up & connect to the spreadsheet
  final spreashsheet_id = '1cwUtZqNg1vdzrdOFZjLapW4rrlCU73xkw-lQaZEJk7I';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  // some variables to keep track of..
  static int numberOfTransactions = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;

// initialise the spreadsheet!
  Future init() async {
    final ss = await _gsheets.spreadsheet(spreashsheet_id);
    _worksheet = ss.worksheetByTitle('Worksheet1');
    countRows();
  }

  // count the number of notes
  static Future countRows() async {
    while ((await _worksheet!.values
            .value(column: 1, row: numberOfTransactions + 1)) !=
        '') {
      numberOfTransactions++;
    }
    // now we know how many notes to load, now let's load them!
    loadTransactions();
  }

  // load existing notes from the spreadsheet
  static Future loadTransactions() async {
    if (_worksheet == null) return;

    for (int i = 1; i < numberOfTransactions; i++) {
      final String transactionName =
          await _worksheet!.values.value(column: 1, row: i + 1);
      final String transactionAmount =
          await _worksheet!.values.value(column: 2, row: i + 1);
      final String transactionType =
          await _worksheet!.values.value(column: 3, row: i + 1);

      if (currentTransactions.length < numberOfTransactions) {
        currentTransactions.add([
          transactionName,
          transactionAmount,
          transactionType,
        ]);
      }
    }
    // print(currentTransactions);
    // this will stop the circular loading indicator
    loading = false;
  }

  // Adding new Transaction in the Sheet
  // static Future insertTrans(String name, String amount, bool isincome) async {
  //   if (_worksheet == null) return;
  //   numberOfTransactions++;
  //   currentTransactions.add([
  //     name,
  //     amount,
  //     isincome == true ? 'income' : 'expense',
  //   ]);
  //   await _worksheet!.values.appendRow([
  //     name,
  //     amount,
  //     isincome == true ? 'income' : 'expense',
  //   ]);
  // }
  // insert a new transaction
  static Future insert(String name, String amount, bool _isIncome) async {
    if (_worksheet == null) return;
    numberOfTransactions++;
    currentTransactions.add([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
    ]);
    await _worksheet!.values.appendRow([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
    ]);
  }
}
