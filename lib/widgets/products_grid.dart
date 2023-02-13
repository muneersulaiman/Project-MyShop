import 'package:flutter/material.dart';
import 'package:my_shop/provider/product_provider.dart';
import 'package:my_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFav;

  const ProductsGrid(this.showFav, {super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFav ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: ((ctx, i) => ChangeNotifierProvider.value(
            value: products[i],
            // create: (c) => products[i],
            child: ProductItem(
                // id: products[i].id!,
                // title: products[i].title!,
                // imageUrl: products[i].imageUrl!,
                ),
          )),
      itemCount: products.length,
    );
  }
}
