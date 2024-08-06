import 'package:cryptoapp/model/cryptoModel.dart';
import 'package:cryptoapp/services/CryptoServices.dart';
import 'package:flutter/material.dart';

class CryptoItemProvider with  ChangeNotifier{

  late List<Cryptomodel>? CryptoItem;
  bool isLoading = false;
  Cryptoservices services = Cryptoservices();
  getCryptoData(context)async{
    isLoading=true;
    CryptoItem=await services.getDetails(context);
    isLoading=false;
    notifyListeners();
  }

  
}