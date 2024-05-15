part of 'products_cubit.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState(
      {required List<Product> products, required bool isLoading}) = _Initial;
}
