import 'package:fpdart/fpdart.dart';
import 'package:reachout2/core/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>> ;

typedef FutureVoid = FutureEither<void>;

