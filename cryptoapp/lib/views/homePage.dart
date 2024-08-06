import 'package:cryptoapp/model/CartcryptoModel.dart';
import 'package:cryptoapp/model/CartcryptoModel.dart';
import 'package:cryptoapp/model/CartcryptoModel.dart';
import 'package:cryptoapp/model/cryptoModel.dart';
import 'package:cryptoapp/provider/CartProvider.dart';
import 'package:cryptoapp/provider/cryptoItems.dart';
import 'package:cryptoapp/services/CryptoServices.dart';
import 'package:cryptoapp/views/cryptoCartPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  void initState() {
    Provider.of<CryptoItemProvider>(context, listen: false)
        .getCryptoData(context);
    super.initState();
  }

  Widget build(BuildContext context) {
    final CryptoItemProviderMDL = Provider.of<CryptoItemProvider>(context);
    final CartProviderMdl = Provider.of<CartProvider>(context);
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screnWidt = mediaQueryData.size.width;
    double screnHeight = mediaQueryData.size.height;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Crypto app"),
              InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return CartPage();
                    }));
                  },
                  child: Icon(Icons.add_card))
            ],
          ),
        ),
        body: CryptoItemProviderMDL.isLoading != true
            ? ListView.builder(
                itemCount: CryptoItemProviderMDL.CryptoItem?.length,
                itemBuilder: (ctx, index) {
                  var CryptoItems = CryptoItemProviderMDL.CryptoItem?[index];
                  return Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: screnWidt * 0.1,
                                child: Image(
                                    image:
                                        NetworkImage(CryptoItems?.image ?? "")),
                              ),
                              Container(
                                width: 90,
                                child: Container(
                                    child: Center(
                                        child: Text(CryptoItems?.name ?? ""))),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: InkWell(
                              onTap: () {
                              
                                if (CryptoItems != null) {
                                  var productCart = ProductCart(
                                    image:CryptoItems.image.toString(),
                                    id: CryptoItems.id.toString(),
                                    title: CryptoItems.name.toString(),
                                    price: 0.10, // Assuming currentPrice exists
                                  );
                                  CartProviderMdl.add(productCart);
                                }
                              },
                              child: Icon(Icons.add)),
                        )
                      ],
                    ),
                  );
                })
            : Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              ));
  }
}
