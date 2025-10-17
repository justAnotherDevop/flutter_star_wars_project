abstract class BaseAsyncUseCase<T, P> {
  Future<T> execute(P args);
}