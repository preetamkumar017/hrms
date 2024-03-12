//AppTranslation.dart
abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enUS,
    "bn": bn,
    "te": te,
    "ur": ur,
    "hi": hi,
    "ta": ta,
    "es": es,
    "mr": mr,
    "ru": ru,
    "fr": fr
  };
}

final Map<String, String> enUS = {
  'greetings': 'Hello, How are you?',
  'day': "Awesome day..."
};

final Map<String, String> bn = {
  'greetings': 'হ্যালো, আপনি কেমন আছেন?',
  'day': "সন্ত্রস্ত দিন..."
};
final Map<String, String> te = {
  'greetings': 'హలో, మీరు ఎలా ఉన్నారు?',
  'day': "గొప్ప రోజు..."
};
final Map<String, String> ur = {
  'greetings': 'ہیلو آپ کیسے ہیں؟',
  'day': "بہت اچھا دن ..."
};
final Map<String, String> hi = {
  'greetings': 'नमस्ते आप कैसे हैं? @name',
  'day': "शानदार दिन..."
};

final Map<String, String> ta = {
  'greetings': "வணக்கம் எப்படி இருக்கிறாய்?",
  'day': "அற்புதமான நாள் ..."
};
final Map<String, String> es = {
  'greetings': "¿Hola como estas?",
  'day': "Día impresionante..."
};
final Map<String, String> mr = {
  'greetings': "हॅलो, कसे आहात",
  'day': "अप्रतिम दिवस ..."
};
final Map<String, String> ru = {
  'greetings': "Привет как дела?",
  'day': "Замечательный день..."
};
final Map<String, String> fr = {
  'greetings': "Salut comment allez-vous?",
  'day': "Super journée..."
};