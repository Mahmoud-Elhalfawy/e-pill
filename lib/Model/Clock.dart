import 'dart:collection';

class Clock{
int?minutes;
int?hours;

Clock({this.minutes,this.hours});


Map<String, int> hourMap={

  "تسعة":9,
  "واحدة":1,
  "اتنين":2,
  "ثلاثه":3,
  "اربعه":4,
  "خمسه":5,
  "سته":6,
  "سبعه":7,
  "ثمانيه":8,


};

Map<String, int> minuteMap={

  "نص":30,
  "ربع":15,
  "تلت":20,
  "نص و خمسة":35,
  "نص الا خمسة":25,
  "الا تلت":40,
  "الا ربع":45,
  "عشرة":10,
  "خمسة":5,
  "الا خمسة":55,
  "الا عشرة":50,


};


Map<String, int> TODMap={
  "العصر":12,
  "الظهر":12,
  "مساءا":12,
  "باليل":12,
  "ليلا":12,
};








}