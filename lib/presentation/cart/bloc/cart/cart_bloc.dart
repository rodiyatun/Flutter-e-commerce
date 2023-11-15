import 'package:bloc/bloc.dart';
import 'package:e_commerce/presentation/cart/widgets/cart_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const _Loaded([])) {
    on<_Add>((event, emit) {
      final currentState = state as _Loaded;
      final index = currentState.carts
          .indexWhere((e) => e.product.id == event.cart.product.id);
      if (index >= 0) {
        currentState.carts[index].quantity += 1;
        emit(const _Loading());
        emit(_Loaded(currentState.carts));
      } else {
        emit(_Loaded([...currentState.carts, event.cart]));
      }
    });

    on<_Remove>((event, emit) {
      final currentState = state as _Loaded;
      final index = currentState.carts
          .indexWhere((e) => e.product.id == event.cart.product.id);
      if (index >= 0) {
        currentState.carts[index].quantity -= 1;

        if (event.removeAll || currentState.carts[index].quantity <= 0) {
          final cartList = currentState.carts.toList();
          cartList.remove(event.cart);
          emit(const _Loading());
          emit(_Loaded(cartList));
        } else {
          emit(const _Loading());
          emit(_Loaded(currentState.carts));
        }
      }
    });

    on<_Started>((event, emit) {
      emit(const _Loading());
      emit(const _Loaded([]));
    });
  }
}