typedef HandleFunc<S, T> = S Function(T);

mixin TypeHandler<BASE, STATE> {
  Map<Type, HandleFunc<STATE, BASE>> _handlers = Map();

  void _put<EVENT extends BASE>(HandleFunc<STATE, EVENT> func) {
    Type key = EVENT;
    _handlers.update(key, (existing) {
      assert(existing == null);
      return (event) => func(event as EVENT);
    });
  }

  STATE handle(BASE event) {
    var type = event.runtimeType;
    var handler = _handlers[type];
    assert(handler != null);
    return handler(event);
  }
}
