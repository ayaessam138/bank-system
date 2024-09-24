






import 'package:banksystem/core/cache_helper.dart';

class SharedPreferenceValue {


  static void saveEmail(String email) {
    CacheHelper.saveData(key: "Email", value: email);
  }

  static String getEmail() {
    return CacheHelper.getData(key: "Email") == null
        ? ""
        : CacheHelper.getData(key: "Email");
  }

  static void savePassword(String password) {
    CacheHelper.saveData(key: "Password", value: password);
  }

  static String getPassword() {
    return CacheHelper.getData(key: "Password") == null
        ? ""
        : CacheHelper.getData(key: "Password");
  }

  static void saveRememberMe(bool remember) {
    CacheHelper.saveData(key: "RememberMe", value: remember);
  }

  static bool getRememberMe() {
    return CacheHelper.getData(key: "RememberMe") == null
        ? false
        : CacheHelper.getData(key: "RememberMe");
  }



  static void SaveToken(String Token) {
    CacheHelper.saveData(key: "Token", value: Token);
  }

  static String GetToken() {
    return CacheHelper.getData(key: "Token") == null
        ? ""
        : CacheHelper.getData(key: "Token");
  }



  static void SaveLoginMessage(String LoginMessage) {
    CacheHelper.saveData(key: "LoginMessage", value: LoginMessage);
  }

  static String GetLoginMessage() {
    return CacheHelper.getData(key: "LoginMessage") == null
        ? ""
        : CacheHelper.getData(key: "LoginMessage");
  }
  static void SaveRegisterMessage(String RegisterMessage) {
    CacheHelper.saveData(key: "RegisterMessage", value: RegisterMessage);
  }

  static String GetRegisterMessage() {
    return CacheHelper.getData(key: "RegisterMessage") == null
        ? ""
        : CacheHelper.getData(key: "RegisterMessage");
  }

  static void SaveIsEmailVaild(bool IsEmailVaild) {
    CacheHelper.saveData(key: "IsEmailVaild", value: IsEmailVaild);
  }

  static bool GetIsEmailVaild() {
    return CacheHelper.getData(key: "IsEmailVaild");

  }
  static void SaveIsidVaild(bool IsidVaild) {
    CacheHelper.saveData(key: "IsidVaild", value: IsidVaild);
  }

  static bool GetIsidVaild() {
    return CacheHelper.getData(key: "IsidVaild") == null
        ? false
        : CacheHelper.getData(key: "IsidVaild");
  }
  static void SaveIsMobileVaild(bool IsMobileVaild) {
    CacheHelper.saveData(key: "IsMobileVaild", value: IsMobileVaild);
  }

  static bool GetIsMobileVaild() {
    return CacheHelper.getData(key: "IsMobileVaild") == null
        ? false
        : CacheHelper.getData(key: "IsMobileVaild");
  }
  static void SaveLocal(String local) {
    CacheHelper.saveData(key: "local", value: local);
  }
  static void Removeemail() {
    CacheHelper.removeData(key: 'Email');
  }
  static void Removepassword() {
    CacheHelper.removeData(key: 'Password');
  }
  static void RemoveRemberme() {
    CacheHelper.removeData(key: 'RememberMe');
  }
  static void RemoveToken() {
    CacheHelper.removeData(key: 'Token');
  }
  static String GetLocal() {
    return CacheHelper.getData(key: "local") == null
        ? ""
        : CacheHelper.getData(key: "local");
  }

}





// static void SaveUserId(String UserId) {
//   CacheHelper.saveData(key: "UserId", value: UserId);
// }
//
// static String GetUserId() {
//   return CacheHelper.getData(key: "UserId") == null
//       ? ""
//       : CacheHelper.getData(key: "UserId");
// }

// static void SvaeProjectLogo(String ProjectLogo) {
//   CacheHelper.saveData(key: "ProjectLogo", value: ProjectLogo);
// }
//
// static String GetProjectLogo() {
//   return CacheHelper.getData(key: "ProjectLogo") == null
//       ? ""
//       : CacheHelper.getData(key: "ProjectLogo");
// }

// static void SvaeProjectId(String ProjectName) {
//   CacheHelper.saveData(key: "ProjectName", value: ProjectName);
// }
//
// static String GetProjectId() {
//   return CacheHelper.getData(key: "ProjectName") == null
//       ? ""
//       : CacheHelper.getData(key: "ProjectName");
// }

// static void SaveProJectIdinPermit(String ProJectNameinPermit) {
//   CacheHelper.saveData(
//       key: "ProJectNameinPermit", value: ProJectNameinPermit);
// }
//
// static String GetProJectNameinPermit() {
//   return CacheHelper.getData(key: "ProJectNameinPermit") == null
//       ? ""
//       : CacheHelper.getData(key: "ProJectNameinPermit");
// }
// static void saveCountScan(int count) {
//   CacheHelper.saveData(key: "CountScan", value: count);
// }
//
// static int getCountScan() {
//   return CacheHelper.getData(key: "CountScan") == null
//       ? 0
//       : CacheHelper.getData(key: "CountScan");
// }

// static void saveOnboarding(String Onboarding) {
//   CacheHelper.saveData(key: "Onboarding", value: Onboarding);
// }
//
// static String getOnboarding() {
//   Utility.myPrintX('getOnboardingfIRST');
//   return CacheHelper.getData(key: "Onboarding") == null
//       ? ""
//       : CacheHelper.getData(key: "Onboarding");
// }

// static void saveProjectChoice(String ProjectChoice) {
//   CacheHelper.saveData(key: "ProjectChoice", value: ProjectChoice);
// }
//
// static String getProjectChoice() {
//   Utility.myPrintX('getProjectChoice');
//   return CacheHelper.getData(key: "ProjectChoice") == null
//       ? ""
//       : CacheHelper.getData(key: "ProjectChoice");
// }

// static void SaveChangePasswordEmail(String ChangePasswordEmail) {
//   CacheHelper.saveData(
//       key: "ChangePasswordEmail", value: ChangePasswordEmail);
// }
//
// static String GetChangePasswordEmail() {
//   return CacheHelper.getData(key: "ChangePasswordEmail") == null
//       ? ""
//       : CacheHelper.getData(key: "ChangePasswordEmail");
// }

// static void saveIsLightOrDart(bool token) {
//   CacheHelper.saveData(key: "IsLight", value: token);
// }
//
// static bool getIsLightOrDart() {
//   return CacheHelper.getData(key: "IsLight") == null
//       ? true
//       : CacheHelper.getData(key: "IsLight");
// }

// static bool isEnglish() {
//   if ("language".tr() == "اللغة") {
//     return false;
//   } else {
//     return true;
//   }
// }