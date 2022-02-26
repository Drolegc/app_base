
class Helpers {
   static range(int stop, {int start: 0, int step: 1}){
    if (step == 0)
      throw Exception("Step cannot be 0");

    return start < stop == step > 0
    ? List<String>.generate(((start-stop)/step).abs().ceil(), (int i) => (start + (i * step)).toString())
    : [];
  }
}