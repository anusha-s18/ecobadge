class AppRouter{
  String name;
  String path;
  AppRouter({
    required this.name,
    required this.path,
  });
}

class Routes{
  static AppRouter navigation = AppRouter(name: "/navigate", path: "/");
  static AppRouter homescreen = AppRouter(name: "/home", path: "/homescreen");
  static AppRouter redeem = AppRouter(name: "/redeem", path: "/redeem");
  static AppRouter profile= AppRouter(name: "/profile", path: "/profile"); 
  // static AppRouter login= AppRouter(name: "/login", path: "/login"); 
  // static AppRouter register= AppRouter(name: "/register", path: "/register"); 

}