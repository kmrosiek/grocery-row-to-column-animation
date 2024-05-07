import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery/domain/order_item/order_item.dart';
import 'package:grocery/domain/product.dart';
import 'package:injectable/injectable.dart';

part 'order_cubit.freezed.dart';
part 'order_state.dart';

@injectable
class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState.initial());

  void addProduct(Product product, int count) {
    int existingItemIndex =
        state.orderItems.indexWhere((item) => item.product.id == product.id);

    List<OrderItem> updatedItems = List<OrderItem>.from(state.orderItems);

    if (existingItemIndex != -1) {
      final item = updatedItems[existingItemIndex];
      updatedItems[existingItemIndex] = item.increment();
    } else {
      updatedItems.add(OrderItem(product: product, count: count));
    }

    emit(state.copyWith(orderItems: updatedItems));
  }

  void removeProduct(Product product, int count) {
    int existingItemIndex =
        state.orderItems.indexWhere((item) => item.product.id == product.id);

    List<OrderItem> updatedItems = List<OrderItem>.from(state.orderItems);

    if (existingItemIndex == -1) {
      log('Tried to remove ${product.id}, but item could not be found in the list.');
      return;
    }

    final item = updatedItems[existingItemIndex];
    Option<OrderItem> itemOrNothing = item.decrement();
    itemOrNothing.fold(() => updatedItems.removeAt(existingItemIndex),
        (orderItem) => updatedItems[existingItemIndex] = orderItem);

    emit(state.copyWith(orderItems: updatedItems));
  }

  //Stream<List<OrderItem>> watchOrderItems() {
  // Your implementation to fetch and listen to a stream of order items. Assuming you have a repository method.
  // For example:
  // _repository.watchOrderItems().listen(
  //   (newItems) {
  //     emit(state.copyWith(orderItems: newItems));
  //   },
  // );
  //}
}
