import 'package:flutter/foundation.dart';

class CartItem {
	final String id;
	final String title;
	final int quantity;
	final double price;

	CartItem({
		@required this.id,
		@required this.title,
		@required this.quantity,
		@required this.price,
	});
}

class Cart with ChangeNotifier {
	Map<String, CartItem> _items = {};

	Map<String, CartItem> get items {
		return {..._items};
	}

	int get itemCount {
		int count = 0;
		_items.forEach((key, item) {
			count = count + item.quantity;
		});
		return count;
	}

	double get totalAmount {
		double totalPrice = 0.0;
		_items.forEach((key, item) {
			totalPrice = totalPrice + item.price;
		});
		return totalPrice;
	}

	void addItem(String productId, double price, String title) {
		if (_items.containsKey(productId)) {
			_items.update(
				productId,
						(existingCartItem) =>
						CartItem(
							id: existingCartItem.id,
							title: existingCartItem.title,
							price: existingCartItem.price,
							quantity: existingCartItem.quantity + 1,
						),
			);
		} else {
			_items.putIfAbsent(
				productId,
						() =>
						CartItem(
							id: DateTime.now().toString(),
							title: title,
							price: price,
							quantity: 1,
						),
			);
		}
		notifyListeners();
	}

	void removeItem(String id) {
		_items.remove(id);
		notifyListeners();
	}

	void removeSingleItem(String productId) {
		if (!_items.containsKey(productId)) {
			return;
		}
		if (_items[productId].quantity > 1) {
			_items.update(productId, (existing) =>
					CartItem(id: existing.id,
						title: existing.title,
						price: existing.price,
						quantity: existing.quantity - 1,));
		} else {
		  _items.remove(productId);
    }
		notifyListeners();
	}


	void clear() {
		_items = {};
		notifyListeners();
	}
}
