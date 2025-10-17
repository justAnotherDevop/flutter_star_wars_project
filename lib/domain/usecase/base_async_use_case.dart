import 'package:fpdart/fpdart.dart';

abstract class BaseAsyncUseCase<T, P> {

  Future<Either<Exception, T>> execute(P params);
}