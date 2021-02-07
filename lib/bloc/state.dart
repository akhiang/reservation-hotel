abstract class State {}

class StateInitiated implements State {}

class StateLoading implements State {}

class StateLoaded<T> implements State {
  final T data;

  StateLoaded({this.data});

  StateLoaded<T> copyWith({T data}) {
    return StateLoaded<T>(
      data: data ?? this.data,
    );
  }
}

class StateError implements State {
  final String message;
  final List<Map<String, List<String>>> errors;

  StateError({
    this.message,
    this.errors,
  });
}
