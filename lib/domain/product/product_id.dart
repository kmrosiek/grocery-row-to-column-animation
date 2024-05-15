class ProductId {
  final String _id;

  ProductId(this._id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductId &&
          runtimeType == other.runtimeType &&
          _id == other._id;

  @override
  int get hashCode => _id.hashCode;

  @override
  String toString() {
    return 'ProductId{id: $_id}';
  }
}
