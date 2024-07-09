import 'package:flutter/cupertino.dart';

import '../models/doc_accountModel.dart';

class DocProviders extends ChangeNotifier {
  late Future<DocAccountModel?> _docdat;
  set docdata(Future<DocAccountModel?> docDataaa) {
    _docdat = docDataaa;
    notifyListeners();
  }

  Future<DocAccountModel?> get docdata {
    return _docdat;
  }
}
