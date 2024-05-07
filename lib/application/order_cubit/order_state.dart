part of 'order_cubit.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    required List<OrderItem> orderItems,
  }) = _OrderState;

  factory OrderState.initial() => const OrderState(orderItems: []);
}
