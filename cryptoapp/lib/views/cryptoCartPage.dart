import 'package:cryptoapp/model/CartcryptoModel.dart';
import 'package:cryptoapp/provider/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildUI(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text("Cart"),
    );
  }

  Widget _buildUI() {
    // Use the Consumer widget to listen for changes in CartProvider
    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.80,
              child: ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) {
                  ProductCart product = provider.items[index];
                  return Card(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                provider.remove(product);
                              },
                              child: Container(
                                child: Icon(Icons.delete),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(width: 80,height: 80,
                            child: Image.network(product.image.toString()),
                          ),
                        ),
                        Container(
                          child: Text(product.title),
                        ),
                        Container(
                          child: Text(product.price.toString()),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Text(
              "Cart Total: \$${provider.getCartTotal().round()}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
