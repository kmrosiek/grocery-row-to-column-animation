import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery/domain/product/product.dart';
import 'package:grocery/domain/product/product_id.dart';
import 'package:grocery/presentation/common/assets.dart';

part 'products_state.dart';
part 'products_cubit.freezed.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(const ProductsState(products: [], isLoading: true));

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(products: [
      Product(
          id: ProductId('1'),
          name: 'Cabbage',
          price: 20.0,
          imageUrl: Assets.cabbage),
      Product(
          id: ProductId('2'),
          name: 'Broccoli',
          price: 10.0,
          imageUrl: Assets.broccoli),
      Product(
          id: ProductId('3'),
          name: 'Lettuce',
          price: 25.0,
          imageUrl: Assets.carrot),
      Product(
          id: ProductId('4'),
          name: 'Pakcoy',
          price: 13.0,
          imageUrl: Assets.pakcoy),
    ], isLoading: false));
  }

  Option<Product> getProduct({required ProductId productId}) {
    try {
      return Some(
          state.products.firstWhere((product) => product.id == productId));
    } on StateError catch (_) {
      return const None();
    }
  }
}
