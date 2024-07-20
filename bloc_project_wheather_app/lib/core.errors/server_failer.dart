abstract class Failture {
  final String message;
  Failture(this.message);
}

class ServerFailure extends Failture{
  ServerFailure(super.message);
}
