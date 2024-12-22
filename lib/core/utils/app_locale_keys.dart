class AppLocaleKeys {
  static const appName = "Rent Hub";
  static const logIn = "Log In";
  static const signUp = "Sign Up";
  static const email = "Email";
  static const fullName = "Full Name";
  static const phoneNumber = "Phone Number";
  static const confirmPassword = "Confirm Password";
  static const password = "Password";
  static const forgotPassword = "Parolni unitdingizmi?";
  static const registerYet = "Ro'yhatdan o'tmaganmisiz?  ";
  static const haveAnAccount = "Akkountingiz bormi?  ";
  static const resentInstruction =
      "Xavotir olmang, biz sizga ko'rsatmalarni yuboramiz";
  static const resetPassword = "Parolni tiklash";
  static const backToLogIn = "Kirish sahifasiga qaytish";
  static const enterEmail = "Emailingizni kiriting";
  static const noInternet = "Internet bilan aloqa mavjud emas";
  static const registerSuccess = "Muvaffaqiyatli ro'yhatdan o'tdingiz";
  static const logInSuccess = "Muvaffaqiyatli profilga kirdingiz";
  static const passwordUpdated = "Password o'zgartirildi";
  static const error = 'error';
  static const serverError = 'Tarmoq xatoligi';
  static const invalidCredentials =
      "invalid credentials: crypto/bcrypt: hashedPassword is not the hash of the given password";
  static const errorUser = "error getting user details: user not found";
  static const errorPassword = "Email yoki Parol xato";
  static const userNotFound = "Foydalanuvchi topilmadi";
  static const emailError = "Email formati xato";
  static const fillField = "Bu yerni to'ldiring";
  static const passwordError =
      "Password eng kamida 6 ta belgidan iborat bo'lishi lozim";
  static const gmail = "@gmail.com";
  static const enterFullPhoneNumber = "Telefon raqamni to'liq kiriting";
  static const errorOperator = 'Bunday aloqa operatori mavjud emas';
  static const passwordNotSame = "Parol bir xil emas";
  static const dublicateEmail =
      '''error registering user: pq: duplicate key value violates unique constraint "users_email_key"''';
  static const dublicatePhoneNumber =
      '''error registering user: pq: duplicate key value violates unique constraint "users_phone_number_key"''';
  static const alreadyUsedPhoneNumber =
      "Ushbu telefon raqamdan ro'yhatdan o'tilgan";
  static const alreadyUsedEmail = "Ushbu emaildan ro'yhatdan o'tilgan";
  static const invalidUser = "invalid credentials: user not found";
  static const forgotPasswordSuccess = 'Kod emailga yuborildi';
  static const enterCode = 'Kodni kiriting';
  static const enterNewPassword = 'Yanagi parolni kiriting';
  static const resetPasswordSuccess = 'Parol muvaffqiyatli yangilandi';
  static const unSendToEmail = "Ushbu emailga kod yuborilmagan";
  static const wantToLogOut = 'Tizimdan chiqmoqchimisiz?';
  static const cancel = 'Bekor qilish';
  static const continue1 = "Chiqishni xohlaysizmi?";
  static const yes = 'Ha';
  static const no = "Yo'q";
  static const willBeLostAllData =
      " Barcha saqlanmagan maʼlumotlaringiz yoʻqoladi.";
  static const location = 'Location';
  static const jakarta = 'Jakarta';
  static const searchHintTitle = "Manzilni qidirish";
  static const nearYou = "Sizga yaqin";
  static const seeMore = 'See more';
  static const bestForYou = "Siz uchun eng yaxshisi";
  static const description = 'Tavsif';
  static const gallery = 'Gallery';
  static const price = 'Narxi';
  static const rentNow = "Buyurtma berish";
  static const logOutSuccess = "Profildan muvaffaqiyatli chiqildi";
  static const user = 'User';
  static const unexpectedError = "Unexpected Error";
  static const saved = 'Saqlanganlar';
  static const empty = "Hech narsa mavjud emas";
  static const message = "Xabarlar";
  static const noMessage = "Xabarlar mavjud emas";
  static const profile = "Shaxsiy kabinet";
  static const edit = "Profilni tahrirlash";
  static const share = "Baham ko'rish";

  static const orders = "Buyurtmalarim";
  static const commit = "Sharhlarim";
  static const card = "Maning kartalarim";
  static const myLoc = 'Maning manzillarim';
  static const notification = "Bildirishnoma";
  static const settings = "Sozlamalar";
  static const help = "Yordam";
  static const customError =
      "Noqulaylik uchun uzur so'raymiz, ushbu bo'limda texnik ishlar olib borilayotganligi uchun hozirda ushbu xizmatimiz mavjud emas";
  static const lorem = '''
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.  
  ''';

  static const not1 =
      "Tabriklaymiz! Siz muvaffaqiyatli ro'yxatdan o'tdingiz. Ilovamizdan foydalanayotganingiz uchun tashakkur! 🎉";
  static const not2 =
      "Bugun uy-joylar bozorida nima yangilik? Sizning ehtiyojlaringizga mos yangi uylarni kashf qiling va ijara uchun birinchi qadamni qo'ying! 🏠🔑";

  static const swipeRight =
      "Ekranni o'ngga surish orqali siz ilovada mavjud barcha xizmatlar haqida to'liqroq ma'lumot olishingiz mumkin";

  static const introduction='Ilovadan foydalanish haqida';
   static const continue2="Davom ettirish";
}

// Buyurtmalarim
// Sharhlarim
// Uzum Nasiya muddatli to'lovi
// Uzum Avto
// Sotuvchi bolish
// Topshirish punktini ochish
// Uzum karta

List notifications = [AppLocaleKeys.not1, AppLocaleKeys.not2];
