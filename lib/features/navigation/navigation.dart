import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecobadge/router/router.dart';
import 'package:iconsax/iconsax.dart';

class NavDisp extends StatelessWidget {
  final int selectedIndex;
  final Widget child;
  const NavDisp({
    super.key,
    required this.selectedIndex,
    required this.child,
  });
    

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Stack(
        children: [
          child,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: 
                const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                    // topLeft: Radius.circular(30),
                    // topRight: Radius.circular(30),
                  ),
                ),
                child: SizedBox(
                  height: 40,
                  child: NavigationBar(
                    icons: [
                      selectedIndex==0? Iconsax.home5:Iconsax.home_1,
                      selectedIndex==1? Iconsax.wallet:Iconsax.wallet4,
                      selectedIndex==2? Iconsax.profile_circle5:Iconsax.profile_2user4,                     
                      selectedIndex==3? Iconsax.setting:Iconsax.setting, 
                    ], 
                    currentIndex: selectedIndex, 
                    onItemTap: (index) => context.go(_indexToTab(index)), 
                    SelectedColor: Colors.white, 
                    Colors: Colors.grey
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

    String _indexToTab(int index) {
    switch (index) {
      case 0:
        return Routes.homescreen.path;
      case 1:
        return Routes.redeem.path;
      case 2:
        return Routes.profile.path;
      case 3:
        return Routes.diagnostics.path;
      default:
        return Routes.homescreen.path;
    }
  }

}



class NavigationBar extends StatefulWidget {
  final List<IconData> icons;
  final int currentIndex;
  final void Function(int index) onItemTap;
  final Color SelectedColor;
  final Color Colors;
  const NavigationBar({super.key,
  required this.icons,
  required this.currentIndex,
  required this.onItemTap,
  required this.SelectedColor,
  required this.Colors,
  });

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (_,constrains){
      double lineSize = constrains.maxWidth / widget.icons.length;
    
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: AnimatedContainer(
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 350),
            margin:
            EdgeInsets.only(left: widget.currentIndex*lineSize+47),
          height: 6,
          width: 28,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.icons.map(
              (e) {
              int index=widget.icons.indexOf(e);
              return Padding(
                padding: 
                    EdgeInsets.symmetric(horizontal: (lineSize -48)/2),
                child: SizedBox(
                  width: 48,
                  child: MaterialButton(
                    elevation: 0,
                    minWidth: 10,
                    height: 25,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)
                    ),
                    highlightColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 8),
                    onPressed: widget.currentIndex==index?null:(){
                      widget.onItemTap(index);
                    },
                    child: Icon(
                      e,
                      color: widget.currentIndex==index?widget.SelectedColor:widget.Colors,
                      size: 24,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
    });
  }
}