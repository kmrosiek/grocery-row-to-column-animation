import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery/domain/product/product_id.dart';

part 'order_item.freezed.dart';

@freezed
class OrderItem with _$OrderItem {
  const OrderItem._();
  const factory OrderItem({
    required ProductId productId,
    required int count,
  }) = _OrderItem;

  OrderItem increment() {
    return copyWith(count: count + 1);
  }

  Option<OrderItem> decrement() {
    if (count <= 1) return const None();
    return Some(copyWith(count: count - 1));
  }
}
