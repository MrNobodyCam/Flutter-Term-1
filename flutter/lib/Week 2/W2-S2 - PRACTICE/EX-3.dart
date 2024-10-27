class MyDuration {
  final int _milliseconds;

  const MyDuration(this._milliseconds);

  factory MyDuration.fromHours(int hours) {
    return MyDuration(hours >= 0 ? hours * 3600000 : 0);
  }

  factory MyDuration.fromMinutes(int minutes) {
    return MyDuration(minutes >= 0 ? minutes * 60000 : 0);
  }

  factory MyDuration.fromSeconds(int seconds) {
    return MyDuration(seconds >= 0 ? seconds * 1000 : 0);
  }

  int get getmilliseconds => _milliseconds;

  @override
  String toString() {
    int seconds = (getmilliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }

  bool operator >(MyDuration other) {
    return getmilliseconds > other.getmilliseconds;
  }

  MyDuration operator +(MyDuration other) {
    return MyDuration(getmilliseconds + other.getmilliseconds);
  }

  MyDuration operator -(MyDuration other) {
    int newMilliseconds = getmilliseconds - other.getmilliseconds;
    if (newMilliseconds < 0) {
      throw ('Duration Cannot Be Negative.');
    }
    return MyDuration(newMilliseconds);
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3);
  MyDuration duration2 = MyDuration.fromMinutes(45);
  print(duration1);
  print(duration2);

  print(duration1 > duration2);

  MyDuration diff = duration1 - duration2;
  print('Difference: $diff');

  try {
    print(duration2 - duration1);
  } catch (e) {
    print(e);
  }
}
